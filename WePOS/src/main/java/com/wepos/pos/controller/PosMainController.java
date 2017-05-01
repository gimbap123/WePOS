package com.wepos.pos.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dto.OrdersDetailDto;
import com.wepos.common.dto.OrdersDto;
import com.wepos.common.dto.ProductDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.common.dto.SumOrdersDetailDto;
import com.wepos.common.dto.TablesDto;
import com.wepos.mgr.dto.CategoryDto;
import com.wepos.pos.dao.PosFunctionDao;
import com.wepos.pos.dao.PosMainDao;

@Controller
public class PosMainController {

	@Autowired
	private PosMainDao posMainDao;

	@Autowired
	private PosFunctionDao posFunctionDao;

	// 포스 페이지 이동
	@RequestMapping(value = "/pos/posMain.do")
	public ModelAndView getShopInfo(@RequestParam(value = "mgrId") String mgrId) 
	{

		int shopCode = posMainDao.getShopCode(mgrId);

		// 매장 코드 번호로 매장 정보 Select
		ShopDto shop = posMainDao.getShop(shopCode);
		// 매장 내 테이블 정보 select
		List<TablesDto> tables = posMainDao.getTables(shopCode);
		// 매장 내 테이블 숫자 select
		int tableCount = posMainDao.getTableCount(shopCode);
		// 매장 내 메뉴 select
		List<ProductDto> productList = posMainDao.getProductList(shopCode);
		// 카테고리 정보 select
		List<CategoryDto> category = posMainDao.getCategory(shopCode);

		// 현재 테이블 주문 정보 select ( order_state == 0 인 (결제 전 주문) 항목들만 )
		List<OrdersDto> orderList = posMainDao.getOrderBeforePayment();

		// 결제 전 테이블의 주문 상세 내역 select
		List<SumOrdersDetailDto> ordersDetailList = posMainDao.getOrdersDetailBeforePayment();

		// 이동 가능한 테이블 정보
		List<Integer> movableTableCode = posFunctionDao.getMovableTableList(shopCode);

		ModelAndView mav = new ModelAndView("pos/posMain");
		mav.addObject("shopCode", shopCode);
		mav.addObject("shop", shop);
		mav.addObject("tables", tables);
		mav.addObject("productList", productList);
		mav.addObject("tableCount", tableCount);
		mav.addObject("category", category);
		mav.addObject("orderList", orderList);
		mav.addObject("ordersDetailList", ordersDetailList);
		mav.addObject("movableTableCode", movableTableCode);
		return mav;
	}

	// 주문 내역 DB 저장
	@RequestMapping("/pos/insertOrder.do")
	public String insertOrder(@RequestParam(value = "mgrId") String mgrId,
			@RequestParam(value = "orders") List<?> orders,
			@RequestParam(value = "insertOrdersDetail") List<?> insertOrdersDetail,
			@RequestParam(value = "deleteOrdersDetail") List<?> deleteOrdersDetail)
	{

		List<OrdersDetailDto> insertOddList = new ArrayList<OrdersDetailDto>();
		List<OrdersDetailDto> deleteOddList = new ArrayList<OrdersDetailDto>();

		OrdersDto od = new OrdersDto();
		if (insertOrdersDetail != null) 
		{

			od.setShopCode(Integer.parseInt((String) orders.get(0)));
			od.setTableCode(Integer.parseInt((String) orders.get(1)));
			// 입력하지 않아도 되는 컬럼
			// od.setUserId( userId );
			// od.setPaymentCode( paymentCode );
			// od.setOrderDate( orderDate );
			// od.setOrderState( orderState );

			posMainDao.insertOrders(od);
			int lastOrderCode = posMainDao.getOrderCode();

			for (int i = 0; i < insertOrdersDetail.size(); i = i + 3) 
			{
				OrdersDetailDto odd = new OrdersDetailDto();
				odd.setOrderCode(lastOrderCode);
				odd.setProductCode(Integer.parseInt((String) insertOrdersDetail.get(i)));
				odd.setOrderAmount(Integer.parseInt((String) insertOrdersDetail.get(i + 1)));
				odd.setOrderPrice(Integer.parseInt((String) insertOrdersDetail.get(i + 2)));

				posMainDao.insertOrdersDetail(odd);
				posMainDao.updateTableStateToUsed();
				insertOddList.add(odd);
			}
		}

		// 주문 수정이 있을 때 수행
		if (deleteOrdersDetail != null) 
		{
			for (int i = 0; i < deleteOrdersDetail.size(); i = i + 3) 
			{
				// 남은 취소 주문 수량
				int cancelOrderCount = Integer.parseInt((String) deleteOrdersDetail.get(i + 1));

				OrdersDetailDto odd = new OrdersDetailDto();
				odd.setProductCode(Integer.parseInt((String) deleteOrdersDetail.get(i)));
				odd.setOrderAmount(Integer.parseInt((String) deleteOrdersDetail.get(i + 1)));
				odd.setOrderPrice(Integer.parseInt((String) deleteOrdersDetail.get(i + 2)));
				int unitPrice = odd.getOrderPrice() / odd.getOrderAmount();

				// 최근 주문 수량이 취소 수량보다 작거나 같을경우 db의 최근 주문 내역(OrdersDetail) 삭제
				while (cancelOrderCount > 0) 
				{
					HashMap<String, Integer> orderInfo = new HashMap<String, Integer>();
					orderInfo.put("productCode", odd.getProductCode());
					orderInfo.put("tableCode", od.getTableCode());

					// 최근 주문 수량
					int lastestOrderCount = posMainDao.lastestOrderAmount(orderInfo);
					int deleteOrderCode = posMainDao.getDeleteOrderCode(orderInfo);
					orderInfo.put("orderCode", deleteOrderCode);

					if (lastestOrderCount <= cancelOrderCount)
					{
						// orders_detail 테이블의 정보를 삭제
						posMainDao.deleteOrdersDetail(orderInfo);

					}
					// 최근 주문 수량이 취소수량 보다 클 경우 db 최근 주문내역 update
					else 
					{
						int amount = lastestOrderCount - cancelOrderCount;
						int price = unitPrice * amount;
						odd.setOrderCode(deleteOrderCode);
						odd.setOrderAmount(amount);
						odd.setOrderPrice(price);

						posMainDao.updateOrderAmount(odd);
					}
					cancelOrderCount = cancelOrderCount - lastestOrderCount;
				}
				deleteOddList.add(odd);
			}
		}
		return "redirect:posMain.do?mgrId=" + mgrId;
	}

}

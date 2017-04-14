<%@ page language="java" contentType="application/javascript; charset=UTF-8" pageEncoding="UTF-8"%>

<script>

$(document).ready(function() {
    App.init();
    App.initCounter();
    App.initParallaxBg();
    App.initScrollBar();
    FancyBox.initFancybox();
    App.initAnimateDropdown();
    OwlCarousel.initOwlCarousel();
    ProgressBar.initProgressBarHorizontal();
   
    showTotalPrice(); 
    getShopStatus();
});

setInterval("realTime()", 1000);
function realTime() {
    var now = new Date();
    hours = now.getHours();
    minutes = now.getMinutes();
    seconds = now.getSeconds();

    if (hours > 12) {
        hours -= 12;
        ampm = "오후 ";
    } else {
        ampm = "오전 ";
    }
    if (hours < 10) {
        hours = "0" + hours;
    }
    if (minutes < 10) {
        minutes = "0" + minutes;
    }
    if (seconds < 10) {
        seconds = "0" + seconds;
    }

    document.getElementById("realTime").innerHTML = ampm + hours
      + ":" + minutes + ":" + seconds;
      }
      
// 테이블 클릭 시 주문 모달창 호출
$('.pos-table').on('click', function( event ) {
    var selectedTable = $(this).find('.tableName').html();
    var sumOrderPrice = 0;
    // 모달 창 호출
    $('#orderModal').modal();
    
    // 선택한 테이블 이름 출력 
    $('#selectTableName').text( selectedTable );

    // 주문 메뉴 하나당 주문 현황에 추가
    $(this).find('.productName').each( function(){
      var productName = $(this).contents().get(0).nodeValue;
      var productStock = $(this).children('span').text();
      var productPrice = $(this).children('.productPrice').val();
     
      $('#prevOrderList').children('tbody').append('<tr class="selectMenuList"><td class="menuName">'+productName+'</td><td class="menuCount">'+productStock+'</td><td class="menuPrice">'+productPrice+'</td></tr>');
      sumOrderPrice = sumOrderPrice + Number( productPrice );
    });
    
    $("#prevOrderList").find('#totalPrevOrderPrice').text( sumOrderPrice );
})

// 기존 주문 메뉴 리스트 클릭시
$('#prevOrderList').on('click', 'tr[class="selectMenuList"]', function() {
  var productName = $(this).children('.menuName').text(); 
  var productStock = $(this).children('.menuCount').text(); 
  var productPrice = $(this).children('.menuPrice').text(); 
  var totalPrice = Number( $('#totalPrevOrderPrice').text() );
  
  var unitPrice = Number( productPrice ) / Number( productStock );
  
  if ( productStock > 1 ) {
    $(this).children('.menuCount').text( productStock - 1 ); 
    $(this).children('.menuPrice').text( productPrice - unitPrice ); 
    $('#totalPrevOrderPrice').text( totalPrice - unitPrice );
  
    addOrderList( productName, productStock, productPrice ); 
  }
  else if ( productStock <= 1 ) {
    $('#totalPrevOrderPrice').text( totalPrice - unitPrice );
    addOrderList( productName, productStock, productPrice ); 
    $(this).remove();
  }
 
  var deleteTotalPrice = 0;
  $('#cancelOrderList').find('.selectMenuList').each( function(){
    var unitPrice = Number( $(this).children('.menuPrice').text() );
    deleteTotalPrice = deleteTotalPrice + unitPrice;
  });
  
  $('#totalCancelOrderPrice').text( deleteTotalPrice );
});

function addOrderList( name, amount, price ) {
  var isSelectMenu = true; 
  var unitPrice = price / amount;
  
  if ( $('#cancelOrderList').find('.selectMenuList').length < 1 ) {
      $('#cancelOrderList').children('tbody').append('<tr class="selectMenuList"><td class="menuName">'+name+'</td><td class="menuCount">'+1+'</td><td class="menuPrice">'+unitPrice+'</td></tr>');
  }
  else {
    $('#cancelOrderList').find('.selectMenuList').each( function() {
      // 추가 하려는 메뉴가 이미 리스트에 있을 경우
      if ( $(this).children('.menuName').text() === name ) {
        var menuCount = Number( $(this).children(".menuCount").text() );
        var menuPrice = Number( $(this).children(".menuPrice").text() );
          
        $(this).children(".menuCount").text( menuCount + 1 );
        $(this).children(".menuPrice").text( menuPrice + unitPrice );
        isSelectMenu = true;
        return false;
      }
      else {
        isSelectMenu = false; 
      }
    });
  }
  if ( isSelectMenu == false ) {
      $('#cancelOrderList').children('tbody').append('<tr class="selectMenuList"><td class="menuName">'+name+'</td><td class="menuCount">'+1+'</td><td class="menuPrice">'+unitPrice+'</td></tr>');
  }
}



// 주문 선택 내역 클릭시 
$('#newOrderList').on('click', 'tr[class="selectMenuList"]', function() {
  var productName = $(this).children('.menuName').text(); 
  var productStock = $(this).children('.menuCount').text(); 
  var productPrice = $(this).children('.menuPrice').text(); 
  var totalPrice = Number( $('#totalNewOrderPrice').text() );
  
  var unitPrice = Number( productPrice ) / Number( productStock );
  
  if ( productStock > 1 ) {
    $(this).children('.menuCount').text( productStock - 1 ); 
    $(this).children('.menuPrice').text( productPrice - unitPrice ); 
    $('#totalNewOrderPrice').text( totalPrice - unitPrice );
  }
  
  else if ( productStock <= 1 ) {
    $('#totalNewOrderPrice').text( totalPrice - unitPrice );
    $(this).remove();
  }
});

$('#newOrderList').find('.selectMenuList').on('click', function(){
  alert( $(this).children('.menuName').text() );
});

// 주문 모달 창 취소 버튼 클릭시 이벤트
$(document).on('click','#orderCancelButton', function(){
  $('.selectMenuList').remove();
  $('#totalNewOrderPrice').text("");
  $('#totalCancelOrderPrice').text("");
});

// 주문 모달 창 닫기(x) 버튼 클릭시 이벤트
$('#orderModal').on('hide.bs.modal', function() {
  $('.selectMenuList').remove();
  $('#totalNewOrderPrice').text("");
  $('#totalCancelOrderPrice').text("");
});


function orderMenu( i, price, stock ) {
    var orderMenuName = $('.menuName')[i].innerHTML;
    
    // 선택 된 메뉴인지 체크
    var isSelectedMenu = true;
    
    // 선택된 메뉴 리스트가 없으면
    if( $('#newOrderList').find('.selectMenuList').length < 1 ) {
	    $("#newOrderList").children("tbody").append('<tr class="selectMenuList"></td><td class="menuName">'+orderMenuName+'</td><td class="menuCount">1</td><td class="menuPrice">'+price+'</td></tr>');
    }
    else {
        $('#newOrderList').find('.selectMenuList').each( function() {
            // 기존에 주문한 메뉴에 수량을 더함
            if ( $(this).children(".menuName").text() === orderMenuName ) {
        	var menuCount = Number( $(this).children(".menuCount").text() );
        	var menuPrice = Number( $(this).children(".menuPrice").text() );
        	$(this).children(".menuCount").text(menuCount + 1);
        	$(this).children(".menuPrice").text(menuPrice + price);
        	isSelectedMenu = true;
        	return false;
            }
          // 새로운 리스트 생성
            else {
        	isSelectedMenu = false;
            }
        });
    }
    if ( isSelectedMenu == false ) {
      $("#newOrderList").children("tbody").append('<tr class="selectMenuList"><td class="menuName">'+orderMenuName+'</td><td class="menuCount">1</td><td class="menuPrice">'+price+'</td></tr>');
    }

    var unitPrice = 0;
    var totalPrice = 0;

    $('#newOrderList').find('.selectMenuList').each( function() {
      var menuPrice = Number( $(this).children(".menuPrice").text() );
      totalPrice = totalPrice + menuPrice;
    })
    
    $("#totalNewOrderPrice").text( totalPrice );
}

$('#cancelOrderList').on('click', 'tr[class="selectMenuList"]', function() {
  var productName = $(this).children('.menuName').text(); 
  var productStock = $(this).children('.menuCount').text(); 
  var productPrice = $(this).children('.menuPrice').text(); 
  var totalPrice = Number( $('#totalCancelOrderPrice').text() );
  var unitPrice = Number( productPrice ) / Number( productStock );
  
  if ( productStock > 1 ) {
    $(this).children('.menuCount').text( productStock - 1 ); 
    $(this).children('.menuPrice').text( productPrice - unitPrice ); 
    $('#totalCancelOrderPrice').text( totalPrice - unitPrice );
  
    addOrderList2( productName, productStock, productPrice ); 
  }
  else if ( productStock <= 1 ) {
    $('#totalCancelOrderPrice').text( totalPrice - unitPrice );
    addOrderList2( productName, productStock, productPrice ); 
    $(this).remove();
  }

  var deleteTotalPrice = 0;
  $('#prevOrderList').find('.selectMenuList').each( function(){
    var unitPrice = Number( $(this).children('.menuPrice').text() );
    deleteTotalPrice = deleteTotalPrice + unitPrice;
  });
  
  $('#totalPrevOrderPrice').text( deleteTotalPrice );
});

function addOrderList2( name, amount, price ) {
  var isSelectMenu = true; 
  var unitPrice = price / amount;
  
  if ( $('#prevOrderList').find('.selectMenuList').length < 1 ) {
      $('#prevOrderList').children('tbody').append('<tr class="selectMenuList"><td class="menuName">'+name+'</td><td class="menuCount">'+1+'</td><td class="menuPrice">'+unitPrice+'</td></tr>');
  }
  else {
    $('#prevOrderList').find('.selectMenuList').each( function() {
      // 추가 하려는 메뉴가 이미 리스트에 있을 경우
      if ( $(this).children('.menuName').text() === name ) {
        var menuCount = Number( $(this).children(".menuCount").text() );
        var menuPrice = Number( $(this).children(".menuPrice").text() );
          
        $(this).children(".menuCount").text( menuCount + 1 );
        $(this).children(".menuPrice").text( menuPrice + unitPrice );
        isSelectMenu = true;
        return false;
      }
      else {
        isSelectMenu = false; 
      }
    });
  }
  if ( isSelectMenu == false ) {
      $('#prevOrderList').children('tbody').append('<tr class="selectMenuList"><td class="menuName">'+name+'</td><td class="menuCount">'+1+'</td><td class="menuPrice">'+unitPrice+'</td></tr>');
  }
}


// 주문 버튼 클릭
$(document).on('click','#orderSubmitButton', function(){
    
    var orders = new Array();
    var insertOrdersDetail = new Array(); 
    var deleteOrdersDetail = new Array(); 
   
    var shopCode = ${shopCode};
    var tableCode;
    
    var productCode;
    var orderAmount; 
    var orderPrice;
    
    $('.pos-table').each( function() {
      if ( $(this).find('.tableName').text() === $('#selectTableName').text() ){
        tableCode = $(this).attr('id');
      }
    });
   
    // Orders 테이블에 insert 하기 위한 정보 
    orders.push( shopCode );
    orders.push( tableCode );
   
    // orders_detail 테이블에 insert 하기 위한 정보  
    $('#newOrderList').find('.selectMenuList').each( function() {
        var ordersDetail = new Array();
        
        var menuName = $(this).children('.menuName').text();
        $('h3[class=menuName]').each( function() {
          if ( $(this).text() === menuName ) {
            var productCode = $(this).attr('id');
            ordersDetail.push( productCode );
            return false;
          }
        });
        ordersDetail.push( $(this).children('.menuCount').text() );
        ordersDetail.push( $(this).children('.menuPrice').text() );

        insertOrdersDetail.push( ordersDetail );
    })
    
    // orders_detail 테이블에 delete 하기 위한 정보
    $('#cancelOrderList').find('.selectMenuList').each( function() {
      var ordersDetail = new Array();
      
      var menuName = $(this).children('.menuName').text();
      $('h3[class=menuName]').each( function() {
        if ( $(this).text() === menuName ) {
          var productCode = $(this).attr('id');
          ordersDetail.push( productCode );
          return false;
        }
      });
      ordersDetail.push( $(this).children('.menuCount').text() );
      ordersDetail.push( $(this).children('.menuPrice').text() );
      
      deleteOrdersDetail.push( ordersDetail );
    });
    
    $('#orderForm').children('input[name=orders]').attr( "value", orders );
    $('#orderForm').children('input[name=insertOrdersDetail]').attr( "value", insertOrdersDetail );
    $('#orderForm').children('input[name=deleteOrdersDetail]').attr( "value", deleteOrdersDetail );
    
    $('#orderForm').submit();
});

function showTotalPrice(){
  var totalPrice = 0;
  $('.totalOrderPrice').each( function() {
    totalPrice += Number( $(this).text() );
  });
  
  $('#totalPrice').text( totalPrice );
}

function getShopStatus() {
  var totalCustomer = 0;
  var useTableCount = 0;
  $('.pos-table').each( function() {
  //alert( Number( $(this).find('.totalOrderPrice').text() ) );
    if ( Number( $(this).find('.totalOrderPrice').text() ) > 0 ) {
      var srcStr = $(this).find('.customerCount').text();
      totalCustomer += Number( srcStr.substring(0, srcStr.length-1) );
      useTableCount += 1;
    }
  });
  
  $('#totalCustomer').text( totalCustomer );
  $('#useTableCount').text( useTableCount + " / " + $('#useTableCount').text() );
  
}
</script>
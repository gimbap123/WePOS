/**
 * 
 */

// Modal Open
// 테이블 클릭 시 주문 모달창 호출
$(document).on('click', '.pos-table', function(){
    var selectedTable = $(this).find('.tableName').html();
    $('#orderModal').modal();
    $('#orderModalLabel').children('small').text( selectedTable );
})

// 주문 메뉴 리스트 클릭시 주문 취소
$(document).on('click','.selectMenuList', function(){
    var cancel = confirm( "[ "+$(this).children('.menuName').text()+" ] 주문을 취소 하시겠습니까?");
    if ( cancel == true ){
	$(this).remove();
    }
    calcPrice();
});

$(document).on('click','#orderCancelButton', function(){
    $('#order-list').children('tbody').empty();
    calcPrice();
});

$(document).on('click','#orderSubmitButton', function(){
    var orderList = new Array();
    $('.selectMenuList').each( function() {
        var order = new Array();
        //order.push( "<c:out values="${shopCode}" />");
	order.push( $(this).children(".menuName").text() );
	order.push( $(this).children(".menuCount").text() );
	order.push( $(this).children(".menuPrice").text() );

	orderList.push( order );
    })
    
    $('#orderForm').children('input').attr( "value", orderList );
    $('#orderForm').submit();
});

function orderMenu( i, price, stock ) {
    var orderMenuName = $('.menuName')[i].innerHTML;
    
    // 선택 된 메뉴인지 체크
    var isSelectedMenu = true;
    
    // 선택된 메뉴 리스트가 없으면
    if( $('.selectMenuList').length < 1 ) {
	$("#order-list").children("tbody").append('<tr class="selectMenuList"></td><td class="menuName">'+orderMenuName+'</td><td class="menuCount">1</td><td class="menuPrice">'+price+'</td></tr>');
    }
    else {
        $('.selectMenuList').each( function() {
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
	$("#order-list").children("tbody").append('<tr class="selectMenuList"><td class="menuName">'+orderMenuName+'</td><td class="menuCount">1</td><td class="menuPrice">'+price+'</td></tr>');
    }
    calcPrice();
}

function calcPrice() {
    var unitPrice = 0;
    var totalPrice = 0;
    $('.selectMenuList').each( function() {
	menuPrice = Number( $(this).children(".menuPrice").text() );
	totalPrice = totalPrice + menuPrice;
    })
    
    $("#totalPrice").text( totalPrice );
}
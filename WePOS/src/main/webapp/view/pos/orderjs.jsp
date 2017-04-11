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
    $('#orderModal').modal();
    $('#selectTableName').text( selectedTable );
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
    var orders = new Array();
    var ordersDetailList = new Array(); 
   
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
    
    orders.push( shopCode );
    orders.push( tableCode );
    
    $('.selectMenuList').each( function() {
        var ordersDetail = new Array();
        
        var menuName = $(this).children('.menuName').text();
        $('h3[class=menuName]').each( function() {
          if ( $(this).text() === menuName ) {
            var productCode = $(this).attr('id');
            alert( productCode );
            ordersDetail.push( productCode );
            return false;
          }
        }); 
       
        ordersDetail.push( $(this).children('.menuCount').text() );
        ordersDetail.push( $(this).children('.menuPrice').text() );

        ordersDetailList.push( ordersDetail );
    })
    
    $('#orderForm').children('input[name=orders]').attr( "value", orders );
    $('#orderForm').children('input[name=ordersDetailList]').attr( "value", ordersDetailList );
    
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

</script>
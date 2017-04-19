<%@ page language="java" contentType="application/javascript; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>

// 결제창 취소 버튼 클릭시 이벤트
$(document).on('click','#paymentCancelButton', function(){
  $('#paymentTable').children('tbody').children('tr').remove();
  $('#cashPaymentPrice').text("");
});

// 결제창 닫기(x) 버튼 클릭시 이벤트
$('#paymentModal').on('hide.bs.modal', function() {
  $('#paymentTable').children('tbody').children('tr').remove();
  $('#cashPaymentPrice').text("");
});

//
$(document).on('click', '#cashPaymentButton', function() {
//  $('#cashNavTab').addClass('active');
//  $('#cardNavTab').removeClass('active');
  $('#paymentTab a[href="#cash"]').tab( 'show' );
  getPaymentInfo();
});

$(document).on('click', '#cardPaymentButton', function() {
//  $('#cashNavTab').removeClass('active');
//  $('#cardNavTab').addClass('active');
  $('#paymentTab a[href="#card"]').tab( 'show' );
  getPaymentInfo();
});
function getPaymentInfo(){
  var selectedTableCode = $('#selectedTable').attr('data-code');
   
  $('#paymentModal').modal();
  $('#paymentTableName').text( tableName );
 
   $.ajax({
     url : "/WePOS/pos/getPaymentInfo.do",
     type: "get",
     data : { "tableCode" : selectedTableCode },
     success : function( responseData ){
         var data = JSON.parse( responseData );
         if( !data ){
             alert("존재하지 않는 테이블 입니다");
             return false;
         }
        
         for ( var i = 0; i < data.length; i++ ) {
            var row = $('#paymentTable').children('tbody');
            var unitPrice = data[i].sumOrderPrice / data[i].sumOrderAmount;
            row.append('<tr><td>'+(i+1)+'</td><td>'+data[i].productName+'</td><td>'+unitPrice+'</td><td>'+data[i].sumOrderAmount+'</td><td class="orderPrice">'+data[i].sumOrderPrice+'</td></tr>');
         }

         var totalPaymentPrice = 0; 
         $('.orderPrice').each( function(){
            totalPaymentPrice += Number( $(this).text() );
         });
         
         $('#paymentTable').find('.totalPaymentPrice').text( totalPaymentPrice );
         $('#cashPaymentPrice').val( totalPaymentPrice );
         $('#cardPaymentPrice').val( totalPaymentPrice );
      }
   });
 }
 
$('.receivedMoneyButton').on('click', function() {
  var receivedMoney = $('#totalReceivedMoney').val();
  $('#totalReceivedMoney').val( Number( receivedMoney ) + Number( $(this).text() ) );
  if ( $('#totalReceivedMoney').val() < 0 ) {
    $('#totalReceivedMoney').val( 0 );
  }
 
  $('#changePrice').val( $('#totalReceivedMoney').val() - $('#cashPaymentPrice').val() );
  if( $('#changePrice').val() < $('#cashPaymentPrice').val() ) {
    $('#changePrice').addClass( "bg-danger" );
  }
});

$('#totalReceivedMoney').on('change', function() {
  $('.receivedMoneyButton').trigger('click');
});

$('#paymentSubmitButton').on('click', function() {
  //alert( shopCode + "\n" + tableCode );
  $('#cashPaymentForm').children('#shopCode').attr('value', shopCode );
  $('#cashPaymentForm').children('#tableCode').attr('value', tableCode );
  
  $('#cashPaymentForm').submit();
});

// 카드번호 랜덤생성
$(document).on('click', '#cardReadButton', function() {
  var text = getRandomText( 16 ); 
  $('#cardNumber').val( text );
  
  $('#cardPaymentResult').attr('placeholder', '승인완료');
  
});

function getRandomText( stringLength ) {
  var text = "";
  //var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  var possible = "0123456789";

  for( var i=0; i < stringLength; i++ )
      text += possible.charAt(Math.floor(Math.random() * possible.length));

  return text;
}
</script>
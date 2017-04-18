<%@ page language="java" contentType="application/javascript; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>

// 결제창 취소 버튼 클릭시 이벤트
$(document).on('click','#paymentCancelButton', function(){
  $('#paymentTable').children('tbody').children('tr').remove();
  $('#totalPaymentPrice').text("");
});

// 결제창 닫기(x) 버튼 클릭시 이벤트
$('#paymentModal').on('hide.bs.modal', function() {
  $('#paymentTable').children('tbody').children('tr').remove();
  $('#totalPaymentPrice').text("");
});

$(document).on('click', '#cashPayment', function() {
  var selectedTableCode = $('#selectedTable').attr('data-code');
   
  $('#paymentModal').modal();
 
  $('#paymentTableName').text( tableName );
 
   $.ajax({
     url : "/WePOS/pos/posPayment.do",
     type: "get",
     data : { "tableCode" : selectedTableCode },
     success : function( responseData ){
         //$("#ajax").remove();
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
         $('#paymentPanel').find('#totalPaymentPrice').val( totalPaymentPrice );
      }
   });
 });
 
$('.receivedMoneyButton').on('click', function() {
  var receivedMoney = $('#totalReceivedMoney').val();
  $('#totalReceivedMoney').val( Number( receivedMoney ) + Number( $(this).text() ) );
  if ( $('#totalReceivedMoney').val() < 0 ) {
    $('#totalReceivedMoney').val( 0 );
  }
 
  $('#changePrice').val( $('#totalReceivedMoney').val() - $('#totalPaymentPrice').val() );
  if( $('#changePrice').val() < $('#totalPaymentPrice').val() ) {
    $('#changePrice').addClass( "bg-danger" );
  }
});

</script>
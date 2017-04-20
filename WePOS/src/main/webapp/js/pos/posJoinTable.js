/**
 * 
 */

// 취소 버튼 클릭시 이벤트
$(document).on('click','#joinCancelButton', function(){
  $('#joinFromTable').val("");
  $('#joinToTable').val("");
});

// 닫기(x) 버튼 클릭시 이벤트
$('#joinTableModal').on('hide.bs.modal', function() {
  $('#joinFromTable').val("");
  $('#joinToTable').val("");
});

//
$(document).on('click', '#joinButton', function() {
    if ( checkActiveTable() == false ) {
      alert( "비어있는 테이블입니다.")
    }
    else {
      $('#joinTableModal').modal();
      $('#joinFromTable').val( tableName );
      $('#joinFromTableCode').val( tableCode );
    }
});

$(document).on('click', '.pos-join-table', function() {
  $('#joinToTable').val( $(this).data("name") );
  $('#joinToTableCode').val( $(this).data("code") );
});

$(document).on('click', '#joinSubmitButton', function() {
  $('#joinTableForm input[name="shopCode"]').val( shopCode );
  $('#joinTableForm').submit();
});

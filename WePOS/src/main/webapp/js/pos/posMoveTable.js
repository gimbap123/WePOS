/**
 * 
 */

// 취소 버튼 클릭시 이벤트
$(document).on('click','#moveCancelButton', function(){
  $('#fromTable').val("");
  $('#toTable').val("");
});

// 닫기(x) 버튼 클릭시 이벤트
$('#moveTableModal').on('hide.bs.modal', function() {
  $('#fromTable').val("");
  $('#toTable').val("");
});

//
$(document).on('click', '#moveButton', function() {
  if( checkActiveTable() == false) {
    alert("비어 있는 테이블입니다.");
  }
  else {
    $('#moveTableModal').modal();
    $('#fromTable').val( tableName );
    $('#fromTableCode').val( tableCode );
   }

});

$(document).on('click', '.pos-move-table', function() {
  $('#toTable').val( $(this).data("name") );
  $('#toTableCode').val( $(this).data("code") );
});

$(document).on('click', '#moveSubmitButton', function() {
  $('#moveTableForm input[name="shopCode"]').val( shopCode );
  $('#moveTableForm').submit();
});

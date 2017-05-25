/**
 * 
 */
var shopCode = $('#shop').attr('data-code');
var tableCode;
var tableName;

/*$(document).ready(function() {
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
});*/

// 결제화면 회원검색 버튼 클릭시 이벤트
$(document).on('click','#searchUserButton', function(){
	$('#searchUserTable').children('tbody').empty();
	$('#selectedUserName').empty();
	var phoneNumber=$('#userPhoneNum').val();
	if(phoneNumber==''){
		alert("연락처를 입력하세요");
		$('#userPhoneNum').focus();
		return false;
	}
	else{		
		searchUser(phoneNumber);
		$('#userSearchModal').modal();
		$('#searchValue').html(phoneNumber);
	}
});

function searchUser(phoneNumber){
	$.ajax({
	     url : "/WePOS/pos/getUserGradeInfo.do",
	     type: "get",
	     data : { "userPhone" : phoneNumber },
	     success : function( responseData ){
	         var data = JSON.parse( responseData );
	         if( data.length<1 ){
	             alert("존재하지 않는 번호입니다");
	             return false;
	         }else{
	        	 for ( var i = 0; i < data.length; i++ ) {
	 	            var row = $('#searchUserTable').children('tbody');
	 	            row.append('<tr id="selectedUser">'+
	 	            					'<td>'+(i+1)+'</td>'+
	 	            					'<th><a href="#" id="userNameTh">'+data[i].userName+'</a></th>'+
	 	            					'<td id="userIdTd">'+data[i].userId+'</td>'+
	 	            					'<td>'+data[i].userExpense+'</td>'+
	 	            				'</tr>');
	 	         }
	        	 
	        	 $(document).on('click', '#selectedUser', function( event ) {
	        		 var userName=$(this).find("#userNameTh").text();
	        		 var userId=$(this).find("#userIdTd").text();
	        		 $('#selectedUserName').text(userName);
	        		 $('#userName').text(userName);
	        		 $('#userName').attr("style","color:blue");
	        		 $('#comment').text("님 감사합니다.");
	        		 $('input[name=userId]').val(userId);
	        		 
	 	        });
	         }
	         
	      }
	   });
}

$(document).on('click','#searchCompleteButton',function(event){
	$('#userSearchModal').modal("hide");
	$('#userPhoneNum').val("");
})




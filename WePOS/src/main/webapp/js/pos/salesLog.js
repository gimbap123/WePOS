function checkForm(){
	if($('#calendarBegin').val()==''){
		alert("시작일을 선택해주세요");
		return false;
	}else if($('#calendarEnd').val()==''){
		alert("종료일을 선택해주세요");
		return false;
	}else if($('#productCode').val()==999){
		alert("메뉴를 선택해주세요");
		return false;
	}else if($('#searchType').val()==999){
		alert("정렬방식을 선택해주세요");
		return false;
	}else if($('#monthBegin').val()==999 || $('#monthEnd').val()==999){
		alert("조회하실 월을 선택해주세요");
		return false;
	}else{
		$('#searchForm').submit();
	}
}

$(function(){
	$('#searchType').change(function(){
		var searchType=this.value;
		if(searchType==1 || searchType==2){
			$('#month *').remove();
			var add='';
			var add1='';
			add+='<td style="text-align: center;vertical-align: middle;">시작일</td>'+
						'<td style="text-align: center">'+
							'<input type="text" id="calendarBegin" name="calendarBegin" placeholder="클릭하여 선택" style="text-align:center">'+
						'</td>'
			add1+='<td style="text-align: center;vertical-align: middle;">종료일</td>'+
						'<td style="text-align: center;vertical-align: middle;">'+
							'<input type="text" id="calendarEnd" name="calendarEnd" placeholder="클릭하여 선택" style="text-align:center">'+
						'</td>'
			$('#newStart').html(add);
			$('#newEnd').html(add1);
			
			$(function() {
				$("#calendarBegin").datepicker(
						{
							showMonthAfterYear : true,
							maxDate : '-0',
							yearSuffix : '년',
							monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
									'8월', '9월', '10월', '11월', '12월' ],
							monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
									'7월', '8월', '9월', '10월', '11월', '12월' ],
							dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
							onClose: function( selectedDate ) {
							   $( "#calendarEnd" ).datepicker( "option", "minDate", selectedDate );
							}
						});
				//옵션  : 매개변수값 2번째가 옵션의 타입이며 3번째 항목은 옵션에 대한 설정 값
				$("#calendarBegin").datepicker("option", "dateFormat", "yy-mm-dd"); //데이터 포맷으로 날짜의 반환 타입을 지정
				$("#calendarBegin").datepicker("option", "showAnim", "slideDown"); //달력의 표시 형태

				$("#calendarEnd").datepicker(
						{
							showMonthAfterYear : true,
							maxDate : '-0',
							yearSuffix : '년',
							monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
									'8월', '9월', '10월', '11월', '12월' ],
							monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
									'7월', '8월', '9월', '10월', '11월', '12월' ],
							dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
							onClose: function( selectedDate ) {
								$( "#calendarBegin" ).datepicker( "option", "maxDate", selectedDate );
							}
						});
				$("#calendarEnd").datepicker("option", "dateFormat", "yy-mm-dd");
				$("#calendarEnd").datepicker("option", "showAnim", "slideDown");

			});
		}
		if(searchType==3){
			$('#newStart *').remove();
		    $('#newEnd *').remove(); 
			var month='';
			month+='<td style="text-align: center;vertical-align: middle;">월</td><td style="text-align: center">'+
								'<select class="form-control" id="monthBegin" name="monthBegin" style="width:45%;display:inline">'+
									'<option value="999">선택</option>'
										for(var i=1;i<=12;i++){
											month+='<option value="2017-0'+i+'-01">'+i+'월</option>'
										}
			month+='</select> ~ '+
							'<select class="form-control" id="monthEnd" name="monthEnd" style="width:45%;display:inline">'+
								'<option value="999">선택</option>'
									for(var i=1;i<=12;i++){
										if(i==1 || i==3 || i==5 || i==7 || i==8 || i==10 || i==12)
											month+='<option value="2017-0'+i+'-31">'+i+'월</option>'
										else if(i==2)
											month+='<option value="2017-0'+i+'-28">'+i+'월</option>'
										else
											month+='<option value="2017-0'+i+'-30">'+i+'월</option>'										
									}
			month+='</select></td>'
			$('#month').html(month);
		}
	});
})


function checkForm(){
	if($('#calendarBegin').val()==''){
		alert("시작일을 확인해주세요");
		return false;
	}else if($('#calendarEnd').val()==''){
		alert("종료일을 확인해주세요");
		return false;
	}else if($('#productCode').val()==999){
		alert("메뉴를 선택해주세요");
		return false;
	}else if($('#searchType').val()==999){
		alert("정렬방식을 선택해주세요");
		return false;
	}else{
		$('#searchForm').submit();
	}
}

$(function(){
	$('#searchType').change(function(){
		var searchType=this.value;
		if(searchType==1 || searchType==2){
			$('#week *').remove();
			var add='';
			var add1='';
			add+='<td style="text-align: center;vertical-align: middle;">시작일</td><td style="text-align: center">'
			add+='<input type="text" id="calendarBegin" name="calendarBegin" placeholder="클릭하여 선택" style="text-align:center" max=sysdate>'
			add+='</td>'
			add1+='<td style="text-align: center;vertical-align: middle;">종료일</td>'
			add1+='<td style="text-align: center;vertical-align: middle;">'
			add1+='<input type="text" id="calendarEnd" name="calendarEnd" placeholder="클릭하여 선택" style="text-align:center">'
			add1+='</td>'
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
			month+='<td style="text-align: center;vertical-align: middle;">월</td><td style="text-align: center">'
			month+='<select class="form-control" id="monthBegin" name="monthBegin" style="width:45%;display:inline">'
			month+='<option value="999">선택</option>'
			month+='<option value="2017-01-01">1월</option>'
			month+='<option value="2017-02-01">2월</option>'
			month+='<option value="2017-03-01">3월</option>'
			month+='<option value="2017-04-01">4월</option>'
			month+='<option value="2017-05-01">5월</option>'
			month+='<option value="2017-06-01">6월</option>'
			month+='<option value="2017-07-01">7월</option>'
			month+='<option value="2017-08-01">8월</option>'
			month+='<option value="2017-09-01">9월</option>'
			month+='<option value="2017-10-01">10월</option>'
			month+='<option value="2017-11-01">11월</option>'
			month+='<option value="2017-12-01">12월</option>'
			month+='</select>~'
			month+='<select class="form-control" id="monthEnd" name="monthEnd" style="width:45%;display:inline">'
			month+='<option value="999">선택</option>'
			month+='<option value="2017-02-01">1월</option>'
			month+='<option value="2017-03-01">2월</option>'
			month+='<option value="2017-04-01">3월</option>'
			month+='<option value="2017-05-01">4월</option>'
			month+='<option value="2017-06-01">5월</option>'
			month+='<option value="2017-07-01">6월</option>'
			month+='<option value="2017-08-01">7월</option>'
			month+='<option value="2017-09-01">8월</option>'
			month+='<option value="2017-10-01">9월</option>'
			month+='<option value="2017-11-01">10월</option>'
			month+='<option value="2017-12-01">11월</option>'
			month+='<option value="2018-01-01">12월</option>'
			month+='</select>'
			month+='</td>'
			$('#month').html(month);
		}
	});
})


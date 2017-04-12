//수정 버튼을 눌렀을때
function repEdit(replyContent, replyNumber, cnts){
	$(function(){
		$(this).find('.repContents'+cnts).html("<textarea rows='1' cols='100%' style='resize: none; width: 100%' name='replyContents' id='replyContents' maxlength='100'>"+replyContent+"</textarea> <a href='javascript:replyChecks(+"+replyNumber+")' style='float: right;'>수정</a>");
	});
}

//댓글 수정 확인
function replyChecks(replyNumber){
	if($('#replyContents').val()==null || $('#replyContents').val()=="") {
		alert("내용을 입력해 주세요.");
		$('#replyContents').focus();
		return false;
	}
	document.boardReplys.submit();
}

//댓글 아이디 확인
function checkRepId(totalId){
	//alert(totalId); =>댓글작성자
	//alert($('#totalId').val()); =>접속한계정
	
	if($('#totalId').val()==totalId){
		$(document).on('mouseover', '.dropdown', function() {
			$(this).find('.dropdown-content').show();
		});
		
		$(document).on('mouseout', '.dropdown', function() {
			$(this).find('.dropdown-content').hide();
		});
	}
	else{
		$(document).on('mouseover', '.dropdown', function() {
			$(this).find('.dropdown-content').hide();
		});
	}
	return false;
}
	
//댓글
function replyCheck(){
	if($('#replyContent').val()==null || $('#replyContent').val()=="") {
		alert("내용을 입력해 주세요.");
		$('#replyContent').focus();
		return false;
	}
	
	document.boardReply.submit();
}

//글 삭제하기
function boardDelete(){
	var del = confirm("이 글을 정말 삭제할까요?");
	if(del == true){ 
	  alert("글이 정상적으로 삭제되었습니다")
	  document.boardDetail.submit();
	}
	else if(del == false){
	  alert("글 삭제가 최소되었습니다")
	  return false;
	}
}

//글 검색하기
function searchCheck(){
	if(document.searchBoard.keyWord.value=='' && !document.searchBoard.kwyField.value=='all'){
		alert('검색어를 입력하세요');
		document.searchBoard.keyWord.focus();
		return false;
	}
}


//글수정하기
function boardRewriteProc()
{
	if(document.boardRewrite.boardTitle.value=="" || document.boardRewrite.boardTitle.value==null){
		alert("제목을 입력하세요");
		document.boardRewrite.boardTitle.focus();
		return false;
	}
	
	if(document.boardRewrite.boardContent.value=="" || document.boardRewrite.boardContent.value==null){
		alert("내용을 입력하세요");
		document.boardRewrite.boardContent.focus();
		return false;
	}
	 
	alert("글이 성공적으로 수정되었습니다!");
	document.boardRewrite.submit();
}


//글쓰기
function checkWrite(){
		if(document.boardWrite.boardTitle.value=="" || document.boardWrite.boardTitle.value==null){
			alert("제목을 입력하세요");
			document.boardWrite.boardTitle.focus();
			return false;
		}
	
		if(document.boardWrite.totalId.value=="" || document.boardWrite.totalId.value==null){
			alert("아이디를 입력하세요");
			document.boardWrite.totalId.focus();
			return false;
		}
		
		if(document.boardWrite.boardContent.value=="" || document.boardWrite.boardContent.value==null){
			alert("내용을 입력하세요");
			document.boardWrite.boardContent.focus();
			return false;
		}
		
		alert("글이 성공적으로 등록되었습니다!");
		document.boardWrite.submit();
	}


	



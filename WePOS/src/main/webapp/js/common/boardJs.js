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


	



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- Modal -->
<div class="modal fade" id="userSearchModal" tabindex="-1" role="dialog" aria-labelledby="paymentModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h3 class="modal-title">회원 검색 (***-****-<span id="searchValue"></span>)</h3>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-sm-12">
            <table id="searchUserTable" class="table table-striped table-hover table-responsive">
              <thead>
                <tr class="info">
                  <th>#</th>
                  <th>이름</th>
                  <th>ID</th>
                  <th>누적금액</th>
                </tr>
              </thead>

              <tbody>
              	<%-- <c:forEach var="i" begin="0" end="${fn:length(userInfo)}">
              		<tr>
              			<td>(i+1)</td>
	 	            	<th><a href="#" id="userNameTh">${userInfo[i].userName}</a></th>
	 	            	<td id="userIdTd">${userInfo[i].userId}</td>
	 	            	<td>${userInfo[i].userExpense}</td>
              		</tr>
              	</c:forEach> --%>
              </tbody>

              <tfoot>
                <tr>
                  <th colspan=3 class="success" style="text-align:center"><h3>회원명</h3></th>
                  <th class="totalPaymentPrice warning" style="text-align:center; vertical-align:middle; color:blue" id="selectedUserName"></th>
                </tr>
              </tfoot>
            </table>
          </div>
         
        </div>
        <!-- End row -->
      </div>
      <br>
      <div class="modal-footer">
      	<button type="button" id="searchCompleteButton" class="btn btn-primary">완료</button>
        <button type="button" id="searchCancelButton" class="btn btn-default" data-dismiss="modal">취소</button>
        <span style="float:left">원하시는 고객의 이름을 클릭 후 완료버튼을 누르세요</span>
      </div>
    </div>
  </div>
</div>
<!-- /.modal -->

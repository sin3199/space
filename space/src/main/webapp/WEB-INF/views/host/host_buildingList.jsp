<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../host_top.jsp"%>
<!-- center// -->

<script type="text/javascript">
	function checkDel(space_no){
		var isDel = window.confirm("정말로 삭제하시겠습니까?")
		if (isDel){
			document.d.space_no.value = space_no
			document.d.submit()
		}
	}
	
	function checkFix(space_no){
		document.f.space_no.value = space_no
		document.f.submit()
	}
</script>


<div class="container">

	<div class="py-5 text-center">
	  <h2>건물 리스트</h2>
	</div>
	
  <hr class="mb-4">

	<form name="a" action="room_list.do" method="post">
		<table class="table table-hover">
			<thead class="thead-dark">
				<tr>
					<th class="col-1">No.</th>
					<th class="col-4">Name</th>
					<th class="col-3">BusinessNumber</th>
					<th class="col-2">Status</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty listHostBuilding}">
					<tr>
						<td colspan="6">등록된 근물이 없습니다.</td>
					</tr>
				</c:if>
				<c:set var="page_no" value="${requestScope.page_no}" />
				<c:forEach var="sdto" items="${listHostBuilding}">
					<tr>
						<th>
							<c:out value="${page_no}" /> 
							<c:set var="page_no" value="${page_no-1}" />
						</th>
						<td>
							<button type="submit" name="space_no" value="${sdto.getSpace_no()}"
								style="width: 100%; height: 100%; border: none; background-color: transparent; text-align: left; font-weight: bold;">
								${sdto.space_nm}
							</button>
						</td>
						<td>${sdto.space_comnum}</td>
						<td>
							<div class="float-right">
								<a href="javascript:checkFix('${sdto.space_no}')" class="btn btn-dark btn-icon-split "> 
									<span class="text">수정</span>
								</a> 
								<a href="javascript:checkDel('${sdto.space_no}')" class="btn btn-danger btn-icon-split">
									<span class="text">삭제</span>
								</a>
							</div>

						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>

	</form>

	<form name="d" action="host_buildingDelete.do" method="post">
		<input type="hidden" name="space_no"/>
		<input type="hidden" name="member_no" value="${memberdto.getMember_no()}"/>
	</form>
	
	<form name="f" action="host_buildingFix.do" method="post">
		<input type="hidden" name="space_no"/>
		<input type="hidden" name="member_no" value="${memberdto.getMember_no()}"/>
	</form>
	
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	  
	  <c:if test="${not empty listHostBuilding}">	
	  <!-- Previous -->
	  
	  <c:if test="${startPage > pageBlock}">
	    <li class="page-item">
	      <a class="page-link text-dark" href="host_buildingList.do?pageNum=${startPage-1}" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    </c:if>
	    <!-- ///Previous -->
	    
	    <!-- 123 -->
    	<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<li class="page-item">
			<a class="page-link text-dark" href="host_buildingList.do?pageNum=${i}">${i}</a></li>
		</c:forEach>
		<!-- ///123 -->
		
		<!-- Next -->
		
		<c:if test="${pageCount > endPage}">
	    <li class="page-item">
	      <a class="page-link text-dark" href="host_buildingList.do?pageNum=${endPage+1}" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	    </c:if>
	    <!-- ///Next -->
	    
	     </c:if>
	  </ul>
	</nav>
</div>


<!-- center// -->

<%@ include file="../host_bottom.jsp"%>










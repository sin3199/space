<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
        
        <%@ include file="../host_top.jsp"%>

<!DOCTYPE html>
<html lang ="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	 <link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
	 
	<title>방관리</title>
	
</head>

<body>
<div class="container">
	<div class="py-5 text-center">
	  <h2>${space_nm} 방 관리</h2>
	</div>
	 
	 <hr class="mb-4">
		
		<form name="a" action="room_update.do" method="post" enctype="multipart/form-data">
			<table class="table table-hover" style="text-align: center;">
				<thead class="thead-dark">
					<tr>
						<th scope="col">NO.</th>
						<th scope="col">Room Name</th>
						<th scope="col">Price</th>
						<th scope="col">Start Time</th>
						<th scope="col">End Time</th>
						<th scope="col">People</th>
						<th scope="col">Edit</th>
					</tr>
				</thead>
			<tbody>
				<c:if test="${empty listRoom}">
					<tr>
						<td colspan="6">등록된 방이 없습니다.</td>
					</tr>
				</c:if>
				<c:set var="page_num" value="${requestScope.page_num}" />
				<c:forEach var="srdto" items="${listRoom}">
					<tr>
						<th><c:out value="${page_num}" />
						 <c:set var="page_num" value="${page_num-1}" /></th>
						<td>${srdto.room_nm}</td>
						<td>${srdto.room_price}원/시간</td>
						<td><fmt:formatDate value="${srdto.room_time_s}"
								pattern="yyyy년MM월dd일HH시mm분 " /></td>
						<td><fmt:formatDate value="${srdto.room_time_e}"
								pattern="yyyy년MM월dd일HH시mm분 " /></td>
						<td>${srdto.room_fit}</td>
						<td>
							<button type="submit" class="btn btn-dark" name="room_no" value="${srdto.room_no}">
								<span class="text">수정</span>
							</button>
							<!-- 
							<a href="room_update.do?room_no=${srdto.room_no}" class="btn btn-primary btn-icon-split">
			                    <span class="text">방수정</span>
			                </a>
			                 -->
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</form>

		<div align="left">
			<a href="room_input.do" class="btn btn-dark">
				<span class="text">방등록</span>
			</a>
			<a href="host_buildingList.do" class="btn btn-secondary">
				<span class="text">건물목록</span>
			</a>
		</div>

 	 <nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	  
	  <c:if test="${not empty listRoom}">	
	  <!-- Previous -->
	  		<c:if test="${startPage > pageBlock}">
	    			<li class="page-item">
	      				<a class="page-link text-dark" href="room_list.do?pageNum=${startPage-1}" aria-label="Previous">
	        			<span aria-hidden="true">&laquo;</span>
	      				</a>
	    			</li>
  				</c:if>	    
	    		<!-- 123 -->
    			<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li class="page-item">
					<a class="page-link text-dark" href="room_list.do?pageNum=${i}">${i}</a>
					</li>
				</c:forEach>
		
				<!-- Next -->
				<c:if test="${pageCount > endPage}">
	    			<li class="page-item">
	      				<a class="page-link text-dark" href="room_list.do?pageNum=${endPage+1}" aria-label="Next">
	        			<span aria-hidden="true">&raquo;</span>
	      				</a>
	   				 </li>
	    		</c:if>
	     </c:if>
	  </ul>
	</nav>
</div>
	<script src="resources/js/jquery.js" ></script>
    <script type="text/javascript" src="resources/bootstrap/js/bootstrap.bundle.js" ></script>
    <script src="resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
</body>
</html>
<%@ include file="../host_bottom.jsp"%>

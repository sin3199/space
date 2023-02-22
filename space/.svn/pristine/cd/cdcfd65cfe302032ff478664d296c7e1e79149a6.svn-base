<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="top.jsp"%>
<!doctype html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>게스트 카테고리 뷰</title>
<style>
.card-img-top{
width: 100%;
height: 300px;
}
</style>
  </head>
  <body>
   <c:if test="${not empty mode}">
   <div class="jumbotron jumbotron-fluid">
  		<div class="container">
    		<h1 class="display-4 font-weight-bold" align="center">${mode.cate_nm}</h1>
    		<p class="lead" align="center">SpacePlatform과 함께 만드는 행복한 추억! </p>
  		</div>
	</div>
  </c:if>
  
  <br><br>
  
<div class="container">
	<c:if test="${empty getSpaceRoom}">
	등록된 방이 없습니다.
	</c:if>
	<div class="row">
	<c:forEach var="dto" items="${getSpaceRoom}">
	 <div class="col-lg-4 col-md-6" style="padding-bottom: 15px;">
    	   <div class="card" style="width: auto;">
				 <a class="btn btn-light"  href="guest_spaceview.do?sn=${dto.room_no}">
					 <img src="resources/img/${dto.room_img1}" class="card-img-top" alt="...">
		 			 <div class="card-body">
		 			
				    <h3 class="card-title" align="center"> ${dto.room_nm}</h3>
				  </div>
				  </a>
			</div>
    </div>
    </c:forEach>
      </div>
    </div>
</body>
<%@ include file="bottom.jsp"%>
</html>
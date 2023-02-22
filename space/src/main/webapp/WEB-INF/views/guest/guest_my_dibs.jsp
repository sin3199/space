<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<!doctype html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>게스트 찜목록</title>
	<script src="resources/js/guest2.js"></script>
  </head>
<body>
<div class="container">
<div class="row">
	<div class="col-md-3 mb-4">
		<div class="col-md ">
			<div class="list-group">
				  <a href="guest_my_info.do" class="list-group-item list-group-item-action">내 정보</a>
				  <a href="guest_my_passwd_edit.do" class="list-group-item list-group-item-action">비밀번호 수정</a>
				  <a href="guest_reservelist.do" class="list-group-item list-group-item-action">예약리스트</a>
				  <a href="guest_my_review.do" class="list-group-item list-group-item-action">내 리뷰</a>
				  <a href="guest_dibs.do" class="list-group-item list-group-item-action">찜 목록</a>
			</div>
		</div>
		</div>

<div class="col-md-9 ">		
<div class="col-md-10 ">
<div align="center">
<h4 class="mb-3"><b>찜 목록</b></h4>	
</div>
<br>
	<c:if test="${empty myLikeList}">
			찜목록 내역이 없습니다.
	</c:if>
<c:forEach var="dto" items="${myLikeList}">		
<form action="guest_my_dibs_unlike.do" method="post">
<div class="card mb-3">
<div  align="right">
  <h6 class="card-header">
  SpacePlatform
  </h6>
  </div>
  <div class="card-body">
  	<div class="row">
  		<div class="col-4 align-self-center p-0">
  			<img class="rounded" style="width:100%; height:200px;" src="resources/img/${dto.room_img1}" alt="...">
  		</div>
  		<div class="col-8">
		    <h4 class="card-title">
		    	<b><span class="float-left">${dto.room_nm}</span>
		    	<span class="float-right"><input class="btn text-danger" type="button" value="♥" onclick="unlike(${dto.member_no},${dto.room_no})" style="font-size:30px; line-height:0; height:24px;"></span><br></b>
		    </h4>
		    <span class="float-left">${dto.room_desc}</span><br>
		    <br>
		    <span class="float-left" style="color: #6C757D;">${dto.room_price}원/시간</span><br>
		    
		    <br>
		    <a href="guest_spaceview.do?sn=${dto.room_no}" class="btn btn-info mx-1" >방 상세보기</a>
		    
  		</div>
  	</div>
  </div>
   <div class="row">
  	<div class="col text-center">
	</div>	
	</div>
</div>
</form>
</c:forEach>

	
</div>
</div>

</div>
</div>
</body>
<%@ include file="bottom.jsp"%>
</html>
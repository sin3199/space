<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게스트 내 리뷰</title>
<style>
/* Star rating */
.rating {
  display: flex;
  flex-direction: row-reverse;
  justify-content: left;
}

.rating > input{ display:none;}


.rating > label {
  position: relative;
  width: 1em;
  font-size: 20px;
  color: #dee2e6;
  cursor: pointer;
}
.rating > label::before{ 
  content: "\2605";
  position: absolute;
  color: #FFD600;
  opacity: 0;
}
.rating > label:hover:before,
.rating > label:hover ~ label:before {
  opacity: 1 !important;
}

.rating > input:checked ~ label:before{
  opacity:1;
}

.rating:hover > input:checked ~ label:before{ opacity: 0.4; }
</style>

</head>
<body>


	<!--  ------------------------------------------------------------------------------>
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
		
		<div class="col-md-12">
			<c:if test="${empty reviewList}">
				리뷰 내역이 없습니다.
			</c:if>
			<c:forEach var="dto" items="${reviewList}" >	
			<c:set var="count" value="${count + 1}" />
	<!-- 내가 쓴 리뷰의 방 정보 -->
<div class="card mb-3" >
  <div class="card-header py-0">
  	<table border="0">
  	<tr>
  	<td height="70" width="80">
  		<img style="height:50px; width:50px;" alt="방 이미지" src="resources/img/${dto.room_img1}">
  	</td>
  	<td>
  		${dto.room_nm}<br>
  		<span class="text-secondary" style="font-size:13px;">${dto.use_dt}</span>
  	</td>
  </table>
  </div>
  <!-- 내가쓴 리뷰 -->
  <div class="card-body">
  	<div class="row mx-0">
  			<c:forEach begin="1" end="${dto.res_like}"><span style="color: #FFD600; font-size: 20px;">★</span></c:forEach>
  			<c:forEach begin="1" end="${5-dto.res_like}"><span style="color: #DEE2E6; font-size: 20px;">★</span></c:forEach>
  			<span style="font-size: 20px;">${dto.res_like}점</span>
  	</div>
  	<div class="row">
  		<div class="col">
			<hr>
			<p data-toggle="collapse" data-target="#collapseExample${count}" role="button" aria-expanded="false" aria-controls="collapseExample${count}">
					${dto.rev_content}
			</p>
			<div class="collapse" id="collapseExample${count}">
  				<div class="card card-body">
  					<img class="img-fluid rounded" src="resources/img/${dto.res_img}" alt="...">
				</div>
			</div>
		</div>
	</div>
  </div>
  <div class="card-footer py-1">
    <a href="guest_review_edit.do?rev_no=${dto.rev_no}" class="btn btn-info mx-1" >리뷰 수정</a>
    <a href="guest_review_delete.do?rev_no=${dto.rev_no}&res_img=${dto.res_img}" class="btn btn-danger mx-1" >리뷰 삭제</a>
  </div>
</div>
</c:forEach>
		
		</div>
			
		</div>
		</div>
	</div>
</body>
<%@ include file="bottom.jsp"%>
</html>
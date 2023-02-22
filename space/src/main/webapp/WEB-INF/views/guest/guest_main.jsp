<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="top.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게스트 홈</title>
<style>
.carousel-img {
	width: 100%;
	height: 600px;
}

.carousel-text-bg {backgorund
	
}

.titleCate {
	font-size: 40px;
	font-weight: 700;
	font-stretch: normal;
	font-style: normal;
	line-height: 1;
	letter-spacing: -.5px;
	text-align: center;
	color: #000;
}
</style>
</head>
<body>

	<div class="container-lg">
		<div id="g-main-slides" class="carousel slide" data-ride="carousel">
			<c:if test="${not empty rdlist}">
				<ol class="carousel-indicators">
					<li data-target="#g-main-slides" data-slide-to="0" class="active"></li>
					<li data-target="#g-main-slides" data-slide-to="1"></li>
					<li data-target="#g-main-slides" data-slide-to="2"></li>
					<li data-target="#g-main-slides" data-slide-to="3"></li>
					<li data-target="#g-main-slides" data-slide-to="4"></li>
				</ol>
				<div class="carousel-inner">
					<c:forEach var="rdlist" items="${rdlist}" varStatus="status">
						<c:if test='${status.first}'>
							<div class="carousel-item active">
								<a href="guest_spaceview.do?sn=${rdlist.room_no}"> <img
									src="resources/img/${rdlist.room_img1}" class="carousel-img"
									alt="...">
									<div class="carousel-caption d-none d-md-block">
										<h2>${rdlist.room_nm}</h2>
										<h5>시간당 ${rdlist.room_price}원</h5>
										<p></p>
									</div>
								</a>
							</div>
						</c:if>
						<c:if test='${!status.first}'>
							<div class="carousel-item ">
								<a href="guest_spaceview.do?sn=${rdlist.room_no}"> <img
									src="resources/img/${rdlist.room_img1}" class="carousel-img"
									alt="...">
									<div class="carousel-caption d-none d-md-block">
										<h4>${rdlist.room_nm}</h4>
										<h5>시간당 ${rdlist.room_price}원</h5>
									</div>
								</a>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</c:if>
			<c:if test="${empty rdlist}">
				<div class="carousel-inner">
					<ol class="carousel-indicators">
						<li data-target="#g-main-slides" data-slide-to="0" class="active"></li>
						<li data-target="#g-main-slides" data-slide-to="1"></li>
						<li data-target="#g-main-slides" data-slide-to="2"></li>
					</ol>
					<div class="carousel-item active">
						<a href="workingonit.do"> <img
							src="resources/img/guest/cafe1.jpg" class="carousel-img"
							alt="...">
						</a>
					</div>
					<div class="carousel-item">
						<a href="workingonit.do"> <img
							src="resources/img/guest/cafe2.jpg"
							class="carousel-img
							alt="...">
						</a>
					</div>
					<div class="carousel-item">
						<a href="workingonit.do"> <img
							src="resources/img/guest/cafe3.jpg" class="carousel-img"
							alt="...">
						</a>
					</div>
				</div>
			</c:if>


			<button class="carousel-control-prev" type="button"
				data-target="#g-main-slides" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-target="#g-main-slides" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</button>
		</div>
		<br> <br> <br>

		<h2 class="titleCate">어떤 곳을 원하시나요?</h2>
		<br>

		<form name="f" action="guest_categoryView.do" method="post">
			<div class="row row-cols-5">
				<c:if test="${empty listSpaceType}">
					<div> 카테고리가 없습니다. </div>
				</c:if>
				<c:forEach var="dto" items="${listSpaceType}">
				
				<div class="card col" style="width: 16rem;">
				  <img src="resources/img/cateIcon/${dto.cate_img}" class="card-img-top">
				  <div class="card-body">
				    <a href="guest_categoryView.do?cate_no=${dto.cate_no}" class="btn btn-block btn-dark">${dto.cate_nm}</a>
				  </div>
				</div>
				</c:forEach>
			</div>
		</form>
	</div>

</body>

<%@ include file="bottom.jsp"%>
</html>
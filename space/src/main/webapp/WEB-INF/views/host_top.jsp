<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.101.0">
<title>HOST PAGE</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/product/">



<!-- Bootstrap core CSS servelt-context.xml 참고-->
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<!-- 
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script>
	window.jQuery
			|| document
					.write('<script src="/docs/4.6/assets/js/vendor/jquery.slim.min.js"><\/script>')
</script>
<script src="/docs/4.6/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
	 -->
	 
<script src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/bootstrap/js/bootstrap.bundle.js"></script>
<link rel="shortcut icon" href="resources/img/favicon.ico">


</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

		<a class="navbar-brand" href="/host_home.do">HOST</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-link active" href="host_home.do">Home</a> <a
					class="nav-link" href="guest_main.do">guest</a> <a class="nav-link"
					href="host_guestList.do">예약리스트</a> <a class="nav-link"
					href="host_info_update.do">내정보</a> <a class="nav-link"
					href="host_buildingList.do">건물리스트</a> <a class="nav-link"
					href="host_buildingAdd.do">건물등록</a>

			</div>
		</div>
		
		<c:if test="${empty memberdto}">
			<form class="form-inline" action="hostLogin.do">
				<button class="btn btn-outline-light my-2 my-sm-0" type="submit">Login</button>
			</form>
		</c:if>
		<c:if test="${not empty memberdto}">
			<form class="form-inline" action="host_logout.do">
				<span class="nav-link text-white">${memberdto.getMember_nm()}님
					환영합니다.</span>
				<button class="btn btn-outline-light my-2 my-sm-0" type="submit">Logout</button>
			</form>
		</c:if>
		
	</nav>


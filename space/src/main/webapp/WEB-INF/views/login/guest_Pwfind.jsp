<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.101.0">
<title>이메일찾기</title>

<link href="resources/css/font.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/fontawesome.min.css" rel="stylesheet">
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="shortcut icon" href="resources/img/favicon.ico">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

form.form-signin {
	width: 800px;
	margin: 0 auto;
}

.row {
	height: 50px;
	!
	important
}

.container.sp-box {
	background: var(- -light);
	padding: 40px 0px
}
.row{height:50px; !important}
.container.sp-box{background:var(--light); padding: 40px 0px}
</style>


</head>
<script src="https://kit.fontawesome.com/37537966ae.js"></script>
<body class="text-center">
	<div class="sp-top">
		<div
			class="sp-topmenu d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
			<h5 class="my-0 mr-md-auto font-weight-normal">
				<span> <a class="sp-logo" href="index.do"> <i
						class="fa-solid fa-rocket"></i>&ensp;Space Platform
				</a>
				</span>
			</h5>
			<nav class="my-2 my-md-0 mr-md-3">
				<span class="sp-hosthome"><a class="p-2" href="guest_main.do">게스트
						HOME<i class="fa-solid fa-star"></i>
				</a></span> <span class="sp-hosthome"><a class="p-2" href="host_home.do">호스트
						HOME <i class="fa-solid fa-star"></i>
				</a></span> <a class="p-2 text-dark" href="g_reserve_list.do"><i
					class="fa-solid fa-magnifying-glass fa-lg"></i></a>
			</nav>
			<a class="btn btn-outline-secondary" href="guestLogin.do">게스트 로그인</a>
		</div>
	</div>
	<form class="form-signin" onSubmit="return chkValue();">

		<h1 class="h3 mb-3 font-weight-normal">비밀번호 찾기</h1>

		<br> <br> <br>
		<div class="container sp-box">
			<div class="row">
				<div class="col-2"></div>
				<div class="col-7" align="center">
					<label for="inputEmail" class="sr-only">이메일</label> <input
						type="text" id="member_email" name="member_email"
						class="form-control" placeholder="이메일" required autofocus>
						<input type="hidden" id="member_grade" name="member_grade" value="0">
				</div>
				<div class="col-3">
					<input type="button" id="emailfindChk" value="비밀번호 찾기"
						style="width: 150px; background: #E1E9FF; font-family: 'Nanum Gothic'; font-weight: 600; cursor: pointer;">
					<input type="hidden" id="emailChkYN" value="N">
				</div>
			</div>
			<div id="emailChkText" style="display: none"></div>
			<div class="row">
				<div class="col-2"></div>
				<div class="col-7">
					<div class="pwcerti">
						<input type="hidden" id="cretChkYN" value="N">
					</div>
				</div>
				<div class="col-3">
					<div class="pwcertiChk"></div>
				</div>
			</div>
			<div class="row">
				<div class="col-2"></div>
				<div class="col-7">
					<div class="pwfind"></div>
				</div>
			</div>

			<div class="row">
				<div class="col-2"></div>
				<div class="col-7">
					<div class="pwrefind"></div>
				</div>
				<div class="col-3">
					<div class="pwChBtn"></div>
				</div>
			</div>
			<div class="row">
				<div class="col-3"></div>
				<div class="col-3">
					<a class="btn btn-lg btn-primary btn-block" href="guest_ssn.do">회원가입</a>
				</div>
				<div class="col-3">
					<a class="btn btn-lg btn-primary btn-block" href="guestLogin.do">로그인</a>
				</div>
			</div>
			<div class="row">
				<div class="col-5"></div>
				<div class="col-2">
					<p class="mt-5 mb-3 text-muted">&copy; 2022-2022</p>
				</div>
				<div class="col-4"></div>
			</div>
		</div>
	</form>


	<script src="resources/js/jquery.js"></script>
	<script type="text/javascript"
		src="resources/bootstrap/js/bootstrap.bundle.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/crypto-js.min.js"></script>
	<script src="resources/js/main.js"></script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게스트 리뷰쓰기</title>
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="resources/js/jquery.js"></script>
<script src="resources/bootstrap/js/bootstrap.bundle.min.js"></script>

<style>
/* Star rating */
.rating {
	display: flex;
	flex-direction: row-reverse;
	justify-content: left;
}

.rating>input {
	display: none;
}

.rating>label {
	position: relative;
	width: 1em;
	font-size: 30px;
	color: #dee2e6;
	cursor: pointer;
}

.rating>label::before {
	content: "\2605";
	position: absolute;
	color: #FFD600;
	opacity: 0;
}

.rating>label:hover:before, .rating>label:hover ~ label:before {
	opacity: 1 !important;
}

.rating>input:checked ~ label:before {
	opacity: 1;
}

.rating:hover>input:checked ~ label:before {
	opacity: 0.4;
}

</style>


</head>
<body>


	<!--  ------------------------------------------------------------------------------>
	<div class="container">
		<div class="row">

			<div class="col-md-3 mb-4">
				<div class="col-md ">
					<div class="list-group">
						<a href="guest_my_info.do"
							class="list-group-item list-group-item-action">내 정보</a> <a
							href="guest_my_passwd_edit.do"
							class="list-group-item list-group-item-action">비밀번호 수정</a> <a
							href="guest_reservelist.do"
							class="list-group-item list-group-item-action">예약리스트</a> <a
							href="guest_my_review.do"
							class="list-group-item list-group-item-action">내 리뷰</a> <a
							href="guest_dibs.do"
							class="list-group-item list-group-item-action">찜 목록</a>
					</div>
				</div>
			</div>

			<div class="col-md-9 ">

				<div class="col-md-10">
					<form action="guest_review_write_ok.do"  method="post"  enctype="multipart/form-data">
						<input type="hidden" name="res_no" value="${param.res_no}">

						<h4 class="mb-3">
							<b>리뷰 쓰기</b>
						</h4>
						<div class="mb-3">
							<textarea class="form-control" id="rev_content"
								name="rev_content" rows="8" placeholder="최대 2000자 까지 입력 가능합니다."
								maxlength="2000" onkeyup="conLength()" style="resize: none"
								required></textarea>
							<span id="textCount">(0자</span> <span class="textTotal">/2000자)</span>
						</div>

						<div class="mb-3">
				  			<label>이미지 업로드</label>
				  			<input  type="file" id="res_img" name="res_img">
						</div>
						



						<h4 class="mb-0">방이름</h4>
						<div class="rating">
							<input type="radio" name="res_like" value="5" id="5"><label for="5">★</label> 
							<input type="radio" name="res_like" value="4" id="4"><label for="4">★</label> 
							<input type="radio" name="res_like" value="3" id="3"><label for="3">★</label>
							<input type="radio" name="res_like" value="2" id="2"><label for="2">★</label> 
							<input type="radio" name="res_like" value="1" id="1" checked><label for="1">★</label>
						</div>
						<input type="submit" value="확 인" class="btn btn-primary btn-lg btn-block mt-3">
						<hr>
					</form>
				</div>


			</div>
		</div>
	</div>
	<!--실시간 글자수 체크  -->
	<script type="text/javascript">
		$("#rev_content").keyup(function(e) {
		//console.log("키업!"); -->
		var content = $(this).val();
		$("#textCount").text("(" + content.length + "자"); //실시간 글자수 카운팅 
		if (content.length > 2000) {
				alert("최대 2000자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 45));
				$('#textCount').text("(2000");
 			}
		}); 
 	</script>


</body>
<%@ include file="bottom.jsp"%>
</html>
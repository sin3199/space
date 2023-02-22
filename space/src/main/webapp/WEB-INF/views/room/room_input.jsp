<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../host_top.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>방 등록 페이지</title>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<style>
.cay {
	outline: none !important;
}
</style>
</head>
<body>
	<div class="container">

		<div class="py-5 text-center">
			<h2>방 등록 페이지</h2>
			<br>
			<br>
			<hr class="mb-4">
		</div>

		<form name="f" action="room_input.do" method="post"
			onsubmit="return checkRoom()" enctype="multipart/form-data">
			<input type="hidden" name="space_no" value="${space_nono}" />

			<div class="mb-3">
				<label for="nm">방 이름* <span class="text-muted">(Room
						Name)</span></label> <input type="text" class="form-control" max="200" name="room_nm">
			</div>

			<div class="mb-3">
				<label for="price">가격*(요금은 시간으로 책정됩니다.)<span
					class="text-muted">(Price)</span></label> <input type="text"
					class="form-control" name="room_price">
			</div>

			<div class="mb-3">
				<label for="capacity">수용인원* <span class="text-muted">(Capacity)</span></label>
				<input type="text" class="form-control" max="50" name="room_fit">
			</div>

			<div class="mb-3">
				<label for="explanation">방 설명* <span class="text-muted">(Explanation)</span></label>
				<textarea class="form-control" name="room_desc" rows="6"></textarea>
			</div>

			<div class="mb-3">
				<label for="image1">대표이미지 <span class="text-muted">(Representative
						Image)</span></label> <input type="file" max="50" class="form-control" name="room_img1">
			</div>

			<div class="mb-3">
				<label for="image2">이미지1<span class="text-muted">(Image.NO.1)</span></label>
				<input type="file" max="50" class="form-control" name="room_img2">
			</div>

			<div class="mb-3">
				<label for="image3">이미지2 <span class="text-muted">(Image.NO.2)</span></label>
				<input type="file" max="50" class="form-control" name="room_img3">
			</div>

			<div class="mb-3">
				<label for="image4">이미지3 <span class="text-muted">(Image.NO.3)</span></label>
				<input type="file" class="form-control" name="room_img4">
			</div>

			<div class="mb-3">
				<label for="image5">이미지4 <span class="text-muted">(Image.NO.4)</span></label>
				<input type="file" max="50" class="form-control" name="room_img5">
			</div>


			<div class="form-row">
				<div class="mb-3 col-md-6">
					<label for="timeS">사용가능 시작시간 <span class="text-muted">(Start
							time to use a room)</span></label> 
					<input type="number" min="00" max="23" maxlength="2" placeholder="HH" class="form-control startTime" onKeyup="timeLimit(this);" name="time_s">
				</div>

				<div class="mb-3 col-md-6">
					<label for="timeE">사용가능 종료시간 <span class="text-muted">(End
							time to use a room)</span></label> 
					<input type="number" min="00" max="23" maxlength="2" placeholder="HH" class="form-control endTime" onKeyup="timeLimit(this);" name="time_e">	
				</div>
			</div>
			<div class="form-row">
				<div class="mb-3">
					<label for="offDay">휴무일 선택<span class="text-muted">(Off
							day)</span></label><br>
					<button type="button" name="b1" class="day btn btn-secondary"
						value="1">일</button>
					<button type="button" name="b2" class="day btn btn-secondary"
						value="1">월</button>
					<button type="button" name="b3" class="day btn btn-secondary"
						value="1">화</button>
					<button type="button" name="b4" class="day btn btn-secondary"
						value="1">수</button>
					<button type="button" name="b5" class="day btn btn-secondary"
						value="1">목</button>
					<button type="button" name="b6" class="day btn btn-secondary"
						value="1">금</button>
					<button type="button" name="b7" class="day btn btn-secondary"
						value="1">토</button>
					<input type="hidden" id="room_week" name="room_week">
				</div>
			</div>
			<div class="row">
				<div class="col text-center">
					<div class="btn-group" role="group" aria-label="button">
						<input type="submit" class="btn btn-dark" value="방 등록"> <input
							type="reset" class="btn btn-secondary" value="취소" /> <input
							type="button" class="btn btn-secondary" value="방 목록보기"
							onclick="window.location='room_list.do'">
					</div>
				</div>
			</div>
			

		</form>
	</div>


	<script src="resources/js/jquery.js"></script>
	<script type="text/javascript"
		src="resources/bootstrap/js/bootstrap.bundle.js"></script>

</body>
</html>
<script src="resources/js/room_input.js"></script>
 <script type="text/javascript">
    function timeLimit(time){
		if(time.length>=3){
			if(isFinite(time)==false){
				alert("문자는 입력하실 수 없습니다.");
				time.value = 00;
				return false;
			}
			if(time>24){
				alert("시간은 23시를 넘길 수 없습니다.");
				time.value = 23;
				return false;
			}
			time.value = time;
		}
	}
	
	function checkRoom(){
		if(parseInt($(".startTime").val()) > parseInt($(".endTime").val())){
			alert("시작시간은 종료시간보다 이른시간이여야 합니다.");
			$(".startTime").focus();
			return false;
		}
		
	}
    </script>
<%@ include file="../host_bottom.jsp"%>
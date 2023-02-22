<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>게스트예약상세보기</title>
    <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
<div class="card">
  <h5 class="card-header">
    <b>${reserveView.pay_date}</b>
  </h5>
  <div class="card-body">
		    <h5 class="card-title " ><b>예약 번호</b><span class="float-right">${reserveView.res_no}</span></h5>
		    <span class="float-left">예약자명</span><span class="float-right">${reserveView.res_nm}</span><br>
		    <span class="float-left">예약자 연락처</span><span class="float-right">${reserveView.res_pno}</span><br>
		    <span class="float-left">예약자 이메일</span><span class="float-right">${reserveView.res_email}</span><br>
		    <span class="float-left">결제금액</span><span class="float-right">${reserveView.pay_pr}</span><br>
		    <c:if test="${reserveView.pay_m==1}">
		    <span class="float-left">결제수단</span><span class="float-right">현장결제</span><br>
		    </c:if>
		    <c:if test="${reserveView.pay_m==2}">
		    <span class="float-left">결제수단</span><span class="float-right">무통장입금</span><br>
		    <c:if test="${reserveView.pay_st ==0}">
		    <span class="float-left">입금은행</span><span class="float-right">신한은행 110-9834857234(주)공간</span><br>
		    <span class="float-left">결제 상태</span><span class="float-right" style="color:red;">입금대기중</span><br>
		    </c:if>
		    <c:if test="${reserveView.pay_st ==1}">
		    <span class="float-left">결제 상태</span><span class="float-right" style="color:blue;">입금완료</span><br>
		    </c:if>
		    </c:if>
  		<hr>
  		<h5 class="card-title " ><b>${reserveView.room_nm}</b></h5>
  		<span class="float-left">예약 시작 시간</span><span class="float-right">${reserveView.use_dt}</span><br>
  		<span class="float-left">예약 종료 시간</span><span class="float-right">${reserveView.use_time}</span><br>
  		<span class="float-left">사용 인원</span><span class="float-right">${reserveView.res_personnel}명</span><br>
  		<hr>
  		<h5 class="card-title " ><b>요청 사항</b></h5>
  		${reserveView.res_req}
  		<hr>
  		<h5 class="card-title " ><b>위치</b></h5>
  		<span class="float-left">${reserveView.space_addr}</span>
  		<div id="map" style="width:500px;height:300px;"></div>
  </div>
  <div class="card-footer py-2">
    
  </div>
</div>

	
</div>
</div>

</div>
</div>


<script src="resources/js/jquery.js" ></script>
<script src="resources/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b4729847cb47525e3ef0354d3a4e690&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 1 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${reserveView.space_addr}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${reserveView.space_nm}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});
</script>
</body>
<%@ include file="bottom.jsp"%>
</html>
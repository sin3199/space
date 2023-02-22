<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 상세보기</title>
<style>
	#reservation_share{
		margin:50px;
		width:970px;
		border-collapse:collapse;
		color: #505050;
/* 		border: 1px solid #f0f0f0; */
	}
	#reservation_share td.top{	
		padding-bottom: 10px;
		font-weight:700; font-size:25px;
	}
	
	#reservation_share td.title{
		padding-left: 15px;
		width:110px;
		height: 90px;
		font-weight:700;
		font-size:20px;
		border-bottom: 1px solid #dcdcdc;
		background-color: #fbedaa;
	}
	#reservation_share td.content{
		font-size:19px;
		width:320px;
		padding-left:20px;
		border-bottom: 1px solid #dcdcdc;
	}
	
	#reservation_user{
		margin:50px;
		width:600px;
		border-collapse:collapse;
		color: #505050;
/* 		border: 1px solid #dcdcdc; */
	}
	#reservation_user td.top{	
		padding-bottom: 20px;
		font-weight:700; font-size:25px;
	}
	
	#reservation_user td.title{
		padding : 15px;
		font-weight:700;
		font-size:20px;
	}
	#reservation_user td.content{
		font-size:19px;
		width:450px;
		padding-left:20px;
	}
	
	#reservation_time{
		width:496px;
		border-collapse:collapse;
		color: #505050;
/* 		border: 1px solid #dcdcdc; */
	}
	#reservation_time td.top{
		padding-bottom: 20px;
		font-weight:700; font-size:25px;
	}
	#reservation_time td.content{
		padding-bottom: 50px;
	}
	
	#calendar{margin-bottom:50px; padding: 10px; width:250px; color: #505050; border: 1px solid #dcdcdc;}
	#calendar td{padding:10px;	}
	
	#timeTable{margin-bottom:50px; padding: 5px; width:200px; color: #505050;}
	#timeTable td{padding:8px;	}
	
	#selectedDate{width: 200px; height: 25px;	padding: 10px; 
		color: #505050; font-size:17px;	background-color: #fff;	border: 1px solid #dcdcdc;	}
	#selectedTime{width: 200px; height: 25px;	padding: 10px; 
		color: #505050; font-size:17px;	background-color: #fff;	border: 1px solid #dcdcdc;	}
	#totalPrice{width: 200px; height: 25px;	padding: 10px; 
		color: #505050; font-size:17px;	background-color: #fff;	border: 1px solid #dcdcdc;	}
	
	#btn_submit{
		margin: 0;
		padding: 20px;
		text-align: center;
		text-decoration: none;
		font-size: 20px; color:#fff;
		background-color: #ace2f9;
		font-weight:700;
	
		border: none;
/* 		border-radius: 10px; */
		
		display: inline-block;
		width: 300px;
	}
	#btn_submit:hover{
		margin: 0;
		padding: 20px;
		text-align: center;
		text-decoration: none;
		font-size: 20px; color:#ace2f9;
		background-color: #fff;
		font-weight:700;
	
		border: 1px solid #ace2f9;
/* 		border-radius: 10px; */
		
		display: inline-block;
		width: 300px;
	}

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
<%
	/* if ((Integer)request.getAttribute("error") == 1){
		out.println("<script>alert('오류발생1!!');history.back();</script>");
	} */
	
	//유저정보 획득
	//String userName = LoginedUserInfo.name;
	//String userPhone = LoginedUserInfo.phone;
	//String userEmail = LoginedUserInfo.email;
	
	
	//share detail data
	//Dto_Share share = (Dto_Share)request.getAttribute("DETAIL");
	//JSON 형식으로 달의 날자별 예약현황을 전송받음
	//JSONArray thisMonthResData = (JSONArray)request.getAttribute("thisMonthResData");
	//JSONArray nextMonthResData = (JSONArray)request.getAttribute("nextMonthResData");  ===================> 방 정보를 가져와야 함 DTO  그 중에 예약 가능 요일이 있으면 좋음
	
	//예약가능 요일 (일~월, 가능0 불가능1)
	//char[] possibleDay = (share.getDayLimit()).toCharArray();
	//예약가능 시간 (start time~end time) end - start = 이용가능시	                           ======================> 방 정보중 예약 가능 시간도 있음  start time ~ end time  end - start 이용가능시간
	//int startTime = share.getStartTime(); 
	//int endTime = share.getEndTime();
	//총 이용 가능 시간
	//int totalUsingTime = endTime - startTime;
	//시간당 가격                                                                       ========================> 
	//int price = share.getPrice();                                         
%>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">	
		
	//예약이 가득찬 날들의 배열       ================================================================> 예약이 가득찬 날을 모아 배열로 만들기 
	var thisMonthFullDateList = new Array();
	<c:forEach items="${thisMonthFullDateList}" var = "date">
		thisMonthFullDateList.push(${date});
	</c:forEach>
	var nextMonthFullDateList = new Array();
	<c:forEach items="${nextMonthFullDateList}" var = "date">
		nextMonthFullDateList.push(${date});
	</c:forEach>

	//---------------- calendar --------------------------
	
	//date객체 획득. 가변
	var today = new Date();
	//today 보조. 고정
	var date = new Date();

	//선택되있던 셀 객체 저장
	var selectedCell;
	//오늘에 해당하는 월
	var realMonth = date.getMonth()+1;
	var realToDay = date.getDate()
	//선택된 월, 일
	var selectedMonth = null;
	var selectedDate = null;
	
	//예약가능 요일 계산해 배열 (일~월, 가능0 불가능1)
	const possibleDay = '${sp.room_week}';   ///////////////////////////////// 수정해놓음
	
	//전달 달력
	function prevCalendar(){
		if (today.getMonth()+1 == realMonth){
			alert("예약은 금일기준 다음날부터 30일 이후까지만 가능합니다.");	
			return false;
		}
		today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
		buildCalendar();
	}
	//다음달 달력
	function nextCalendar(){
		if(today.getMonth()+1 == (realMonth + 1)){
			alert("예약은 금일기준 다음날부터 30일 이후까지만 가능합니다.");
			return false;
		}
		today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
		buildCalendar();
	}
	
	function selectday(){
		var day = $("#selectedDate").val();
		var rno = $("#room_no").val();
		$.ajax({
			type:"post",
			url : "selectday.do",
			dataType : "json",
			data :{
				day : day,
				room_no	: rno
			},
			success : function(res){
				var rdtoArr = res.RDTO;
//				rdtoArr.map(rdto => console.log(rdto));

			for(var i=0; rdtoArr.length; i++){
				var dto = rdtoArr[i];
				var start = dto["startday"];
				var preiod = dto["totalTime"];
				
				for(var j=start; j<start+preiod; j++){
					var findTd = $("#timeTable").find("td#" + j);
					findTd.css("background", "#D4D2DB");
					findTd.css("pointer-events",'none');
				}
				
			}	
				
				
			},
			error : function(err){
				console.log(err);	
			}
		});
		
	}
	
	//달력 제작 (이번달 기준)
	function buildCalendar(){
		row = null;
		cnt = 0;
		firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
		lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0);
		//현재 참조중인 월 
		nowMonth = today.getMonth()+1;
		//이번달이면 0, 다음달이면 1 리턴
		monthEquals = thisMonth(nowMonth, realMonth);
		//달력 객체
		var calendarTable = document.getElementById("calendar");
		//달력의 타이틀 객체 획득
		var calendarTableTitle = document.getElementById("calendarTitle");
		//타이틀 수정
		calendarTableTitle.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";
		
		//테이블 초기화
		while(calendarTable.rows.length > 2){
			calendarTable.deleteRow(calendarTable.rows.length -1);
		}
		
		//셀 입력을 위해 테이블 개행
		row = calendarTable.insertRow();
		
		//달의 첫 날 전까지 빈 셀 생성
		for(i = 0; i < firstDate.getDay(); i++){
			cell = row.insertCell();
			cnt += 1;
		}
		
		//요일 입력 (셀 생성)
		for(i = 1; i <= lastDate.getDate(); i++){
			
			//예약하지 못하는 조건일경우 +1씩 되므로, noCount가 0일 시에만 클릭함수를 적용
			noCount = 0;
			
			cell = row.insertCell();
			
			//cell에 id 부여
			cell.setAttribute('id', i);
			cell.innerHTML = i;
			//cell.innerHTML = '<label onclick="prevCalendar()">' + i + '</label>';
			cell.align = "center";
			
			//셀 생성 후 count 증가
			cnt += 1;
			
			//cnt % 7 == 1이면 일요일이므로 빨갛게
			if (cnt % 7 == 1) {
              cell.innerHTML = "<font color=#F79DC2>" + i + "</font>";
         	 }  
            
			//일주일 입력 완료시 개행
			if (cnt % 7 == 0){
				//cnt % 7 == 0이면 토요일이므로 파랗게
				cell.innerHTML = "<font color=skyblue>" + i + "</font>";
				row = calendar.insertRow();
			}
			//예약불가일 색상변경 (오늘 이전 또는 30일 이후) 및 사용자가 직접 지정한 경우
			etp = exchangeToPosibleDay(cnt)*1;    //=======================================================> 
			
			if (nowMonth == realMonth && i <= realToDay) {
				noCount +=1;
	        } else if (nowMonth > realMonth && i > realToDay) {
				noCount +=1;
	        } else if (possibleDay[etp] == 0){
				noCount +=1;
	        }

			if (noCount > 0){
				cell.style.backgroundColor = "#E0E0E0";
				cell.innerHTML = "<font color='#C6C6C6' >" + i + "</font>";
			} else {
				cell.onclick = function(){
					selectedTimeAndTotalPriceInit();
					//선택된 날의 연, 월, 일 계산 (일자의 경우 id속성 참조)
					clickedYear = today.getFullYear();
					clickedMonth = (1 + today.getMonth());
					clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
					clickedDate = this.getAttribute('id');
					clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;
					
					clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;
					
					//하단에 예약일시 표시
					inputField = document.getElementById("selectedDate");
					inputField.value = clickedYMD;
					//선택된 월, 일 변수 저장
					selectedMonth = today.getMonth() + 1;
					selectedDate = this.getAttribute('id');
					
					//선택된 셀 색 변화
					if(selectedCell != null){
						selectedCell.bgColor = "#FFFFFF";
					}
					selectedCell = this;
					this.bgColor = "#fbedaa";
					
					selectday();
					
					//time table 생성
					timeTableMaker(today.getMonth() + 1,this.getAttribute('id'));
				}
			}
			
		}
		//예약이 가득찬 날인 경우 cell 비활성화 및 색상 변경
		checkMonth = thisMonth(nowMonth, realMonth);
		fullDate = [];
		if(checkMonth == 0){
			fullDate = thisMonthFullDateList;
		}
		if(checkMonth == 1){
			fullDate = nextMonthFullDateList;;
		}
		for (var i = 0; i < fullDate.length; i++){
			console.log("꽉 찬날 : " + fullDate[i]);
			cell = document.getElementById(fullDate[i]);
			console.log("꽉 찬날 : " + cell.innerHTML);
			cell.style.backgroundColor = "#E0E0E0";
			cell.style.color = '#C6C6C6';
			cell.onclick = function(){};
		}
		
		//달의 마지막날 뒤 행의 빈 공간을 셀로 채우기
		if(cnt % 7 != 0){
			for(i = 0; i < 7 - (cnt % 7); i++){
				cell = row.insertCell();
			}
		}
	}
	//사용자가 입력한 예약불가능 일자와 대조하기 위해 0~7의 환형 계산구조
	function exchangeToPosibleDay(num){
		result = num % 7;
		result -= 1;
		if (result == -1) {
			result = 6;
		}
		return result; 
	}
	//이번달이면 0 리턴, 다음달이면 1 리턴
	function thisMonth(todayMonth, dateMonth){
		console.log("todayMonth : " + todayMonth + ", dateMonth : " + dateMonth);
		if (todayMonth*1 == dateMonth*1){
			console.log("이번달 이구요")
			return 0;
		} 
		console.log("다음달 이구요")
		return 1;
	}

	// ---------------- time table --------------------------

	var price = "${sp.room_price}";
	var startTime = "${resMap.strDate_s}";
	var endTime = "${resMap.strDate_e}";
												//=========================================================> price, endTime, startTime 임의로 넣음
	
												
												//선택된 시간중 가장 빠른/늦은 시간;
	var selectedFirstTime = 24*1;
	var selectedFinalTime = 0*1;
	//예약시간표를 만들 table객체 획득

	
	function timeTableMaker(selectedMonth, selectedDate){
		row = null
		month = selectedMonth;
		date = selectedDate;
		
		var timeTable = document.getElementById("timeTable");
		
		//테이블 초기화
		while(timeTable.rows.length > 0){
			timeTable.deleteRow(timeTable.rows.length-1);
		}
		
		for (i = 0; i < endTime - startTime; i++){
			//곱해서 숫자타입으로 변환
			cellTime = startTime*1 + i;
			
			cellStartTimeText = cellTime + ":00";
			cellEndTimeText = (cellTime + 1) + ":00";
			inputCellText = cellStartTimeText + " ~ " +  cellEndTimeText;
			
			//셀 입력을 위해 테이블 개행
			row = timeTable.insertRow();
			//해당 row의 셀 생성
			cell = row.insertCell();
			//cell에 id 부여
			cell.setAttribute('id', cellTime);
			//셀에 입력
			cell.innerHTML = inputCellText;
			
			//클릭이벤
			cell.onclick = function(){
				cellTime = this.getAttribute('id');
				cellTime = cellTime*1;
				console.log("first : " + selectedFirstTime + ", selectedFinalTime : " + selectedFinalTime + ", selected : " + cellTime);
				
				//예약일시 입력처리
				if (selectedFirstTime != 24 && selectedFinalTime != 0){
					if(cellTime < selectedFirstTime - 1){
						alert("연속한 시간만 예약가능합니다.");
						return false;
					}
					if (cellTime > selectedFinalTime + 1){
						alert("연속한 시간만 예약가능합니다.");
						console.log(cellTime + ">" + selectedFinalTime + 1)
						return false;
					}
				}
				this.bgColor = "#fbedaa";
				if (cellTime < selectedFirstTime) {
					selectedFirstTime = cellTime
				}
				if (cellTime > selectedFinalTime) {
					selectedFinalTime = cellTime
				}
				
				//하단의 예약일시에 시간 표시
				resTime  = selectedFirstTime + ":00 ~ " + (selectedFinalTime + 1) + ":00";
			
				resTimeForm = document.getElementById("selectedTime");
				resTimeForm.value = resTime;
				
				//하단의 결제정보에 가격정보 표시
				useTime = (selectedFinalTime + 1) - selectedFirstTime;
				
				useTimeForm = document.getElementById("totalPrice");
				useTimeForm.value = useTime * price;
				
			}
		}
		//JSON으로 테이블 td 핸들링
		//이번달 0 다음달 1
		nowMonth = today.getMonth()+1;
		checkMonth = thisMonth(nowMonth, realMonth);
		var json = [];
		<%-- if(checkMonth == 0){
			json = <%=thisMonthResData%>;
		} else {
			json = <%=nextMonthResData%>;
		} --%>
		for(i = 0; i < Object.keys(json).length; i++){
			if (date == json[i].date){
				jsonObject = json[i];
				for(j = 0; j < jsonObject.startNum.length; j++){
					startNum = jsonObject.startNum[j];
					shareTime = jsonObject.shareTime[j];
					console.log("startNum: " + startNum + ", shareTime : " + shareTime);
					for(k = startNum; k < startNum*1 + shareTime; k++){
						cell = timeTable.rows[k].cells[0];
						cell.style.backgroundColor = "#E0E0E0";
						cell.style.color = '#C6C6C6';
						cell.onclick = function(){};
					}
				}
			}
		}

	}
	//시간효 초기화
	function tableinit(){
		timeTableMaker(selectedMonth, selectedDate);
		selectedTimeAndTotalPriceInit();
		buildCalendar();
	}
	
	//날자 클릭시 예약시간 및 결제정보 초기화
	function selectedTimeAndTotalPriceInit(){
		resDateForm = document.getElementById("selectedDate");
		resTimeForm = document.getElementById("selectedTime");
		resTimeForm.value = "";
		resDateForm.value = "";
		
		useTimeForm = document.getElementById("totalPrice");
		useTimeForm.value = "";
		
		selectedFirstTime = 24*1;
		selectedFinalTime = 0*1;
	}
	
</script>
<style>
.slide-img{
width: 100%;
height: 300px;

}
</style>
</head>
<body>
<div class="container">  <!--  -fluid -->
<!-- <nav class="" style="right: 0;position: fixed;"> -->
<!-- 		<!-- 방세부선택 SpaceRoom 리스트 --> -->
	
<!-- 	<div class="cols-lg-6"> -->
<!-- 		<table class="table" border="0" style="width: 540px;"> -->
<!--   <thead> -->
<!--     <tr> -->
<!-- 		<th>방 예약 안내</th> -->
<%-- 		<c:if test="${empty memberdto}"> --%>
<!-- 		<td align="right"><img src="resources/img/guest/suit-heart.svg" id="notlike" class="member-unlike" title="찜하기"></td> -->
<%-- 		</c:if> --%>
<%-- 		<c:if test="${not empty memberdto}"> --%>
<%-- 		<c:if test="${like==0}"> --%>
<!-- 		<td align="right"><img src="resources/img/guest/suit-heart.svg" id="like" class="member-unlike" title="찜하기"></td> -->
<%-- 		</c:if> --%>
<%-- 		<c:if test="${like != 0}"> --%>
<!-- 		<td align="right" ><img src="resources/img/guest/suit-heart-fill.svg" id="like" class="member-like" title="찜하기"></td> -->
<%-- 		</c:if> --%>
<%-- 		</c:if> --%>
<!--     </tr> -->
<!--   </thead> -->
<!--   <tbody> -->
<!--     <tr> -->
<!--       <td colspan="5"  align="center"> -->
<!--      <p class="font-weight-bold"> 호스트 승인 후 예약확정</p> -->
<!--      <p class="font-italic">확실한 예약을 위해 스페이스에서 </p> -->
<!--      <p class="font-italic">온라인 결제를 진행하세요</p>  -->
<!--      <p class="font-italic">평균대기시간 :180,000초 </p> -->
<!--       </td> -->
<!--     </tr> -->
<!--     <tr> -->
<!--       <td colspan="2"  align="center" class="calButtonAlign"> -->
<!--       <label> -->
<%--        ${sp.room_nm}  가격 : ${sp.room_price} --%>
<!--       </label> -->
<!--       <span class="badge cal_open badge-primary">예약하기</span> -->
      
<!--       </td> -->
<!--       </tr> -->
<!--           <tr> -->
<!--     <td colspan="4" align="center"> -->
<!--     </td> -->
<!--     </tr> -->
<!--   </tbody> -->
<!-- </table> -->
<!-- 				<div id="divshow" style="display:none;"> -->
<!-- 				<div class="container-sm" style="width: 510px;"> -->
<!-- 				  <div class="row justify-content-left mx-0"> -->
<!-- 				    <div class="col-lg-10"> -->
<!-- 		<table id="reservation_time"> -->
<!-- 			<tr> -->
<!-- 				<td class="top" align="left">시간선택</td> -->
<!-- 				<td class="top" align="right"><button class="btnTime" type="button" onclick="tableinit()">초기화</button></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td> -->
<!-- 					<table id="calendar"> -->
<!-- 						<tr> -->
<!-- 							<td align="center"><label onclick="prevCalendar()"> ◀ </label></td> -->
<!-- 							<td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td> -->
<!-- 							<td align="center"><label onclick="nextCalendar()"> ▶ </label></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td align="center"><font color ="#F79DC2">일</td> -->
<!-- 							<td align="center">월</td> -->
<!-- 							<td align="center">화</td> -->
<!-- 							<td align="center">수</td> -->
<!-- 							<td align="center">목</td> -->
<!-- 							<td align="center">금</td> -->
<!-- 							<td align="center"><font color ="skyblue">토</td> -->
<!-- 						</tr> -->
<!-- 					</table> -->
<!-- 				</td> -->
			
<!-- 				<td> -->
<!-- 						<div style="height : 340px; overflow: scroll;"><table id = "timeTable">	</table></div> -->
<!-- 				</td> -->
				
<!-- 			</tr> -->
<!-- 			</table> -->
<!-- 			<tr>  -->
<!-- 				<td class="top" align="left" colspan="2">예약일시</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td class="content" colspan="2" align="left"><input id="selectedDate" name="selectedDate" value="" readonly="readonly"></input> -->
<!-- 				<input id="selectedTime" name="selectedTime" value="" readonly="readonly"></input> -->
<%-- 				<input type="hidden" id="room_no" value="${sp.room_no}"> --%>
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td class="top" align="left">결제정보</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td class="content" align="left" colspan="2"><input id="totalPrice" name="totalPrice" value="" readonly="readonly"></input></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td><input	type="button" id="guest_reserve" class="btn btn-primary text-wrap"  style="width: 150px;" value="예약하러가기"></td> -->
<!-- 			</tr> -->
		
<!-- 				    </div> -->
<!-- 				  </div> -->
<!-- 				</div> -->
<!-- 				</div> -->
<!-- 	</div> -->
<!-- </nav> -->
<div class="row"> 

<div class="col-8">
<c:if test="${empty sp}">
<h6>잘못된 접근입니다</h6>
</c:if>
	<h1>${sp.room_nm}<a href="test.do?sn=${sp.room_no}">테스트하러가기</a></h1>
	<FONT SIZE="1"><span class="badge badge-secondary">${cate_nm}</span></FONT>
	<div class="row flex-nowrap" >
	<div class="col">
	<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
  <c:if test="${not empty sp.room_img1}">
    <div class="carousel-item active">
      <img src="resources/img/${sp.room_img1}" class="slide-img" alt="...">
    </div>
    </c:if>
    <c:if test="${not empty sp.room_img2}">
    <div class="carousel-item">
      <img src="resources/img/${sp.room_img2}" class="slide-img" alt="...">
    </div>
    </c:if>
	    <c:if test="${not empty sp.room_img3}">
    <div class="carousel-item">
      <img src="resources/img/${sp.room_img3}" class="slide-img" alt="...">
    </div>
    </c:if>
        <c:if test="${not empty sp.room_img4}">
    <div class="carousel-item">
      <img src="resources/img/${sp.room_img4}" class="slide-img" alt="...">
    </div>
    </c:if>
        <c:if test="${not empty sp.room_img5}">
    <div class="carousel-item">
      <img src="resources/img/${sp.room_img5}" class="slide-img" alt="...">
    </div>
    </c:if>
  </div>
 <button class="carousel-control-prev" type="button" data-target="#carouselExampleControls" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-target="#carouselExampleControls" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </button>
</div>

	</div>
	</div>
	
	
	<hr class="mb-4">
	<div class="row">
	
	건물이름
	${sdto.space_nm}
	<hr class="mb-4">
	${sdto.space_intro}
	<hr class="mb-4">
	${srdto.room_nm}
	방사진
  <c:if test="${not empty sp.room_img1}">
      <img src="resources/img/${sp.room_img1}" class="d-block w-100" alt="...">
      <br>
    </c:if>
    <c:if test="${not empty sp.room_img2}">
      <img src="resources/img/${sp.room_img2}" class="d-block w-100" alt="...">
         <br>
    </c:if>
	    <c:if test="${not empty sp.room_img3}">
      <img src="resources/img/${sp.room_img3}" class="d-block w-100" alt="...">
         <br>
    </c:if>
        <c:if test="${not empty sp.room_img4}">
      <img src="resources/img/${sp.room_img4}" class="d-block w-100" alt="...">
         <br>
    </c:if>
        <c:if test="${not empty sp.room_img5}">
      <img src="resources/img/${sp.room_img5}" class="d-block w-100" alt="...">
         <br>
    </c:if>
	<hr class="mb-4">
	${sp.room_desc}
	<hr class="mb-4">
	${sdto.space_guide}
	시설 안내
	<hr class="mb-4">
	<h1>시설안내</h1>
	${sdto.precautions}	<br>
	${sdto.space_closed_dt}	<br>
	${sdto.space_pno} 
	<hr class="mb-4">
	${sdto.space_addr}
	<div id="map" style="width:500px;height:300px;"></div>
	<hr class="mb-4">
	<h1>후기</h1>
	</div>
	
	
</div>

<div class="col-4">
	<div class="row">
	<table class="table" border="0" style="">
  <thead>
    <tr>
		<th>방 예약 안내</th>
		<c:if test="${empty memberdto}">
		<td align="right"><img src="resources/img/guest/suit-heart.svg" id="notlike" class="member-unlike" title="찜하기"></td>
		</c:if>
		<c:if test="${not empty memberdto}">
		<c:if test="${like==0}">
		<td align="right"><img src="resources/img/guest/suit-heart.svg" id="like" class="member-unlike" title="찜하기"></td>
		</c:if>
		<c:if test="${like != 0}">
		<td align="right" ><img src="resources/img/guest/suit-heart-fill.svg" id="like" class="member-like" title="찜하기"></td>
		</c:if>
		</c:if>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="5"  align="center">
     <p class="font-weight-bold"> 호스트 승인 후 예약확정</p>
     <p class="font-italic">확실한 예약을 위해 스페이스에서 </p>
     <p class="font-italic">온라인 결제를 진행하세요</p> 
     <p class="font-italic">평균대기시간 :180,000초 </p>
      </td>
    </tr>
    <tr>
      <td colspan="2"  align="center" class="calButtonAlign">
      <label>
       ${sp.room_nm}  가격 : ${sp.room_price}
      </label>
      <span class="badge cal_open badge-primary">예약하기</span>
      
      </td>
      </tr>
      </tbody>
      </table>
      
</div>
<div class="row" id="divshow" style="display:none;">
				<div class="container-sm" style="width: 510px;">
				  <div class="row  mx-0">
				    <div class="col-lg-10">
		<table id="reservation_time">
			<tr>
				<td class="top" align="left">시간선택</td>
				<td class="top" align="right"><button class="btnTime" type="button" onclick="tableinit()">초기화</button></td>
			</tr>
			<tr>
				<td>
					<table id="calendar">
						<tr>
							<td align="center"><label onclick="prevCalendar()"> ◀ </label></td>
							<td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
							<td align="center"><label onclick="nextCalendar()"> ▶ </label></td>
						</tr>
						<tr>
							<td align="center"><font color ="#F79DC2">일</td>
							<td align="center">월</td>
							<td align="center">화</td>
							<td align="center">수</td>
							<td align="center">목</td>
							<td align="center">금</td>
							<td align="center"><font color ="skyblue">토</td>
						</tr>
					</table>
				</td>
			
				<td>
						<div style="height : 340px; overflow: scroll;"><table id = "timeTable">	</table></div>
				</td>
				
			</tr>
			<tr> 
				<td class="top" align="left" colspan="2">예약일시</td>
			</tr>
			<tr>
				<td class="content" colspan="2" align="left"><input id="selectedDate" name="selectedDate" value="" readonly="readonly"></input>
				<input id="selectedTime" name="selectedTime" value="" readonly="readonly"></input>
				<input type="hidden" id="room_no" value="${sp.room_no}">
				</td>
			</tr>
			<tr>
				<td class="top" align="left">결제정보</td>
			</tr>
			<tr>
				<td class="content" align="left" colspan="2"><input id="totalPrice" name="totalPrice" value="" readonly="readonly"></input></td>
			</tr>
			<tr>
				<td><input	type="button" id="guest_reserve" class="btn btn-primary text-wrap"  style="width: 150px;" value="예약하러가기"></td>
			</tr>
		</table>
				    </div>
				  </div>
				</div>
				</div>
</div>


</div>
</div>
<script>

$("#notlike").on("click", function(){
	alert("본 기능은 로그인이 필요합니다.로그인을 해주세요")
});

$(".cal_open").on("click",function(){
	if($("#divshow").css("display") == "none"){
	$("#divshow").css("display","");
	buildCalendar();
	}else{
	$("#divshow").css("display","none");
	}
});

$("#guest_reserve").on("click", function(){
	arr = new Array();	
	selectedDate = document.getElementById("selectedDate");
	selectedTime = document.getElementById("selectedTime");
	totalPrice = document.getElementById("totalPrice");
	room_no = '${sp.room_no}';
	space_no = '${sp.space_no}';
	member_no = '${memberdto.member_no}';
	arr.push(selectedDate);
	arr.push(selectedTime);
	arr.push(totalPrice);
	arr.push(room_no);
	arr.push(space_no);
	if(member_no==""){
		alert("먼저 로그인을 해주세요");
		return false;
	}
	for (i = 0; i < arr.length; i++){
		item = arr[i];
		if(item.value == "" ){
			alert("날짜와 시간을 다시 선택해주세요");
			item.focus();
			return false;
		}
	}
	data = {
			selectedDate : $("#selectedDate").val(),
			selectedTime : $("#selectedTime").val(),
			totalPrice : $("#totalPrice").val(),
/* 			selectedDate : document.getElementById("selectedDate").value,
			selectedTime : document.getElementById("selectedTime").value,
			totalPrice : document.getElementById("totalPrice").value, */
			room_no : '${sp.room_no}',
			space_no : '${sp.space_no}'
	}
	reserve(data);
});

function reserve(data){
	$.ajax({
		type:'POST'
		, url:'guest_reserve.do'
		,dataType: "json"
		, data: data
		, success: function(res) {
			var hashMapString = JSON.stringify(res);
				console.log(res);
				alert("예약페이지 이동");
				location.href="guest_reserve_form.do";
	
			}
		,error:function(request,status,error){
      	  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
	})
} 

	function chgLike(data){
	$.ajax({
		type:'POST'
		, url:'guest_like.do'
		,dataType: "json"
		, data: data	
		, success: function(res) {
			if(res==0){
				alert("찜목록에서 제거")
			}else if(res == 1){
				alert("찜목록에 추가")
			}
		}
		,error:function(request,status,error){
      	  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
	})
} 

$("#like").on("click",function(){
	var data = {
			room_no : '${sp.room_no}',
			member_no : '${memberdto.member_no}'
	}
	if($("#like").hasClass("member-unlike")){
		$("#like").removeClass();
		$(this).attr("src","resources/img/guest/suit-heart-fill.svg");
		$("#like").toggleClass("member-like");
		
	}else {
		$("#like").removeClass();
		$(this).attr("src","resources/img/guest/suit-heart.svg");
		$("#like").toggleClass("member-unlike");
		
	}
	chgLike(data);
});

 



</script>
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
var spaceaddr = '${sdto.space_addr}'.split(',');
console.log(spaceaddr[0]);
geocoder.addressSearch(spaceaddr[0], function(result, status) {

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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${sdto.space_nm}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
     }
})
</script>
</body>
</html>
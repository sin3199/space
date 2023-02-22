<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="top.jsp"%>

<section class="dashboard">
	<div class="top">
		<i class="uil uil-bars sidebar-toggle"></i>


		<div class="select-box col-md-">
			<select class="form-control" name="select">
				<option selected>선택</option>
				<option value="res_nm">예약자명</option>
				<option value="room_nm">방이름</option>
				<option value="use_dt">이용시작일</option>
				<option value="res_email">예약자이메일</option>
				<option value="res_personnel">예약인원수</option>
			</select>
		</div>
		<div class="search-box">
			<i class="uil uil-search"></i> <input class="form-search" type="text"
				name="search" id="listReserveSearch">
		</div>
		<div class="search-button">
			<button id="listReserveSearchButton" type="button"
				class="btn btn-dark">검색</button>
		</div>


		<div class="page-move">
            	<a class="pageMoveTo" href="guest_main.do">
                    <span class="link-name">게스트</span>
            	</a>
            	<a class="pageMoveTo" href="host_home.do">
                    <span class="link-name">호스트</span>
            	</a>
            </div>








	</div>





	<div class="dash-content">
		<div>
			<table class="table">
				<thead class="table-head">
					<tr>
						<th>예약자명<i id="res_nm" class="uil uil-sort-amount-down"></i></th>

						<th>방이름<i id="res_room_nm" class="uil uil-sort-amount-down"></i></th>

						<th>이용시작일<i id="res_use_dt" class="uil uil-sort-amount-down"></i></th>
						<th>이용종료<i id="res_use_time" class="uil uil-sort-amount-down"></i></th>

						<th>호스트연락처<i id="res_space_pno"
							class="uil uil-sort-amount-down"></i></th>

						<th>예약자연락처<i id="res_pno" class="uil uil-sort-amount-down"></i></th>
						<th>예약자이메일<i id="res_email" class="uil uil-sort-amount-down"></i></th>
						<th>예약인원수<i id="res_personnel"
							class="uil uil-sort-amount-down"></i></th>
						<th>결제유무<i id="res_st" class="uil uil-sort-amount-down"></i></th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody class="table-body">
					<c:if test="${empty listReserve}">
						<c:forEach var="dto" items="${searchReserve}">
							<tr>
								<td>${dto.res_nm}</td>

								<td>${dto.room_nm}</td>

								<td>${dto.use_dt}</td>

								<td>${dto.use_time}</td>

								<td>${dto.space_pno}</td>
								<td>${dto.res_pno}</td>
								<td>${dto.res_email}</td>
								<td>${dto.res_personnel}명</td>
								<td><a class="cancelHover" href="cancelReserve.do?res_no=${dto.res_no}" onclick="return cancelCheck();">${dto.res_st}</a></td>
								<td class="deleteReserve"><a href="reserveDelete.do?res_no=${dto.res_no}" onclick="return removeCheck();">삭제</a></td>
							</tr>
						</c:forEach>
						<c:if test="${empty searchReserve}">
							<tr>
								<td colspan="6">등록된 예약이 없습니다.</td>
							</tr>
						</c:if>
					</c:if>
					<c:forEach var="dto" items="${listReserve}">
						<tr>
							<td>${dto.res_nm}</td>

							<td>${dto.room_nm}</td>

							<td>${dto.use_dt}</td>

							<td>${dto.use_time}</td>

							<td>${dto.space_pno}</td>
							<td>${dto.res_pno}</td>
							<td>${dto.res_email}</td>
							<td>${dto.res_personnel}명</td>
							<td><a class="cancelHover" href="cancelReserve.do?res_no=${dto.res_no}" onclick="return cancelCheck();">${dto.res_st}</a></td>
							<td class="deleteReserve"><a href="reserveDelete.do?res_no=${dto.res_no}" onclick="return removeCheck();">삭제</a></td>
						</tr>
					</c:forEach>
					<c:if test="${not empty RR && RR >0}">
					<script>
						alert('예약기간이 남아있는 예약건이 있어 삭제할 수 없습니다.\n예약일이 지나고 나서 다시시도 하시거나, 예약건을 취소하세요');
					</script>
						<tr>
						 <td colspan="10">예약기간이 남아있는 예약은 총 ${remainedReservation} 건 입니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<div class="paging">
				<c:if test="${not empty listReserve}">	
					<c:if test="${startPage > pageBlock}">
						[<a href="admin_listReserve.do?pageNum=${startPage-1}">이전</a>]
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						[<a href="admin_listReserve.do?pageNum=${i}">${i}</a>]
					</c:forEach>	
					<c:if test="${pageCount > endPage}">
						[<a href="admin_listReserve.do?pageNum=${endPage+1}">다음</a>]
					</c:if>
				</c:if>
				<c:if test="${not empty searchReserve}">
				<c:if test="${startPage > pageBlock}">
					[<a href="admin_listReserve.do?RR=${RR}&pageNum=${startPage-1}">이전</a>]
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					[<a href="admin_listReserve.do?RR=${RR}&pageNum=${i}">${i}</a>]
				</c:forEach>	
				<c:if test="${pageCount > endPage}">
					[<a href="admin_listReserve.do?RR=${RR}&pageNum=${endPage+1}">다음</a>]
				</c:if>				
			</c:if>
				
			</div>
			
			
		</div>
	</div>



	<%@ include file="bottom.jsp"%>
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
				<option value="room_nm">방 이름</option>
				<option value="room_fit">수용인원</option>
				<option value="member_nm">host닉네임</option>
			</select>
		</div>
		<div class="search-box">
			<i class="uil uil-search"></i> <input class="form-search" type="text"
				name="search" id="listRoomSearch">
		</div>
		<div class="search-button">
			<button id="listRoomSearchButton" type="button" class="btn btn-dark">검색</button>
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
		<div class="col-md-12">
			<table class="table">
				<thead class="table-head">
					<tr>
						<th>Host 닉네임<i id="room_host_nm"
							class="uil uil-sort-amount-down"></i></th>

						<th>카테고리<i id="room_cate_nm" class="uil uil-sort-amount-down"></i></th>

						<th>방 이름<i id="room_nm" class="uil uil-sort-amount-down"></i></th>
						<th>방 가격<i id="room_price" class="uil uil-sort-amount-down"></i></th>
						<th>수용인원<i id="room_fit" class="uil uil-sort-amount-down"></i></th>
						<th>방설명<i id="room_desc" class="uil uil-sort-amount-down"></i></th>
						<th>대표이미지</th>
						<th>대여가능시간<i id="room_time" class="uil uil-sort-amount-down"></i></th>
						<th>휴무요일<i id="room_date" class="uil uil-sort-amount-down"></i></th>
						<th>승인상태<i id="room_st" class="uil uil-sort-amount-down"></i></th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody class="table-body">
					<c:if test="${empty listSpaceRoom}">
						<c:forEach var="dto" items="${searchRoom}">
							<tr>
								<td>${dto.member_nm}</td>

								<td>${dto.cate_nm}</td>

								<td>${dto.room_nm}</td>
								<td>${dto.room_price}원</td>
								<td>${dto.room_fit}명</td>
								<td>${dto.room_desc}</td>
								<td><img src="/resources/img/${dto.room_img1}" width="200" height="180"></td>
								<td>${dto.room_time_s} ~ ${dto.room_time_e}</td>
								<td>${dto.room_week}</td>
								<c:if test="${dto.room_st != '승인대기중'}">
								<td>${dto.room_st}</td>
								</c:if>
								<c:if test="${dto.room_st == '승인대기중'}">
								<td><a class="approveRoom" href="approveRoom.do?room_no=${dto.room_no}" onclick="return approveCheck();">${dto.room_st}</a></td>
								</c:if>
								<td class="deleteRoom"><a href="roomDelete.do?room_no=${dto.room_no}" onclick="return removeCheck();">삭제</a></td>
							</tr>
						</c:forEach>

						<c:if test="${empty searchRoom}">
							<tr>
								<td colspan="6">등록된 예약이 없습니다.</td>
							</tr>
						</c:if>
					</c:if>
					<c:forEach var="dto" items="${listSpaceRoom}">
						<tr>
							<td>${dto.member_nm}</td>

							<td>${dto.cate_nm}</td>

							<td>${dto.room_nm}</td>
							<td>${dto.room_price}원</td>
							<td>${dto.room_fit}명</td>
							<td>${dto.room_desc}</td>
							<td><img src="/resources/img/${dto.room_img1}" width="200" height="180"></td>
							<td>${dto.room_time_s} ~ ${dto.room_time_e}</td>
							<td>${dto.room_week}</td>
							<c:if test="${dto.room_st != '승인대기중'}">
							<td>${dto.room_st}</td>
							</c:if>
							<c:if test="${dto.room_st == '승인대기중'}">
							<td><a class="approveRoom" href="approveRoom.do?room_no=${dto.room_no}" onclick="return approveCheck();">${dto.room_st}</a></td>
							</c:if>
							<td class="deleteRoom"><a href="roomDelete.do?room_no=${dto.room_no}" onclick="return removeCheck();">삭제</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="paging">
			<c:if test="${not empty listSpaceRoom}">	
				<c:if test="${startPage > pageBlock}">
					[<a href="admin_listRoom.do?pageNum=${startPage-1}">이전</a>]
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					[<a href="admin_listRoom.do?pageNum=${i}">${i}</a>]
				</c:forEach>	
				<c:if test="${pageCount > endPage}">
					[<a href="admin_listRoom.do?pageNum=${endPage+1}">다음</a>]
				</c:if>
			</c:if>
			<c:if test="${not empty searchRoom}">
				<c:if test="${startPage > pageBlock}">
					[<a href="admin_listRoom.do?hola=${hola}&pageNum=${startPage-1}">이전</a>]
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					[<a href="admin_listRoom.do?hola=${hola}&pageNum=${i}">${i}</a>]
				</c:forEach>	
				<c:if test="${pageCount > endPage}">
					[<a href="admin_listRoom.do?hola=${hola}&pageNum=${endPage+1}">다음</a>]
				</c:if>				
			</c:if>
		</div>
		</div>
	</div>



	<%@ include file="bottom.jsp"%>
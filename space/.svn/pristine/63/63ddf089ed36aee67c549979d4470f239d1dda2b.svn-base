<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="top.jsp" %>
 


<section class="dashboard">
        <div class="top">
            <i class="uil uil-bars sidebar-toggle"></i>
			
				<div class="select-box col-md-">
					<select class="form-control" name="select">  
						<option selected>선택</option>
						<option value="member_nm">닉네임</option>
						<option value="member_email">이메일</option>
						<option value="member_reg_dt">가입일자</option>
						<option value="member_pno">연락처</option>
						<option value="space_nm">건물이름</option>
						<option value="space_comnum">사업자번호</option>
					</select>
				</div>
				<div class="search-box">
					<i class="uil uil-search"></i>
					<input type="text" name="search" class="form-search" id="hostSearch">
				</div>
            	<div id="hostSearchButton" class="search-button">
            		<button type="button" class="btn btn-dark">검색</button>
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
					<th>닉네임<i id="host_nm" class="uil uil-sort-amount-down"></i></th>
					<th>이메일<i id="host_email" class="uil uil-sort-amount-down"></i></th>
					<th>가입일자<i id="host_reg_dt" class="uil uil-sort-amount-down"></i></th>
					<th>연락처<i id="host_pno" class="uil uil-sort-amount-down"></i></th>
					<th>건물이름<i id="space_nm" class="uil uil-sort-amount-down"></i></th>
					<th>사업자번호<i id="space_comnum" class="uil uil-sort-amount-down"></i></th>
					<th class="textPosition">삭제</th>
				</tr>
			</thead>
			<tbody class="table-body">
			<c:if test="${empty listHost}">
				<tr>
					<td colspan="6">등록된 Host가 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${listHost}">
					<tr>
						<td>${dto.member_nm}</td>
						<td>${dto.member_email}</td>
						<td>${dto.member_reg_dt}</td>
						<td>${dto.member_pno}</td>
						<td class="detailBuilding"><a href="buildingDetail.do?space_no=${dto.space_no}">${dto.space_nm}</a></td>
						<td>${dto.space_comnum}</td>
						<td class="deleteMember"><a href="memberDelete.do?member_no=${dto.member_no}" onclick="return removeCheck();">삭제</a></td>
					</tr>
			</c:forEach>
			</tbody>
		</table>
		<div class="paging">
		<c:if test="${not empty listHost}">	
			<c:if test="${startPage > pageBlock}">
				[<a href="admin_listHost.do?pageNum=${startPage-1}">이전</a>]
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				[<a href="admin_listHost.do?pageNum=${i}">${i}</a>]
			</c:forEach>	
			<c:if test="${pageCount > endPage}">
				[<a href="admin_listHost.do?pageNum=${endPage+1}">다음</a>]
			</c:if>
		</c:if>
		</div>
	</div>
</div>

<%@ include file="bottom.jsp"%>



































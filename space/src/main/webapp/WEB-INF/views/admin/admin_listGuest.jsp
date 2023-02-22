<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					</select>
				</div>
				<div class="search-box">
					<i class="uil uil-search"></i>
					<input type="text" name="search" class="form-search" id="guestSearch">
				</div>
            	<div id="guestSearchButton"class="search-button">
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
		<table id="listGuest"class="table">
			<thead class="table-head">
				<tr>
					<th>닉네임<i id="member_nm" class="uil uil-sort-amount-down"></i></th>
					<th>이메일<i id="member_email" class="uil uil-sort-amount-down"></i></th>
					<th>가입일자<i id="member_reg_dt" class="uil uil-sort-amount-down"></i></th>
					<th>연락처<i id="member_pno" class="uil uil-sort-amount-down"></i></th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody class="table-body">
				<c:if test="${empty listGuest}">
					<tr> 
						<td colspan="6">등록된 Guest가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${listGuest}">
					<tr>
						<td>${dto.member_nm}</td>
						<td>${dto.member_email}</td>
						<td>${dto.member_reg_dt}</td>
						<td>${dto.member_pno}</td>
						<td class="deleteMember"><a href="memberDelete.do?member_no=${dto.member_no}" onclick="return removeCheck();">삭제</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="paging">
		<c:if test="${not empty listGuest}">	
			<c:if test="${startPage > pageBlock}">
				[<a href="admin_listGuest.do?pageNum=${startPage-1}">이전</a>]
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				[<a href="admin_listGuest.do?pageNum=${i}">${i}</a>]
			</c:forEach>	
			<c:if test="${pageCount > endPage}">
				[<a href="admin_listGuest.do?pageNum=${endPage+1}">다음</a>]
			</c:if>
		</c:if>
		</div>
	</div>
</div>
<%@ include file="bottom.jsp"%>

			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			







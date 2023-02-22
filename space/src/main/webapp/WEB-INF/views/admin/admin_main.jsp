<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="top.jsp"%>
<style>
.mainPageAdmin{
	padding-top: 0%!important;
}
.needToApprove{
	display: block;
	color: #FF4500!important;
	font-size: 24px!important;
}

</style>
<section class="dashboard">
        <div class="top">
            <i class="uil uil-bars sidebar-toggle"></i>
            
            
            <div class="page-move">
            	<a class="pageMoveTo" href="guest_main.do">
                    <span class="link-name">게스트</span>
            	</a>
            	<a class="pageMoveTo" href="host_home.do">
                    <span class="link-name">호스트</span>
            	</a>
            </div>
        </div>



 		<div class="dash-content mainPageAdmin">
            <div class="overview">
                <div class="title">
                    <i class="uil uil-tachometer-fast-alt"></i>
                    <span class="text">현황판</span>
                </div>

                <div class="boxes">
                    <div class="box box1">
                       	 	<i class="uil uil-home"></i>
                       	 	<span class="text">승인대기중인 방 수</span>
                    	<a href="admin_listRoom.do?column=room_st&sort=asc">
                    		<c:if test="${roomCount != 0}">
                    		<span class="badge badge-danger">승인필요</span>
                    		<span class="number needToApprove">${roomCount}</span>
                    		</c:if>
                    		<c:if test="${roomCount == 0}">
                       	 	<span class="number">${roomCount}</span>
                       	 	</c:if>
                    	</a>
                    </div>
                    <div class="box box2">
                        <i class="uil uil-clipboard-notes"></i>
                        <span class="text">전체 예약 수</span>
                        <span class="number">${resCount}</span>
                    </div>
                    <div class="box box3">
                        <i class="uil uil-users-alt"></i>
                        <span class="text">전체 회원 수</span>
                        <span class="number">${memCount}</span>
                    </div>
                </div>
            </div>

            <div class="activity">
                <div class="title">
                    <i class="uil uil-clock-three"></i>
                    <span class="text">최근 가입한 회원</span>
                </div>

                <div class="activity-data">
                	<div class="spaceSideAdminMain">
                	</div>
                    <div class="data names">
                        <span class="data-title">이름</span>
                        <c:forEach var="dto" items="${mainData}">
                        <span class="data-list"><c:out value="${dto.member_nm}"/></span>                      
                        </c:forEach>
                    </div>
                    <div class="data email">
                        <span class="data-title">이메일</span>
						<c:forEach var="dto" items="${mainData}">
                        <span class="data-list"><c:out value="${dto.member_email}"/></span>                      
                        </c:forEach>
                    </div>
                    <div class="data joined">
                        <span class="data-title">가입일</span>
						<c:forEach var="dto" items="${mainData}">
                        <span class="data-list"><c:out value="${dto.member_reg_dt}"/></span>                      
                        </c:forEach>
                    </div>
                    <div class="data type">
                        <span class="data-title">계정 분류</span>
						<c:forEach var="dto" items="${mainData}">
                        <span class="data-list"><c:out value="${dto.member_grade}"/></span>                      
                        </c:forEach>
                    </div>
                  	<div class="spaceSideAdminMain">
                	</div>
                </div>
            </div>
        </div>




<%@ include file="bottom.jsp"%>
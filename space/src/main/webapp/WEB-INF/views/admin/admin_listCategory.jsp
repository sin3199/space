<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="top.jsp" %>
<script type="text/javascript">
	function cateDel(cate_no){
		var isDel = window.confirm("삭제하시겠습니까?")
		if (isDel){
			document.d.cate_no.value = cate_no
			document.d.submit()
		}
	}
	
</script>
<section class="dashboard">
        <div class="top">
            <i class="uil uil-bars sidebar-toggle"></i>
			
			
				<div class="select-box col-md-">
					<select class="form-control" name="select">  
						<option selected>선택</option>
						<option value="cate_nm">카테고리명</option>
					</select>
				</div>
				<div class="search-box">
					<i class="uil uil-search"></i>
					<input class="form-search" type="text" name="search" id="cateSearch">
				</div>
            	<div class="search-button">
            		<button id="cateSearchButton" type="button" class="btn btn-dark">검색</button>
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
	<form name="d" method="post" action="catedel.do">
	<input type="hidden" name="cate_no">
		<table class="table">
			<thead class="table-head">
				<tr clsss="table-secondary">
					<th>카테고리 명<i id="cate_nm" class="uil uil-sort-amount-down"></i></th>
					<th>아이콘</th>
					<th>삭제</th> 
				</tr>
			</thead>
			<tbody class="table-body">
				<c:if test="${empty listCate}">
					<tr>
						<td colspan="6">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>
				
				
				<c:forEach var="dto" items="${listCate}">
					<tr>
						<td>${dto.cate_nm}</td>
						<td><img src="/resources/img/cateIcon/${dto.cate_img}" width="200" height="180"></td>
						<td><a href="catedel.do?cate_no=${dto.cate_no}" onclick="return removeCheck();">삭제</a></td>
						
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
		</form>
		<div class="paging">
		<c:if test="${not empty listCate}">	
			<c:if test="${startPage > pageBlock}">
				[<a href="admin_listCategory.do?pageNum=${startPage-1}">이전</a>]
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				[<a href="admin_listCategory.do?pageNum=${i}">${i}</a>]
			</c:forEach>	
			<c:if test="${pageCount > endPage}">
				[<a href="admin_listCategory.do?pageNum=${endPage+1}">다음</a>]
			</c:if>
		</c:if>
		</div>
	</div>
</div>
<%@ include file="bottom.jsp"%>















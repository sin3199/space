<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
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





	<div class="dash-content heyCate">
		<form class="insert-form" name="f" action="admin_insertCategory.do" method="post"
					enctype="multipart/form-data">
			<div class="col-md-12">
				<label class="cate-label">카테고리 명</label>	
				<input class="form-control" type="text" placeholder="카테고리명" name="cate_nm"><br>
			</div>
  				<label for="formFile" class="form-label">카테고리 아이콘</label>
			<div class="mb-3 col-md-12 filebox">
    			<input class="upload-name form-control" value="첨부파일" placeholder="첨부파일">
    			<label for="file">파일찾기</label> 
    			<input type="file" id="file" name="cate_img">
			</div><br>
			<span style="padding:0 5px 0 5px">
				<input type="submit" class="btn btn-primary" value="등록">
			</span>
			<span style="padding:0 5px 0 5px">
				<input type="reset" class="btn btn-primary" value="취소">
			</span>
		</form>
	</div>

	
<%@ include file="bottom.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../host_top.jsp"%>

<!-- center// -->
<div class="container">

	<div class="py-5 text-center">
		<h2>건물 정보를 입력해주세요.</h2>
	</div>
	<hr class="mb-4">
	<form class="needs-validation" name="f" action="host_buildingFix_ok.do"
		method="post" enctype="multipart/form-data">
		<input type="hidden" name="member_no" value="${memberdto.getMember_no()}" />
		<input type="hidden" name="space_no" value="${gethostBuilding.getSpace_no()}" />
		<label for="email">카테고리*<span class="text-muted">(Optional)</span>
		</label>

		<div class="mb-3">
			<select class="form-control" name="cate_no">
				<c:forEach var="dto" items="${listCate}">
					<option value="${dto.cate_no}">${dto.cate_nm}</option>
				</c:forEach>
			</select>
		</div>

		<div class="form-row">
			<div class="mb-3 col-md-6">
				<label for="email">건물명* <span class="text-muted">(Optional)</span></label>
				<input type="text" class="form-control" name="space_nm" placeholder="" value="${gethostBuilding.space_nm}">
			</div>

			<div class="mb-3 col-md-6">
				<label for="email">건물 부제목* <span class="text-muted">(Optional)</span></label>
				<input type="text" class="form-control" name="space_sub_nm" placeholder="" value="${gethostBuilding.space_sub_nm}">
			</div>
		</div>

		<div class="mb-3">
			<label for="email">건물 소개* <span class="text-muted">(Optional)</span></label>
			<textarea class="form-control" name="space_intro" placeholder="">${gethostBuilding.space_intro}</textarea>
		</div>

		<div class="mb-3">
			<label for="email">시설안내* <span class="text-muted">(Optional)</span></label>
			<textarea class="form-control" name="space_guide" placeholder="">${gethostBuilding.space_guide}</textarea>
		</div>

		<div class="mb-3">
			<label for="email">주의사항* <span class="text-muted">(Optional)</span></label>
			<textarea class="form-control" name="precautions" placeholder="">${gethostBuilding.precautions}</textarea>
		</div>

		<div class="mb-3">
			<label for="email">건물 주소* <span class="text-muted">(Optional)</span></label>
			<input type="search" id="address_kakao" class="form-control" name="space_addr" placeholder="" value="${fn:split(gethostBuilding.space_addr, ',')[0]}" readonly>
		</div>

		<div class="mb-3">
			<label for="email">상세 주소* <span class="text-muted">(Optional)</span></label>
			<input type="text" class="form-control" name="space_addr" placeholder="" value="${fn:split(gethostBuilding.space_addr, ',')[1]}">
		</div>


		<div class="mb-3">
			<label for="email">전화번호* <span class="text-muted">(Phonenumber)</span></label>&nbsp
			<input type="text" id="member_pno" name="space_pno" class="form-control" placeholder="전화번호" value="${gethostBuilding.space_pno}" required autofocus>
		</div>

		<label for="email">휴무일 <span class="text-muted">(Optional)</span></label>
		<div class="form-row">&nbsp
			<div class="mb-3">
				<input type="date" class="form-control" name="space_closed_dt" placeholder="" value="${gethostBuilding.space_closed_dt}">
			</div>
		</div>


		<label for="email">휴무일 추가 <span class="text-muted">(Optional)</span></label>
		<div class="form-row">&nbsp
			<div class="mb-3">
				<input type="date" class="form-control" name="space_time" placeholder="" value="${gethostBuilding.space_time}">
			</div>
		</div>




		<div class="mb-3">
			<label for="email">사업자 등록번호* <span class="text-muted">(-빼고입력)</span></label>
			<input type="text" class="form-control" name="space_comnum" placeholder="3332255555" value="${gethostBuilding.space_comnum}">
		</div>
		<br>
		<hr class="mb-4">

		<button class="btn btn-dark btn-lg btn-block" type="submit">
			Continue to checkout
		</button>
	</form>

</div>

<!-- center// -->

<%@ include file="../host_bottom.jsp"%>

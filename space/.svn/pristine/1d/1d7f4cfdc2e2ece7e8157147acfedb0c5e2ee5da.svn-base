//Modal111111111111111111111111
function modaltest(res_no){
	
	$.ajax({
		type : "post",
		url : "res.do",
		dateType : "json",
		data :{
			res_no	: res_no
		},
		success : function(res){
			$(".container-lg").empty();
			
			var str = '    	<div class="container-lg">';
			$.each(res, function(i){
			      
			    str  += '<table class="table" style="text-align: center;">';
				str  +='<tr>';
			    str  +='<th class="col-1">인원수</th>';
			    str  += '<th class="col-2">예약자연락처</th>';
			    str  += '<th class="col-3">예약자이메일</th>';
			    str  +=    '<th class="col-3">사용목적</th>';
		    	str  +=  '</tr>';
		      		
			    str  +=   ' <tr>';
			    str  +=    	'<td>'+this.res_personnel+'</td>';
			    str  +=    	'<td>'+this.res_pno+'</td>';
			    str  +=    	'<td>'+this.res_email+'</td>';
			    str  +=   	'<td>'+this.res_purpose+'</td>';
			 
			    str  +=   '</tr>';
			    str  += '</table>';
			        
			    str  +=    '<table class="table" style="text-align: center;">';
			    str  +='<tr>';
			    str  +=   '<th class="col-4">요청사항</th>';
			    str  +=    '<th class="col-3">이용 시작일</th>';
			    str  +=   '<th class="col-3">이용 종료일</th>';
			    str  +=   '</tr>';

			    str  +=    '<tr>';
			    str  +=    	'<td>'+this.res_req+'</td>';
			    str  +=    	'<td>'+this.use_dt+'</td>';
			    str  +=    	'<td>'+this.use_time+'</td>';
			    str  +=   '</tr>';
			    str  +=   '</table>';
			    str  += '</div>';
			});
			$('.container-lg').append(str);
			
			console.log(res.res);
		},
		error : function(err){
			console.log(err);
		}
			
	});
}

function modalreview(res_no) {
	$.ajax({
		type : "post",
		url : "review.do",
		dateType : "json",
		data : {
			res_no : res_no
		},
		success : function(res) {
			$(".container-body").empty();

			var str = '';
			
				$.each(res, function(i) {
					if(typeof this.res_nm !== "undefined"){
						str += this.res_nm + ' 님 의 후기 ' + this.res_like + '점 날짜: '
								+ this.rev_dt + '<br>';
						
						if(typeof this.img !== "undefined"){
							str += this.img;
						}
						
						str += '<p>' + this.rev_content + '</p>';
						
						str += '<form class="needs-validation" name="f" action="host_buildingCheck.do" method="post" enctype="multipart/form-data">';
						str += 	'<div class="form-group">';
						str += 		'<label for="message-text" class="col-form-label">Message:</label>';
						str += 		'<textarea class="form-control" id="message-text" name="reply_content"></textarea>';
						str += 	'</div>';
						str += 	'<input type="hidden" name="rev_no" value="'+ this.rev_no +'"/>';
						str += 	'<input type="hidden" name="reply_st" value="0"/>';
						str += '<div class="modal-footer">';
						str += 	'<button id="submit-button" class="btn btn-secondary">확인</button>';
						str += 	'<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>';
						str += '</div>'
						str += '</form>';
						
					} else {
						str += '후기가 없습니다.<br><br>';
						str += '<div class="modal-footer">';
						str += '<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>';
						str += '</div>'
					}
					
					


				});
			
			$('.container-body').append(str);

			console.log(res.res);
		},
		error : function(err) {
			console.log(err);
		}

	});
}


//2222222 post
$('#submit-button2').click(function() {
	const message2 = $('#message2').val();

	$.ajax({
		type : "post",
		url : "host_review_ok.do",
		dataType : "json",
		data : {
			message2: message2
		},
		success : function(res) {
			console.log(res);
			
			
		},
		error : function(err) {
			console.log(err);
		}

	});

});

//333333333333333333333333333333333333333333333
function paycheckModal(res_no) {
	$.ajax({
		type : "post",
		url : "host_paycheck.do",
		dateType : "json",
		data : {
			res_no : res_no
		},
		success : function(payc) {
			$(".container-md").empty();

			var pc = '<div class="container-md">';
			
				$.each(payc, function(i) {
					
	 				pc+='<br>'	
					pc+='<span>결  제 일 : '+this.pay_date+'</span><br>';
					pc+='<br>'
				if(this.pay_st !==0){
					
					pc+='<span>결제상태 : 완료</span><br>';
					
					if(this.pay_st ==2){
					
						pc+='<span>결제상태 : 취소</span><br>';
					}
					
					}else{
						pc+='<span>결제상태 : 대기</span><br>';
					}
					pc+='<br>'
					pc+='<span>결제금액 : '+this.pay_pr+'원</span><br>';
					pc+='<br>'
 					
					pc+='<button type="submit" class="btn btn-outline-dark" onclick="javascript:checkPay('+this.res_no+')" >결제 완료</button>'
					console.log(this.pay_st);
					
				});
			
			$('.container-md').append(pc);
		
		},
		error : function(err) {
			console.log(err);
		}

	});
}



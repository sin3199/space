/**
 * 
 */

//내 찜목록에서 찜목록 삭제
function unlike(member_no, room_no){
	var con = confirm("찜목록에서 삭제하시겠습니까?")
	if(!con){
		return false;
	}else {
		$.ajax({
			type : "post",
			url : "guest_unLike.do",
			dataType : "json",
			async : false,
			data : {
				member_no: member_no, 
				room_no: room_no
			},
			success : function(res){
				console.log(res.res);
				if(res.res>0){
					console.log("찜목록 삭제 성공")
					location.reload(true);
				}else {
					console.log("찜목록 삭제 실패")
				}
			},
			error : function(err) {
				console.log(err);
			}
		});
	}
}
//<!-- Validation -->
//Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();

//------------------------------------------------------------------------
function CV_checkPasswordPattern(str) {
	var pattern1 = /[0-9]/; // 숫자
	var pattern2 = /[a-zA-Z]/; // 문자
	var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
	if (!pattern1.test(str) || !pattern2.test(str) || !pattern3.test(str)
			|| str.length < 8) {
		alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.");
		return false;
	} else {
		return true;
	}
}

function CV_checkIdPattern(str) {
	var pattern1 = /[0-9]/; // 숫자
	var pattern2 = /[a-zA-Z]/; // 문자
	var pattern3 = /[~!#$%^&*()_+|<>?:{}]/; // 특수문자

	var numtextyn = (pattern1.test(str) || pattern2.test(str));
	if (!numtextyn || pattern3.test(str) || str.length > 14) {
		alert("닉네임은 14자리 이하 문자 또는 숫자로 구성하여야 합니다.");
		return false;
	} else {
		return true;
	}
}

function checkphone(str) {
	if (!str.length > 12) {
		alert("전화번호를 다시한번 확인하세요.")

		return false;
	} else {
		return true;
	}
}

function pwEdit(){
	var pw = $("#member_pw").val();
	var pw2 = $("#current_pw").val();
	
	$.ajax({
		type : "post",
		url : "pwEdit.do",
		dataType : "json",
		data :{
			member_pw : pw,
			current_pw : pw2,
		},
		success : function(res){
			console.log(res.res);
			$("#member_pw").val("")
			$("#current_pw").val("")
			$("#re_pw").val("")
			if (res.res == 1) {
				alert("패스워드가 변경되었습니다.");
			}else if(res.res ==3) {
				alert("패스워드가 틀렸습니다.");
			}
		},
		error : function(err){
			console.log(err);
		}
	});

}


$(document).ready(function() { // 제이쿼리 기본
	
	//Modal 닫기시 입력값 초기화
	$('.modal').on('hidden.bs.modal', function (e) {
	    console.log('modal close');
	  $(this).find('form')[0].reset()
	});
	
	$("#rev_content").keyup(function(e) {
		//console.log("키업!"); -->
		var content = $(this).val();
		$("#textCount").text("(" + content.length + "자"); //실시간 글자수 카운팅 
		if (content.length > 2000) {
				alert("최대 2000자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 45));
				$('#textCount').text("(2000");
 			}
		}); 

	
	$("#pwEdit").click(function(){
		pwEdit();
	})
	
	//전화번호 글자수 검사
	$("#member_pno").on("change", function() {
		let str = $("#member_pno").val()
		if (!checkphone(str)) {
			$("#member_pno").val("")
			$("#member_pno").focus();
		}
		;
	})
	
	//닉네임 변경시 패턴 체크
	$("#member_nm").on("change", function() { // click 이벤트 걸기 id값으로
		let str = $("#member_nm").val() // id값으로 내부값가져오기
		if (!CV_checkIdPattern(str)) {
			$("#member_nm").val("")
			$("#member_nm").focus();
		}
		;
	})
	
	//패스워드 패턴 확인
	$("#member_pw").on("change", function() {
		let str = $("#member_pw").val()
		if (!CV_checkPasswordPattern(str)) {
			$("#member_pw").val("")
			$("#member_pw").focus();
		}
		;
	})
	$("#current_pw").on("change", function() {
		let str = $("#current_pw").val()
		if (!CV_checkPasswordPattern(str)) {
			$("#current_pw").val("")
			$("#current_pw").focus();
		}
		;
	})
	$("#telMember_pw").on("change", function() {
		let str = $("#telMember_pw").val()
		if (!CV_checkPasswordPattern(str)) {
			$("#telMember_pw").val("")
			$("#telMember_pw").focus();
		}
		;
	})

	//비밀번호 재확인
	$("#re_pw").on("change", function() {
		let str = $("#member_pw").val()
		let str2 = $("#re_pw").val()
		if (str == str2) {
		} else {
			$("#re_pw").val("")
			$("#re_pw").focus();
			alert("비밀번호가 일치하지 않습니다.");
		}
		;
	})
	
	//전화번호 자동-
	var autoHypenPhone = function(str) {
		
		str = str.replace(/[^0-9]/g, '');
		var tmp = '';
		if (str.length < 4) {
			return str;
		} else if (str.length < 7) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3);
			return tmp;
		} else if (str.length < 11) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 3);
			tmp += '-';
			tmp += str.substr(6);
			return tmp;
		} else {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 4);
			tmp += '-';
			tmp += str.substr(7);
			return tmp;
		}
		return str;
	}
	
	var phoneNum = document.getElementById('member_pno');
	phoneNum.onkeyup = function() {
		if (this.value.length > 13) {
			alert("전화번호를 확인해주세요");
			this.value = autoHypenPhone((this.value).substring(0,13));
		}else{
			this.value = autoHypenPhone(this.value);
		}
	}
})





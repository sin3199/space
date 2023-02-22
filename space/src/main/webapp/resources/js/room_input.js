$(document).ready(function() { // 제이쿼리 기본
	$("button.day").click(function(){
		var btn = $(this)[0];
		
		var btnClass = btn.getAttribute("class");
		var btnClassArr = btnClass.split(" ");
		var newv = "";
		var v = btnClassArr[2];
		if(v == "btn-secondary"){
			newv = "btn-primary";
		}else if(v == "btn-primary"){
			newv = "btn-secondary";
		}
		btnClass = btnClass.replace(v, newv);
		btn.setAttribute("class", btnClass);
		console.log(btn[0]);
		var btnVal = btn.getAttribute("value");
		var newVal = (btnVal == 1 ? 0 : 1);
		btn.setAttribute("value", newVal);
		
		var els = $("button.day");
		var str = "";
		
		for(var i=0; i<els.length;i++){
			str += els[i].value;
		}
		$("#room_week").val(str);
	});
})

	function timeLimit(time){
		if(time.length>=3){
			if(isFinite(time)==false){
				alert("문자는 입력하실 수 없습니다.");
				time.value = 00;
				return false;
			}
			if(time>24){
				alert("시간은 23시를 넘길 수 없습니다.");
				time.value = 23;
				return false;
			}
			time.value = time;
		}
	}
	
	function checkRoom(){
		if(parseInt($(".startTime").val()) > parseInt($(".endTime").val())){
			alert("시작시간은 종료시간보다 이른시간이여야 합니다.");
			$(".startTime").focus();
			return false;
		}
		
	}

package com.bigdataB.space.dto;



import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReserveDTO {
	private int res_no;				//예약번호
	private String res_personnel;	//예약인원
	private String res_nm;			//예약자명
	private String res_pno;			//전화번호
	private String res_email;		//이메일
	private String res_purpose;		//사용목적
	private String res_req;			//요청사항
	private int res_st;				//예약상태
	private int member_no;			//예약자 번호
	private int room_no;			//방 번호
	private int totalPrice;			//결제금액 1:현장결제, 2:무통장입금
	private int pay_m;				//결제 방식
	private String use_dt;
	private String use_time;
//	//대여가능 시작시간
//	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH")
//	private Date use_dt;
//
//	//대여종료 시간
//	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH")
//	 private Date use_time;
	
	
	private String day;
	private int TotalTime;
	private int startday;
}

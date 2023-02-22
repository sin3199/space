package com.bigdataB.space.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MemberDTO {
	private int member_no;			//회원번호
	private String member_email;	//회원이메일
	private String member_pw;		//패스워드
	private String member_nm;		//닉네임
	private String member_pno;		//회원전화번호
	private String member_reg_dt;	//가입일
	private int member_grade;		//회원등급
	
	private SpaceDTO spaceDTO;
	
}

package com.bigdataB.space.dto;


import lombok.Getter;
import lombok.Setter;



@Setter
@Getter
public class ReservedRoomDTO {
	private int res_no;
	private String res_nm;
	
	private String room_nm;

	private String use_dt;
	private String use_time;
	
	private String space_pno;
	
	private String res_pno;
	private String res_email;
	private String res_personnel;
	
	private String res_st;
	private int room_no;
}

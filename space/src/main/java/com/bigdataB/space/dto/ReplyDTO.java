package com.bigdataB.space.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReplyDTO {
	private int rev_no;
	private Date reply_dt;
	private String reply_content;
	private int reply_st;
	

}

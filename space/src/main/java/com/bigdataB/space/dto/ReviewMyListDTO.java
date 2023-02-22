package com.bigdataB.space.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class ReviewMyListDTO {
	private int rev_no; 				//리뷰 번호
	private String rev_content; 	//리뷰 내용
	private int res_like;				//별점
	private String res_img; 		//리뷰 이미지
	private String use_dt; 			//사용 시간
	private int res_no; 				//예약 번호
	private int room_no; 			//방 번호
	private String room_nm; 		//방 이름
	private String room_img1;	//방이미지1

}

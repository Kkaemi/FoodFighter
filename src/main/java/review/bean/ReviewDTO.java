package review.bean;

import lombok.Data;

@Data
public class ReviewDTO {
	private int seq_review;
	private int member_seq;
	private String nickname;
	private String storename;
	private String starAvg;
	private String content;
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	private String image5;
}

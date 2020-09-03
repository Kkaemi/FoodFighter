package review.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	private int seq_review;
	private int member_seq;
	private String nickname;
	private String resName;
	private String resScore;
	private String content;
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	private String image5;
	private Date reviewDate;
}

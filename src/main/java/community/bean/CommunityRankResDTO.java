package community.bean;

import lombok.Data;

@Data
public class CommunityRankResDTO {
	private String resSeq;
	private String resName; // 음식점 이름
	private String resScore; // 평점
	private String resImage1; // 가게 이미지
	private String resAddress; // 주소
	private String resTheme; // 음식 종류
	private String resMenu; // 대표메뉴
	
	private int seq_review;
	private String image1; //리뷰 이미지
	private String content; // 리뷰내용
}

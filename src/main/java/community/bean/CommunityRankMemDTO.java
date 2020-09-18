package community.bean;

import lombok.Data;

@Data
public class CommunityRankMemDTO {
	
	// 유저정보
	private String nickname;
	private String profile;
	// 음식점 정보
	private int resSeq;
	private String resName;
	private String resScore;
	private String content;
	private String image1;

}

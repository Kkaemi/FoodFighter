package admin.bean;

import lombok.Getter;
import lombok.Setter;

//restaurant의 res만 따서 붙임
@Setter
@Getter
public class RestaurantDTO {
	private int seq;
	private String resName; // 음식점 이름
	private String resMapX; // 지도 좌표 x좌표
	private String resMapY; 
	private String resScore; // 평점
	private String resAddress; // 주소
	private String resTel; // 전화번호
	private String resTheme; // 음식 종류
	private String resPrice; // 가격대 
	private String resHours; // 영업시간
	private String resClosing; // 휴일
	private String resMenu; // 대표메뉴
	// to do : 이미지 여러개 넘기기 
	private String resImage1; // 가게 이미지 
	private String resImage2;
	// 이미지를.. 배열로 담아서 넘길 수 있는지 고민중 
	// 일단 테스트용으로 2개만 넘김
}

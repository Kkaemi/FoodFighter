package admin.bean;

import lombok.Getter;
import lombok.Setter;

// 도로명 주소를 기준으로 함 (행정구역, 도로명, 건물번호, 상세주소)
@Getter
@Setter
public class ZipcodeDTO {
	private String gu; // 행정구역 (서울시를 뺀 구 만 해당)
	private String roadname; // 도로명
	private String buildingname; // 건물 번호 혹은 이름
	private String detailAddr; // 상세주소
}

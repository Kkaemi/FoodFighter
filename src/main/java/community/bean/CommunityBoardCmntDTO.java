package community.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Component
public class CommunityBoardCmntDTO {
	private int rseq; //댓글 번호
	private int bseq; //게시글 번호
	private String rnickname; //댓쓴이 닉네임
	private String rcontent; //댓글 내용
	private String profile; //댓쓴이 프로필 사진
	private String secret; // 비밀댓글 여부 -> y는 공개댓 / n는 비밀댓글
	private String nickname; //게시글의 작성자(작성자와 비밀댓쓴이는 비밀댓글을 볼 수 있음) -> 어떻게 가져와야할지 생각 해봐야함
	
	//대댓 관련
	private int rref; //댓글 그룹번호
	private int rlev; //댓글 단계
	private int rstep; //댓글 순서
	private int rpseq; //원댓글 번호
	private int rreply; //댓글의 답글 수
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yy.MM.dd HH:mm")
	private Date rlogtime; //댓글 작성시간
	private String rshow; //댓글 삭제 여부 -> y는 게시 / n는 삭제
}

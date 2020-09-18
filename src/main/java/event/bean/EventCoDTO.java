package event.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class EventCoDTO {
	 private  int seq_eventco; // 댓글번호
	 private  int seq_event; //게시글번호
	 private String conickname; // 댓쓴닉네임
	 private String cocontent;  //댓글 내용
	 private String profile;
	 private String nickname;
	 private String secret; //비댓여부
	 
	//대댓 관련
	private int cref; //댓글 그룹번호
	private int clev; //댓글 단계
	private int cstep; //댓글 순서
	private int cpseq; //원댓글 번호
	private int creply; //댓글의 답글 수
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd")
	private Date clogtime; //댓글 작성시간
}

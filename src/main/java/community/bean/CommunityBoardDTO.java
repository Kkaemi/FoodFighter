package community.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Component
public class CommunityBoardDTO {
	private int bseq; //게시글 번호
    private String nickname; //작성자 아이디
    private String subject; //게시글 제목
    private String content; //게시글 내용
    private String profile; //작성자 프로필 사진
    private int cmt; //게시글 댓글 수
    
    //답글 관련
    private int ref; //그룹번호
    private int lev; //단계
    private int step; //글순서
    private int pseq; //원글번호
    private int reply; //답글 수
    
    private int hit; //조회수
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yy.MM.dd")
    private Date logtime; //글 작성 시간
    private String bshow; //글 삭제 여부 -> y는 게시 / n는 삭제
}
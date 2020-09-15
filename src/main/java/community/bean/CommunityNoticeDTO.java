package community.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class CommunityNoticeDTO {
	private int nseq; //게시글 번호
	private String nickname; //작성자 아이디
	private String subject;	//게시글 제목
    private String content; //게시글 내용
    private String profile; //작성자 프로필 사진
    private int hit; //조회수
    private Date logtime;	//작성일
    private String nshow; //글 삭제 여부
}
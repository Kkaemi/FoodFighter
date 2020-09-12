package community.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Component
public class QnaBoardDTO {
	
	private int seq;

    private String id;

    private String nickname;

    private String email;

    private String subject;

    private String content;
    
    private String password;

    private int ref;

    private int lev;

    private int step;
 
    private int pseq;
 
    private int reply;

    private int hit;
 
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd")
    private Date logtime;
}

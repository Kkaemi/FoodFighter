package event.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class EventDTO {
	private int seq_event;
	private String email;
	private String nickname;
	private String subject;
	private String content;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern= "yyyy.MM.dd")
	private Date logtime;
	private int hit;
	
}

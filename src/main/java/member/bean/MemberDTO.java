package member.bean;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {
	private int member_seq;
	private String email;
	private String pwd;
	private String name;
	private String nickname;
	private String roleId;
	private int socialLogin;
	private String profile;
	private Date signupDate;
}
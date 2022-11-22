package member.model;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;

public class MemberBean {
	
	private int num;
	@NotBlank(message = "ID를 입력하세요.")
	@Pattern(regexp = "^[0-9a-zA-Z]+$.{4,16}", message = "아이디 생성 조건을 확인하세요.")
	private String member_id;
	@NotBlank(message = "PW를 입력하세요.")
	@Pattern(regexp = "^(?=.*[a-zA-Z])|((?=.*\\d)|(?=.*\\W)).{10,16}", message = "비밀번호 생성 조건을 확인하세요.")
	private String passwd;
	@NotBlank(message = "이름을 입력하세요.")
	private String nameTitle;
	private String mobile1;
	private String mobile2;
	private String mobile3;
	@NotBlank(message = "이메일을 입력하세요.")
	@Pattern(regexp = "^[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$/i", message = "올바른 이메일 형식이 아닙니다.")
	private String email;
	private int point;
	private String agree;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getNameTitle() {
		return nameTitle;
	}
	public void setNameTitle(String nameTitle) {
		this.nameTitle = nameTitle;
	}
	public String getMobile1() {
		return mobile1;
	}
	public void setMobile1(String mobile1) {
		this.mobile1 = mobile1;
	}
	public String getMobile2() {
		return mobile2;
	}
	public void setMobile2(String mobile2) {
		this.mobile2 = mobile2;
	}
	public String getMobile3() {
		return mobile3;
	}
	public void setMobile3(String mobile3) {
		this.mobile3 = mobile3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getAgree() {
		return agree;
	}
	public void setAgree(String agree) {
		this.agree = agree;
	}
	
}



/*
	num number not null  primary key,
	member_id varchar2(100), -- (영문소문자/숫자, 4~16자)
	passwd varchar2(100), -- (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)
	user_passwd_confirm varchar2(100), -- 비밀번호 확인
	-- 삭제 hint varchar2(500), -- 비밀번호 확인 질문 
	-- 삭제 hint_answer varchar2(500), -- 비밀번호 확인 답
	nameTitle varchar2(50), -- 이름
	mobile1 varchar2(10),
	mobile2 varchar2(12),
	mobile3 varchar2(12),
	email varchar2(50),
	point int
*/
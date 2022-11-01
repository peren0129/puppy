package notice.model;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class NoticeBean {

	private String num;
	private String writer;
	private String subject;
	private String cate;
	private String cateopen;
	private Timestamp reg_date;
	private String content;
	private int readcount;
	private String image;
	
	private MultipartFile upload;
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) { //upload = a.jpg X
		System.out.println("setUpload(MultipartFile upload)");
		this.upload = upload;
		setImage(upload.getOriginalFilename());
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getCateopen() {
		return cateopen;
	}
	public void setCateopen(String cateopen) {
		this.cateopen = cateopen;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
}

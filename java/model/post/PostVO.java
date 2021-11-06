package model.post;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class PostVO {

	/*PNO INT PRIMARY KEY,
	MID VARCHAR(10),
	TITLE VARCHAR(20),
	CONTENT VARCHAR(1000),
	IMGNAME VARCHAR(100),
	LOCATION VARCHAR(50),
	PDATE DATE DEFAULT SYSDATE*/
	
	private int pno;
	private String mid;
	private String title;
	private String content;
	private String imgname;
	private String location;
	private Date pdate;
	
	private MultipartFile img;

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImgname() {
		return imgname;
	}

	public void setImgname(String imgname) {
		this.imgname = imgname;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	public MultipartFile getImg() {
		return img;
	}

	public void setImg(MultipartFile img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "PostVO [pno=" + pno + ", mid=" + mid + ", title=" + title + ", content=" + content + ", imgname="
				+ imgname + ", location=" + location + ", pdate=" + pdate + ", img=" + img + "]";
	}
	
}

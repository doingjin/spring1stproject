package model.member;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {

	/*MID VARCHAR(10) PRIMARY KEY,
	MPW VARCHAR(12),
	MNAME VARCHAR(20),
	EMAIL VARCHAR(20),
	-- PHONE VARCHAR(20), -- 고민
	PROFILE VARCHAR(100) DEFAULT '\img\gj.jpg'
	-- BG VARCHAR(100) DEFAULT 'BG.JPG'*/
	
	private String mid;
	private String mpw;
	private String mname;
	private String email;
	private String profile;
	
	private MultipartFile proimg;

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public MultipartFile getProimg() {
		return proimg;
	}

	public void setProimg(MultipartFile proimg) {
		this.proimg = proimg;
	}

	@Override
	public String toString() {
		return "MemberVO [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", email=" + email + ", profile="
				+ profile + ", proimg=" + proimg + "]";
	}
	
}

package com.team1.vo;

public class UserVO {

	private int u_idx;    // 자동 증가 유저 번호
	private String name;  // 유저 이름
	private String email; // 이메일
	private String pw;    // 비밀번호
	
	public int getU_idx() {
		return u_idx;
	}
	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
}

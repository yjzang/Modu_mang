package com.modu.vo;

public class ModuUserVo {
	private int userNo;
	private String email;
	private String password;
	private String name;
	private String birthday;
	public ModuUserVo() {
		
	}
	
	public ModuUserVo(String email, String password, String name, String birthday) {
		this.email = email;
		this.password = password;
		this.name = name;
		this.birthday = birthday;
	}
	
	public ModuUserVo(int userNo, String email, String password, String name, String birthday) {
		this.userNo = userNo;
		this.email = email;
		this.password = password;
		this.name = name;
		this.birthday = birthday;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	@Override
	public String toString() {
		return "ModuUserVo [userNo=" + userNo + ", email=" + email + ", password=" + password + ", name=" + name
				+ ", birthday=" + birthday + "]";
	}
	
	
	
	
	 
}

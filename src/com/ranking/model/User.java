package com.ranking.model;

public class User {

	private String id;
	private String pw;
	private int gender;
	private int age;
	private boolean subsc;
	private String email;
	
	private User(String id, String pw, int gender, int age, boolean subsc, String email){
		this.id = id;
		this.pw = pw;
		this.gender = gender;
		this.age = age;
		this.subsc = subsc;
		this.email = email;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public boolean isSubsc() {
		return subsc;
	}

	public void setSubsc(boolean subsc) {
		this.subsc = subsc;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
	
}

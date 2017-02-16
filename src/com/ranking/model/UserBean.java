package com.ranking.model;

public class UserBean {



	private int id;
	private String email;
	private String pw;
	private String nickname;


	private int gender;
	private int age;
	
	
	//TODO should be deleted soon
	public UserBean(){
		
	}
	
	public UserBean(String email, String pw){
		this.email = email;
		this.pw = pw;
	}
	
	public UserBean(int id, String email, String pw, String nickname, int gender, int age, int point){
		this.id = id;
		this.pw = pw;
		this.gender = gender;
		this.age = age;
		this.email = email;
	}
	
	
	//getter & setter
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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



	
	
}

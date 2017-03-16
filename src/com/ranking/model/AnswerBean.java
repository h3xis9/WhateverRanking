package com.ranking.model;

public class AnswerBean {

	private int answerID;
	private int targetRankNo;
	private int responderID;
	private boolean answer;
	
	//Variables from UserT
	private String nickname;
	private int age;
	private int gender;
	
	
	public String getNickName() {
		return nickname;
	}
	public void setNickname(String nickName) {
		this.nickname = nickName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	
	
	
	public int getAnswerID() {
		return answerID;
	}
	public void setAnswerID(int answerID) {
		this.answerID = answerID;
	}
	public int getTargetRankNo() {
		return targetRankNo;
	}
	public void setTargetRankNo(int targetRankNo) {
		this.targetRankNo = targetRankNo;
	}
	public int getResponderID() {
		return responderID;
	}
	public void setResponderID(int responderID) {
		this.responderID = responderID;
	}
	public boolean getAnswer() {
		return answer;
	}
	public void setAnswer(boolean answer) {
		this.answer = answer;
	}
	
	
	
}

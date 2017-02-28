package com.ranking.model;

public class AnswerBean {

	private int answerID;
	private int targetRankNo;
	private int responderID;
	private boolean answer;
	private String nickname;
	
	public String getNickName() {
		return nickname;
	}
	public void setNickname(String nickName) {
		this.nickname = nickName;
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

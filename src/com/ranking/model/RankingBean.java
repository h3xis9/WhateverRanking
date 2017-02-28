package com.ranking.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class RankingBean {

	private int rankingNo;
	private String rankingQuestion;
	private byte rankingReward;
	private int creatorId;
	private Timestamp postDate;
	
	private ArrayList<AnswerBean> answerList;
	
	private int answerTotal;
	private int answerYes;
	private int answerNo;
	
	
	public RankingBean(){
		
	}
	
	public RankingBean(int rankingNo){
		setRankingNo(rankingNo);
	}
		
	
	/*
	 * counting Answer tools
	 */
	public void initAnswerVar(){
		answerTotal = 0;
		answerYes = 0;
		answerNo = 0;
	}
	
	public void increaseYes(){
		answerTotal++;
		answerYes++;
	}
	
	public void increaseNo(){
		answerTotal++;
		answerNo++;
	}
	
	public int getAnswerTotal(){
		return answerTotal;
	}
	
	public int getAnswerYes(){
		return answerYes;
	}
	
	public int getAnswerNo(){
		return answerNo;
	}
	
	
	
	
	/* getter & setter */
	public int getRankingNo() {
		return rankingNo;
	}

	public void setRankingNo(int rankingNo) {
		this.rankingNo = rankingNo;
	}

	public String getRankingQuestion() {
		return rankingQuestion;
	}

	public void setRankingQuestion(String rankingQuestion) {
		this.rankingQuestion = rankingQuestion;
	}

	public byte getRankingReward() {
		return rankingReward;
	}

	public void setRankingReward(byte rankingReward) {
		this.rankingReward = rankingReward;
	}

	public int getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(int creatorId) {
		this.creatorId = creatorId;
	}

	public Timestamp getPostDate() {
		return postDate;
	}

	public void setPostDate(Timestamp postDate) {
		this.postDate = postDate;
	}
	
	public ArrayList<AnswerBean> getAnswerList() {
		return answerList;
	}

	public void setAnswerList(ArrayList<AnswerBean> answerList) {
		this.answerList = answerList;
	}
	
}

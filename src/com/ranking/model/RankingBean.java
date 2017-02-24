package com.ranking.model;

import java.sql.Timestamp;
import java.util.List;

public class RankingBean {

	private int rankingNo;
	private String rankingQuestion;
	private byte rankingReward;
	private int creatorId;
	private Timestamp postDate;
	
	public RankingBean(){
		
	}
	
	public RankingBean(int rankingNo){
		setRankingNo(rankingNo);
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
	
	
}

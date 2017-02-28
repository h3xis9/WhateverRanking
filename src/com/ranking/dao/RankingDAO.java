package com.ranking.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ranking.dbconn.DBConn;
import com.ranking.model.AnswerBean;
import com.ranking.model.RankingBean;

public class RankingDAO {

	private Connection conn;
	
	public RankingDAO(){
		conn = DBConn.getConnection();
	}
	
	public List<RankingBean> getRankingByID(String email){
		ArrayList<RankingBean> rankArr = new ArrayList<RankingBean>();
		
		try {
            PreparedStatement preparedStatement = conn.
                    prepareStatement("select * from rankingT where creatorID=(select id from userT where email=?)");
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
            	RankingBean ranking = new RankingBean();
                ranking.setRankingNo(rs.getInt("rankingNo"));
                ranking.setRankingQuestion(rs.getString("rankingQuestion"));
                ranking.setRankingReward(rs.getByte("rankingReward"));
                ranking.setPostDate(rs.getTimestamp("postDate"));
                ranking.setCreatorId(rs.getInt("creatorID"));
                rankArr.add(ranking);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
		return rankArr;
	}
	
	public List<RankingBean> getRankingByIdWithAnswers(String email){
		ArrayList<RankingBean> rankArr = new ArrayList<RankingBean>();
		
		try {
            PreparedStatement preparedStatement = conn.
                    prepareStatement("select * from rankingT where creatorID=(select id from userT where email=?)");
            preparedStatement.setString(1, email);
            
            
            
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
            	RankingBean ranking = new RankingBean();
                ranking.setRankingNo(rs.getInt("rankingNo"));
                ranking.setRankingQuestion(rs.getString("rankingQuestion"));
                ranking.setRankingReward(rs.getByte("rankingReward"));
                ranking.setPostDate(rs.getTimestamp("postDate"));
                ranking.setCreatorId(rs.getInt("creatorID"));
                
                //TODO get answerList(arrList type) from DB and set answerList by using Setter
                PreparedStatement answerListQuery = conn.prepareStatement("select * from answerT where targetRankNo = ?");
                answerListQuery.setInt(1, ranking.getRankingNo());
                ResultSet rs_Answers = answerListQuery.executeQuery();
                ArrayList<AnswerBean> answerList = new ArrayList<AnswerBean>();
                while(rs_Answers.next()){
                	AnswerBean answer = new AnswerBean();
                	answer.setAnswerID(rs_Answers.getInt("answerID"));
                	answer.setTargetRankNo(rs_Answers.getInt("targetRankNo"));
                	answer.setResponderID(rs_Answers.getInt("responderID"));
                	answer.setAnswer((rs_Answers.getByte("answer") == (byte)0x01));
                	answerList.add(answer);
                }
                ranking.setAnswerList(answerList);
                
                rankArr.add(ranking);
                
                
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
		return rankArr;
	}
	
	private int getAnswerList(int targetRankingNo){
		
		int howManyAnswers = -1;
		
		
		return howManyAnswers;
		
	}
}

package com.ranking.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ranking.dbconn.DBConn;
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
}

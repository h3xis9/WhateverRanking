package com.ranking.dao;

public class DAOFactory {
	
	private static RankingDAO rankingDAO = null;
	private static UserDAO userDAO = null;
	
	
	public static UserDAO getUserDAO(){
		if(userDAO == null){
			userDAO = new UserDAO();
		}
		return userDAO;
	}
	
	public static RankingDAO getRankingDAO(){
		if(rankingDAO == null){
			rankingDAO = new RankingDAO();
		}
		return rankingDAO;
	}

}

package com.ranking.dao;

public class DAOFactory {
	
	protected DAOFactory(){
		
	}
	
	public static UserDAO getUserDAO(){
		UserDAO ud = new UserDAO();
		return ud;
	}
	
	public static RankingDAO getRankingDAO(){
		RankingDAO rd = new RankingDAO();
		return rd;
	}
	

}

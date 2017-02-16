package com.ranking.dao;

public class DAOFactory {
	private static DAOFactory instance = null;
	
	protected DAOFactory(){
		
	}
	
	public static DAOFactory getInstance(){
		if(instance == null){
			instance = new DAOFactory();
		}
		return instance;
	}
	
	public UserDAO getUserDAO(){
		UserDAO ud = new UserDAO();
		return ud;
	}
	
	public RankingDAO getRankingDAO(){
		RankingDAO rd = new RankingDAO();
		return rd;
	}

}

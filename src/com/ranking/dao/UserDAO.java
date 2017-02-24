package com.ranking.dao;

import java.util.List;
import java.util.ArrayList;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import java.sql.SQLException;

import com.ranking.dbconn.DBConn;
import com.ranking.model.UserBean;

public class UserDAO {
	
	private Connection conn; 
	
	public UserDAO(){
		conn = DBConn.getConnection();
	}
	
	
	public UserBean getUserById(String email) {
		UserBean user = new UserBean();
        try {
            PreparedStatement preparedStatement = conn.
                    prepareStatement("select * from userT where email=?");
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setNickname(rs.getString("nickname"));
                user.setAge(rs.getInt("age"));
                user.setGender(rs.getInt("gender"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
	
	public boolean loginCheck(UserBean user){
		boolean loginCheck = false;
		
		try {
			
			PreparedStatement preparedStatement = conn
                    .prepareStatement("select count(*) from userT where email=? and pw=?");
            preparedStatement.setString(1, user.getEmail());
            preparedStatement.setString(2, user.getPw());
            
            ResultSet rs = preparedStatement.executeQuery();
            rs.next();
            
            int cnt = rs.getInt("count(*)");
            if(cnt == 1) loginCheck = true;
            
            return loginCheck;
			//loginCheck = (rs.getInt("count(*)") == 1)? true : false;
			
		}catch (Exception e) {
			e.printStackTrace();
			return loginCheck;
		}
		
	}
	
	public boolean addUser(){
		
		return true;
	}
	public boolean deleteUser(){
		
		return true;
	}
	public boolean updateUser(){
		
		return true;
	}
	public List<UserBean> getAllUsers(){
		List<UserBean> users = new ArrayList<UserBean>();
        try {
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery("select * from users");
            while (rs.next()) {
                UserBean user = new UserBean();
                //user.setUserid(rs.getInt("userid"));
                //user.setFirstName(rs.getString("firstname"));
                //user.setLastName(rs.getString("lastname"));
                //user.setDob(rs.getDate("dob"));
                user.setEmail(rs.getString("email"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
	}
	
}

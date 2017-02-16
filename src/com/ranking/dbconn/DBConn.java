package com.ranking.dbconn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class DBConn {
	
	String url;
	
	Connection conn;
	Statement st;
	ResultSet rs;
	
	String errMsg;
	
	public DBConn(){
		this.url="jdbc:mysql:///wr?useSSL=false&user=root&useUnicode=true&characterEncoding=utf8";
		
		this.conn = null;
		this.st = null;
		this.rs = null;
		this.errMsg = null;
	}
	
	public boolean dbReady(){
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url);
			st = conn.createStatement();
			return true;
			
		}catch(Exception e){
			
			errMsg += e.getMessage();
			return false;
			
		}finally{
			
			try{
				
				if(conn != null) conn.close();
				if(st != null) st.close();
				
			}catch(SQLException se){
				se.getMessage();
			}
		}
	}
	
	//ログイン処理
	public boolean login(String inp_id, String inp_pw){
		
		boolean loginCheck = false;
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url);
			st = conn.createStatement();
			rs = st.executeQuery("select count(*) from userT where email='" + inp_id
					+ "' and pw='" + inp_pw + "';");
			rs.next();
			
			loginCheck = rs.getInt("count(*)")==1 ? true : false;

			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try{
				if(conn != null) conn.close();
				if(st != null) st.close();
			}catch(SQLException se){
				se.getMessage();
			}
		}
		
		if(loginCheck){
			//ログイン成功
			return loginCheck;
		}else{
			//ログイン失敗
			return loginCheck;
		}
	}
	
	
	//DBからデータを読み込む
	public boolean dbQuery(HttpServletRequest r, HttpSession session, String inp_id, String inp_pw){
		
		return true;
	}
	
	//DBのデータの更新を行う
	public boolean dbUpdate(HttpServletRequest r, HttpSession session, String inp_id, String inp_pw){
		
		return true;
	}
	
	//DBのデータの追加を行う
	public boolean dbInsert(HttpServletRequest r, HttpSession session, String inp_id, String inp_pw){
		return true;
	}
	
	//DB上の削除処理
	public boolean dbDelete(HttpServletRequest r, HttpSession session, String inp_id, String inp_pw){
		return true;
	}
	
}

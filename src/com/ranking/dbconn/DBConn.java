package com.ranking.dbconn;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


public class DBConn {
	
    private static Connection conn = null;
	
	private DBConn(){

	}
	
	public static Connection getConnection(){
		if (conn != null){
            return conn;
		}else {
            try {
                Properties prop = new Properties();
                InputStream inputStream = DBConn.class.getClassLoader().getResourceAsStream("/db.properties");
                prop.load(inputStream);
                String driver = prop.getProperty("driver");
                String url = prop.getProperty("url");
                String user = prop.getProperty("user");
                String password = prop.getProperty("password");
                
                Class.forName(driver);
                
                conn = DriverManager.getConnection(url, user, password);
                
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return conn;
        }
	}
	
	public static boolean checkConnection(){
		
		try {
			if(conn != null){
				return conn.isValid(5);
			}else{
				Properties prop = new Properties();
                InputStream inputStream = DBConn.class.getClassLoader().getResourceAsStream("/db.properties");
                prop.load(inputStream);
                String driver = prop.getProperty("driver");
                String url = prop.getProperty("url");
                String user = prop.getProperty("user");
                String password = prop.getProperty("password");
                
                Class.forName(driver);
                
                conn = DriverManager.getConnection(url, user, password);
				return true;
			}
		} catch (SQLException|IOException|ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/*
	public boolean dbReady(){
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection test = DriverManager.getConnection(url);
			st = test.createStatement();
			return true;
			
		}catch(Exception e){
			
			errMsg += e.getMessage();
			return false;
			
		}finally{
			
			try{
				if(st != null) st.close();
				
			}catch(SQLException se){
				se.getMessage();
			}
		}
	}
	*/
	
	
	
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

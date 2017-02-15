package com.ranking.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ranking.dbconn.DBConnector;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	/*
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//XXX
		resp.getWriter().append("Served at: ").append(req.getContextPath())
		.append((String)req.getParameter("reg"))
		.append((String)req.getParameter("inp_id"))
		.append((String)req.getParameter("inp_pw"));
	}
	*/
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		DBConnector dbconn = new DBConnector();
		
		String fwrd = new String();
		
		HttpSession session = request.getSession();
		
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		
		String msg = "";
		String err = "";
		
		
		if(!msg.isEmpty()){
			//TODO 既にログインされてる場合の処理、sessionを利用
			
			
		}else if(request.getParameter("reg") != null){	//TODO 「ログインされてない状態」を条件に追加
			
			//登録ページに移動
			fwrd="register.jsp";
			
		}else if(request.getParameter("inp_id") != null
				&& request.getParameter("inp_pw") != null){
			
			//TODO 上の条件にDBにアクセスし、認証処理の部分を追加する
			//TODO case1) 成功的にログイン
			//TODO case2) IDがない場合の処理
			//TODO case3) IDあり、PWが間違いない場合の処理
			
			String inp_id = request.getParameter("inp_id");
			String inp_pw = request.getParameter("inp_pw");
			
			boolean loginCheck = dbconn.login(request, session, inp_id, inp_pw);
			
			if( loginCheck == true ){
				
				//ログイン成功
				session.setAttribute("LOGINUSERID", inp_id);
				request.setAttribute("inp_id", inp_id);
				request.setAttribute("inp_pw", inp_pw);
				fwrd = "myPage.jsp";
				
			}else{
				
				//ログイン失敗
				//ログインページに戻し、エラーメッセージを表示
				request.setAttribute("err", "ユーザIDもしくは、パスワードに間違いがあります！");
				fwrd = "index.jsp";
			};
			
			/*
			String url="jdbc:mysql:///wr?user=root&useUnicode=true&characterEncoding=utf8";
			
			try{
				
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(url);
				st = conn.createStatement();
				rs = st.executeQuery("select count(*) from info_memberT where email='" + inp_id
						+ "' and pw='" + inp_pw + "';");
				
				rs.next();
				
				int intLoginCnt = rs.getInt("count(*)");
				
				if(intLoginCnt == 1){
					
					//ログイン成功
					session.setAttribute("LOGINUSERID", inp_id);
					request.setAttribute("inp_id", inp_id);
					request.setAttribute("inp_pw", inp_pw);
					fwrd = "myPage.jsp";
					
				}else{
					
					//ログイン失敗
					//ログインページに戻し、エラーメッセージを表示
					request.setAttribute("err", "ユーザIDもしくは、パスワードに間違いがあります！");
					fwrd = "index.jsp";
				}
				
			}catch(SQLException se){
				request.setAttribute("err", se.getMessage());
			}catch(Exception e){
				request.setAttribute("err", e.getMessage());
			}
			*/
			
			//TODO セッションを利用し、ログイン状態にする
			//request.setAttribute("inp_id", request.getParameter("inp_id"));
			//request.setAttribute("inp_pw", request.getParameter("inp_pw"));
			
		}else{
			
			//TODO ログインエラー処理
			//TODO case1) IDまたはPWが入力されてない場合、エラーメッセージは一緒に元のページに移動させ、表示する
			
			String inp_id = (String) request.getParameter("inp_id");
			String inp_pw = (String) request.getParameter("inp_pw");
			
			request.setAttribute("inp_id", inp_id);
			request.setAttribute("inp_pw", inp_pw);
			fwrd="err.jsp";
		}
		
		RequestDispatcher disp = request.getRequestDispatcher(fwrd);
		disp.forward(request, response);
		
		
		
		
	}

}

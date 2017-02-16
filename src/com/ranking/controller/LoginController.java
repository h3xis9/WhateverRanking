package com.ranking.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ranking.dao.DAOFactory;
import com.ranking.model.UserBean;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
				
		String fwrd = new String();
		
		HttpSession session = request.getSession();
		
		String user_id = (String) session.getAttribute("USERID");		
		
		if(user_id != null && !user_id.isEmpty()){
			fwrd = "myPage.jsp";
			
		}else if(request.getParameter("reg") != null){	//TODO 「ログインされてない状態」を条件に追加
			
			//登録ページに移動
			fwrd="register.jsp";
			
		}else if(request.getParameter("inp_id") != null
				&& request.getParameter("inp_pw") != null){
			
			//TODO 上の条件にDBにアクセスし、認証処理の部分を追加する
			//TODO case1) 成功的にログイン
			//TODO case2) IDがない場合の処理
			//TODO case3) IDあり、PWが間違いない場合の処理
			
			String inp_id = (String)request.getParameter("inp_id");
			String inp_pw = (String)request.getParameter("inp_pw");
			
			boolean loginCheck = DAOFactory.getUserDAO().loginCheck(new UserBean(inp_id,inp_pw));
			
			
			if( loginCheck == true ){
				
				//ログイン成功
				session.setAttribute("USERID", inp_id);
				fwrd = "myPage.jsp";
				
			}else{
				
				//ログイン失敗
				//ログインページに戻し、エラーメッセージを表示
				request.setAttribute("err", "IDもしくは、パスワードに間違いがあります！");
				fwrd = "index.jsp";
			}
			
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

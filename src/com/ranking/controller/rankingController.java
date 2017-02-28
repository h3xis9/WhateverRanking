package com.ranking.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ranking.dao.DAOFactory;
import com.ranking.model.RankingBean;


@WebServlet("/rankingController")
public class rankingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String userID = (String)session.getAttribute("USERID");
		ArrayList<RankingBean> rankList = (ArrayList<RankingBean>) (DAOFactory.getRankingDAO().getRankingByIdWithAnswers(userID));
		
		
		if(rankList != null){
			session.setAttribute("rankList", rankList);
		}
		
		
		RequestDispatcher disp = request.getRequestDispatcher("myPage.jsp");
		disp.forward(request, response);
		
	}

}

package com.oneday.review;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

/**
 * Servlet implementation class userReviewSearchServlet
 */
@WebServlet("/userReviewSearch")
public class userReviewSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Gson gson = new Gson();
		HttpSession session = request.getSession();
				
		String sess_email = session.getAttribute("SESS_EMAIL").toString();
		
		String searchText = request.getParameter("searchTxt");
		System.out.println("post");
		ReviewDAO dao = new ReviewDAO();
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
		ReviewVO rvo = new ReviewVO();
		
		
		
		System.out.println(searchText);
		rvo.setrContent(searchText);
		rvo.setmEmail(sess_email);
		
		list = dao.myReviewSearch(rvo);
		
		
		request.setAttribute("KEY_LIST", list);
		
		request.getRequestDispatcher("user/userReviewSearch.jsp").forward(request, response);
	}

}

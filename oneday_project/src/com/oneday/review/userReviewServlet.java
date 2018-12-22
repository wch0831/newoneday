package com.oneday.review;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

/**
 * Servlet implementation class userReviewServlet
 */
@WebServlet("/userReview")
public class userReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String sess_id = session.getAttribute("SESS_ID").toString();
		
		Gson gson = new Gson();
		HttpSession session = request.getSession();
				
		String sess_email = session.getAttribute("SESS_EMAIL").toString();
		ReviewVO rvo = new ReviewVO();
		ReviewDAO dao = new ReviewDAO();
		
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
		
		System.out.println(sess_email+"세션값");
		System.out.println("get in");
		
	    rvo.setmEmail(sess_email);
		 
	
		list=dao.my_reviewList(rvo);
		
		request.setAttribute("KEY_LIST", list);
		
		request.getRequestDispatcher("user/userReview.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Gson gson = new Gson();
		HttpSession session = request.getSession();
				
		String sess_email = session.getAttribute("SESS_EMAIL").toString();
		
		  String jsonStr = request.getReader().lines().collect(Collectors.joining());   //전달된  Json데이터
	      System.out.println(jsonStr);
	      ReviewVO rvo = gson.fromJson(jsonStr, ReviewVO.class);
		  ReviewDAO dao = new ReviewDAO();
		  System.out.println(rvo.getrSeq());
	      
	      System.out.println("post");
	      ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
	      int res = dao.admin_reviewDel(rvo);
	      rvo.setmEmail(sess_email);
	      list = dao.my_reviewList(rvo);
	     
	        String gsonStr = gson.toJson(list);
	         System.out.println(gsonStr);
	         
	         response.setContentType("application/json; charset=UTF-8"); //응답 데이터 타입:JSON
	         PrintWriter out = response.getWriter();
	         out.println(gsonStr);
	}

}

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
		
		ReviewVO rvo = new ReviewVO();
		ReviewDAO dao = new ReviewDAO();
		
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
		
		System.out.println("get in");
		
	    rvo.setmSeq(1);
		
		rvo = dao.my_reviewList(rvo);
		
		System.out.println(rvo.getmSeq());
		request.setAttribute("KEY_RVO", rvo);
		
		request.getRequestDispatcher("user/userReview.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Gson gson = new Gson();
		  String jsonStr = request.getReader().lines().collect(Collectors.joining());   //전달된  Json데이터
	      System.out.println(jsonStr);
	      ReviewVO rvo = gson.fromJson(jsonStr, ReviewVO.class);
		  ReviewDAO dao = new ReviewDAO();
	      ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
	      
	      System.out.println("post");
	      int res = dao.admin_reviewDel(rvo);
	      
	      rvo = dao.my_reviewList(rvo);
	        String gsonStr = gson.toJson(rvo);
	         System.out.println(gsonStr);
	         
	         response.setContentType("application/json; charset=UTF-8"); //응답 데이터 타입:JSON
	         PrintWriter out = response.getWriter();
	         out.println(gsonStr);
	}

}

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
 * Servlet implementation class reviewServlet
 */
@WebServlet("/reviewServlet")
public class reviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("getㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ");
		ReviewDAO dao = new ReviewDAO();
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
		ReviewVO rvo = new ReviewVO();
		
		list = dao.mainReviewList(rvo);
		
		
		request.setAttribute("KEY_LIST", list);
		
		request.getRequestDispatcher("path-detail.jsp").forward(request, response);
//		response.sendRedirect("admin/table-basic.jsp");
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
	     
		
		
		//String session_id = request.getSession().getAttribute("SESS_ID").toString();

		int res = dao.mainReviewInsert(rvo);
		System.out.println(res + " 건 댓글 입력");
		
		ArrayList<ReviewVO> rlist = dao.mainReviewList(rvo);
		System.out.println(rlist.size() + " 개의 댓글 select");
		
		String gsonStr = gson.toJson(rlist);
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(gsonStr);
	}

}

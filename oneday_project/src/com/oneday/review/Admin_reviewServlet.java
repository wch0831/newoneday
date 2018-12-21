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
import com.oneday.faq.FaqDAO;
import com.oneday.faq.FaqVO;



@WebServlet("/ad_review")
public class Admin_reviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("get");
		ReviewDAO dao = new ReviewDAO();
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
		ReviewVO rvo = new ReviewVO();
		
		list = dao.admin_reviewList();
		
		
		request.setAttribute("KEY_LIST", list);
		
		request.getRequestDispatcher("admin/admin_ReviewList.jsp").forward(request, response);
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
	      ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
	      
	      System.out.println("post");
	      int res = dao.admin_reviewDel(rvo);
	      
	      list = dao.admin_reviewList();
	        String gsonStr = gson.toJson(list);
	         System.out.println(gsonStr);
	         
	         response.setContentType("application/json; charset=UTF-8"); //응답 데이터 타입:JSON
	         PrintWriter out = response.getWriter();
	         out.println(gsonStr);
		
		
	}

}

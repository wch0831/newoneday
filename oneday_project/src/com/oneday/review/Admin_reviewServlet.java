package com.oneday.review;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/ad_review")
public class Admin_reviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("assafds");
		ReviewDAO dao = new ReviewDAO();
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
		ReviewVO rvo = new ReviewVO();
		
		list = dao.admin_reviewList();
		
		
		request.setAttribute("KEY_LIST", list);
		
		request.getRequestDispatcher("admin/table-basic.jsp").forward(request, response);
//		response.sendRedirect("admin/table-basic.jsp");
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
		
		
		
	}

}

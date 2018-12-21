package com.oneday.review;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserReviewSearchServlet
 */
@WebServlet("/admin_search")
public class UserReviewSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searchText = request.getParameter("searchTxt");
		System.out.println("post");
		ReviewDAO dao = new ReviewDAO();
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
		ReviewVO rvo = new ReviewVO();
		
		System.out.println(searchText);
		
		
		
		list = dao.adminReviewSearchList(searchText);
		
		
		request.setAttribute("KEY_LIST", list);
		
		request.getRequestDispatcher("admin/admin_ReviewSearchList.jsp").forward(request, response);
		
	}

}

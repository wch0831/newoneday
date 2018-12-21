package com.oneday.place;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oneday.review.ReviewDAO;
import com.oneday.review.ReviewVO;


@WebServlet("/adplace")
public class AdminPlaceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("adminplaceservlet 들어옴");
		AdminPlaceDAO dao = new AdminPlaceDAO();
		ArrayList<PlaceVO> list = new ArrayList<PlaceVO>();
		list = dao.selectPlace();
		
		request.setAttribute("KEY_LIST", list);
		
		request.getRequestDispatcher("/admin/place-list.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}

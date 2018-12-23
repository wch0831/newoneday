package com.oneday.place;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/PlaceMain")
public class PlaceMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("mainservlet 이 들어왔는데?>");
		PlaceMainDAO dao = new PlaceMainDAO();
		ArrayList<PlaceVO> mainList = new ArrayList<PlaceVO>();
		mainList = dao.mainSelect();
		
		request.setAttribute("MAIN_SELECT", mainList);
		request.getRequestDispatcher("/placelist.jsp").forward(request, response);
		
		
	}

	
	

}

package com.oneday.place;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;


@WebServlet("/PlaceMain")
public class PlaceMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		PlaceMainDAO dao = new PlaceMainDAO();
		ArrayList<PlaceVO> mainList = dao.mainSelect();
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(mainList);

		System.out.println(jsonStr);
		
//		response.setContentType("application/json; encoding=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(jsonStr);
		
		
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		String purpose = request.getParameter("purpose");
		PlaceMainDAO dao = new PlaceMainDAO();
		ArrayList<PlaceVO> mainList = dao.mainpurpose(purpose);
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(mainList);

		System.out.println(jsonStr);
		
//		response.setContentType("application/json; encoding=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(jsonStr);
		
	}
	
	
	

}

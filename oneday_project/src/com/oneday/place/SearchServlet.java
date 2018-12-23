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


@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("you are in search");
		String str = request.getParameter("gum");
		System.out.println(str);
		
		AdminPlaceDAO dao = new AdminPlaceDAO();
		
		ArrayList<PlaceVO> plist = dao.selectSearch(str); 
		
		Gson gson = new Gson();
		String gsonStr = gson.toJson(plist);							//String변환
		System.out.println(gsonStr);
		
		response.setContentType("application/json; charset=UTF-8"); //응답 데이터 타입:JSON
		PrintWriter out = response.getWriter();
		out.println(gsonStr);
	}

}

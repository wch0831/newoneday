package com.oneday.path;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class PopPathServlet
 */
@WebServlet("/pop")
public class PopPathServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get in");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		System.out.println("servlet in");
		ArrayList<OnePathVO> list = new ArrayList<OnePathVO>();
		OnePathDAO dao = new OnePathDAO();
		Gson gson = new Gson();
		PrintWriter out  = response.getWriter();
		String jsonstr = null;
		String mykey = request.getParameter("mykey");
		System.out.println(mykey);
		if(mykey.equals("theme")) {
			list = dao.popThemeSelect();
			jsonstr = gson.toJson(list);
			System.out.println(jsonstr);			
		}else {
			list = dao.popAreaSelect();
			jsonstr = gson.toJson(list);
			System.out.println(jsonstr);
		}
		out.println(jsonstr);
	}

}

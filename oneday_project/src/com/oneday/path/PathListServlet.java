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
 * Servlet implementation class PathListServlet
 */
@WebServlet("/pathlist")
public class PathListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		System.out.println("servlet iiiiiiiiiiiiiin");
		ArrayList<OnePathVO> list = new ArrayList<>();
		OnePathDAO dao = new OnePathDAO();
		list = dao.pathListSelect();
		request.setAttribute("KEY_LIST", list);
		request.getRequestDispatcher("/pathlist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("cococo");
		response.setContentType("application/json;");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		OnePathVO ovo = new OnePathVO();
		OnePathDAO dao = new OnePathDAO();
		Gson gson = new Gson();
		System.out.println(request.getParameter("area"));
		ovo.setoTheme(request.getParameter("theme"));
		ovo.setoArea(request.getParameter("area"));
		ovo.setoTitle(request.getParameter("title"));
		System.out.println(ovo.getoTheme());
		ArrayList<OnePathVO> list = dao.pathSelect(ovo);
		String restr = gson.toJson(list);
		PrintWriter out = response.getWriter();
		out.println(restr);
		
	}

}

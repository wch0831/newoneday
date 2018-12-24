package com.oneday.path;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OnePathDetailServlet
 */
@WebServlet("/pathdetail")
public class OnePathDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		System.out.println("servlet iiiiiiiiiiiiiin");
		OnePathVO ovo = new OnePathVO();
		OnePathDAO dao = new OnePathDAO();
		ovo.setoSeq(Integer.parseInt(request.getParameter("oseq")));
		System.out.println(ovo.getoSeq());
		ovo = dao.pathDetailSelect(ovo);
		request.setAttribute("KEY_VO", ovo);
		request.getRequestDispatcher("/path-detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json;");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		System.out.println("servlet iiiiiiiiiiiiiin");
		OnePathVO ovo = new OnePathVO();
		OnePathDAO dao = new OnePathDAO();
		ovo.setoSeq(Integer.parseInt(request.getParameter("oseq")));
		System.out.println(ovo.getoSeq());
		ovo = dao.pathDetailSelect(ovo);
		request.setAttribute("KEY_VO", ovo);
		request.getRequestDispatcher("/blog-detail.jsp").forward(request, response);
	}

}

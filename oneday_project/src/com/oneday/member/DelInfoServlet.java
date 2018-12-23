package com.oneday.member;

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DelInfoServlet
 */
@WebServlet("/delInfoServlet")
public class DelInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int seq = (int)session.getAttribute("SESS_SEQ");

		
		MemberDAO dao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		
		int res = 0;
		res = dao.memberDel(seq);

		
		PrintWriter out = response.getWriter();
		out.println(res);
		
		request.getRequestDispatcher("./index.jsp").forward(request, response);
		
		
	}

}

package com.oneday.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memail = request.getParameter("m_email");
		String mname = request.getParameter("m_name");
		String mpw = request.getParameter("m_pw");
		String mnick = request.getParameter("m_nick");
		String mResnum = request.getParameter("m_resnum");
		
		MemberDAO dao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		
		mvo.setmEmail(memail);
		mvo.setmName(mname);
		mvo.setmNick(mnick);
		mvo.setmPw(mpw);
		mvo.setmResnum(mResnum);
		
		int res = 0;
		res = dao.memberRegister(mvo);
		
		System.out.println(res);
		request.getRequestDispatcher("/login.jsp").forward(request, response);
		
		
			
	}

}

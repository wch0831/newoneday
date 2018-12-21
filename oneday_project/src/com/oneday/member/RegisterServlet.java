package com.oneday.member;

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
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}*/


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memail = request.getParameter("mEmail");
		String mname = request.getParameter("mName");
		String mpw = request.getParameter("mPw");
		String mnick = request.getParameter("mNick");
		String mResnum = request.getParameter("mResnum");
		
		System.out.println(memail+""+mname);
		
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
		
		request.getRequestDispatcher("/user/login.jsp").forward(request, response);
		
		
			
	}

}

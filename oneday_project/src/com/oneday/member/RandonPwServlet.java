package com.oneday.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RandonPwServlet
 */
@WebServlet("/RandonPwServlet")
public class RandonPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String mail = request.getParameter("mEmail");
		String nick = request.getParameter("mNick");
		
		//랜덤패스워드 생성
		
	
		
		MemberDAO dao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		
		mvo.setmEmail(mail);
		mvo.setmNick(nick);
		mvo.setmPw(랜덤으로 생성된 패스워드);
		
		mvo = dao.randomPassword(mvo);
		
		

		
		
	
	}

}

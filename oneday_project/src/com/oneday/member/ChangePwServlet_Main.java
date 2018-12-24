package com.oneday.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChangePwServlet
 */
@WebServlet("/changePwServlet")
public class ChangePwServlet_Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//비밀번호 분실 찾는 서블릿//
		String mail = request.getParameter("mEmail");
		String npw = request.getParameter("newPw");
		
		System.out.println(mail+npw+"---------");
		
		MemberDAO dao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		
		mvo.setmEmail(mail);
		mvo.setmPw(npw);
		
		int res = 0;
		res = dao.changePw(mvo);
		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			out.println("<script> alert('비밀번호가 변경되었습니다. 다시 로그인 해 주세요.'); location.href='/user/login.jsp';</script>");
			
		} else {
			out.println("<script> alert('다시 시도해 주세요.'); location.href='/pwChange.jsp';</script>");
		}
	
		
	}

}

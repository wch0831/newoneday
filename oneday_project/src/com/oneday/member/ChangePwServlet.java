package com.oneday.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ChangePwServlet
 */
@WebServlet("/changePwServlet")
public class ChangePwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		int seq = (int)session.getAttribute("SESS_SEQ");
		String mail = request.getParameter("mEmail");
		String npw = request.getParameter("newPw");
		
		
		System.out.println(mail+npw+"---------");
		System.out.println(npw+"=============");
		
		MemberDAO dao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		
		mvo.setmEmail(mail);
		mvo.setmPw(npw);
		mvo.setmSeq(seq);
		
		//MYPAGE변경 --
		int res2 = 0;
		res2 = dao.changePw2(mvo);
		
		//분실변경 --
		int res = 0;
		res = dao.changePw(mvo);
		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//MYPAGE에서 변경-----------------
		if(res2 > 0) {
			out.println("<script> alert('비밀번호가 변경되었습니다.'); location.href='/user/index.jsp';</script>");
		} else {
			out.println("<script> alert('입력된 비밀번호가 일치하지 않습니다. 다시 시도해 주세요.'); location.href='/user/pwChange_Mypage.jsp';</script>");
		}
		
		//비밀번호 분실 후 변경-------------
		if(res > 0) {
			out.println("<script> alert('비밀번호가 변경되었습니다. 다시 로그인 해 주세요.'); location.href='/user/login.jsp';</script>");
			
		} else {
			out.println("<script> alert('입력된 비밀번호가 일치하지 않습니다. 다시 시도해 주세요.'); location.href='/pwChange_Main.jsp';</script>");
		}

	}

}

package com.oneday.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/updatePwServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int seq = (int)session.getAttribute("SESS_SEQ");
		String nick = request.getParameter("NICK");
		String pw = request.getParameter("mPw");
		
		System.out.println("1번:"+seq+pw+nick);
		
		MemberDAO dao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		
		mvo.setmSeq(seq);
		mvo.setmPw(pw);
		mvo.setmNick(nick);
		
		
		String checkPw = dao.pwCheck(mvo.getmSeq());
		
		System.out.println(checkPw+"---------------");
	
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(!pw.equals(checkPw)) {
			out.println("<script> alert('비밀번호가 일치하지 않습니다.'); location.href='/user/myInfo.jsp';</script>");
		} else {	
			int res = 0;
			res = dao.updateMyinfo(mvo);
			
			out.println("<script> alert('정보수정이 완료되었습니다.'); location.href='/user/index.jsp';</script>");	
		}
	}

}

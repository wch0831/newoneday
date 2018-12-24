package com.oneday.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oneday.member.MemberDAO;
import com.oneday.member.MemberVO;


@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("logout");
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("login.jsp");	
		
	}*/

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("22222");
		HttpSession session =request.getSession();
		session.removeAttribute("SESS_EMAIL");
		session.removeAttribute("SESS_GUBUN");
		session.removeAttribute("SESS_NICK");
		
		
		
		System.out.println("로그인");
		String memail = request.getParameter("mEmail");
		String mpw = request.getParameter("mPw");
		System.out.println(memail+mpw);
		
		String mGubun = "";
		MemberDAO dao = new MemberDAO(); 
		MemberVO mvo = new MemberVO();
		
		mvo.setmEmail(memail);
		mvo.setmPw(mpw);
		
		System.out.println(mvo.getmEmail());
		
		//여기까지찍힘 //
		
		mvo=dao.loginselect(mvo);
		
		//System.out.println(mvo.getmEmail());
		
		if(mvo.getmGubun() == null){
			response.sendRedirect("error404.jsp");
			
		}else {
			session.setAttribute("SESS_EMAIL", mvo.getmEmail());
			session.setAttribute("SESS_GUBUN", mvo.getmGubun());
			session.setAttribute("SESS_NICK", mvo.getmNick());
			session.setAttribute("SESS_SEQ", mvo.getmSeq());
			
			//회원 탈퇴 
			// update member set m_del='y', m_deldate=sysdate where m_seq= ? and m_del='n';
			
			if(mvo.getmGubun().equals("u")){
				response.sendRedirect("/index.jsp");
//				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			else{	
				if(mvo.getmGubun().equals("a")){
					response.sendRedirect("/admin/index.jsp");
//					request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
				}
			}
		}
	}

}

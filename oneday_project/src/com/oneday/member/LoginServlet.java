package com.oneday.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 		String memail = request.getParameter("mEmail");
		 		String mpw = request.getParameter("mPw");
	      
	           MemberVO mvo = new MemberVO();
	           MemberDAO dao = new MemberDAO();
	        		  
	            
	            mvo.setmEmail(memail);
	            mvo.setmPw(mpw);
	            
	            mvo = dao.loginselect(mvo);
//	            System.out.println(mvo.getUserSeq());
//	            System.out.println(mvo.getUserId());
//	            System.out.println(mvo.getUserPw());
//	            System.out.println(mvo.getUserName());
//	            System.out.println(mvo.getRegdate());
//	            System.out.println(mvo.getUserEmail());
//	            System.out.println(mvo.getUserDel());
//	            System.out.println(mvo.getUserGubun());
	            
	            if(mvo.getmGubun() == null || mvo.getmGubun().equals("")){
	               response.sendRedirect("pages-error-404.jsp");
	            }else {
	               
	               HttpSession session = request.getSession();
	               session.setAttribute("SESS_SEQ", mvo.getmSeq());
	               session.setAttribute("SESS_NICK", mvo.getmNick());

	               
	               Cookie cname = new Cookie("COOKIE_MAIL", mvo.getmEmail());
	               
	               cname.setDomain("shj.com");
	               cname.setMaxAge(60*30);
	         
	               response.addCookie(cname); //쿠키 내려주기
	               
	               
	               
	               if(mvo.getmGubun().equals("u")) {
	                  //response.sendRedirect("index.jsp");                  
	                  request.getRequestDispatcher("/index.jsp").forward(request, response);
	               }else if(mvo.getmGubun().equals("a")) {
	                  //response.sendRedirect("admin/admin_main.jsp");
	                  request.getRequestDispatcher("/index.jsp").forward(request, response);
	               }
	            }
		
		
		
	}

}

package com.oneday.faq;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;


/**
 * Servlet implementation class FaqQuestionServlet
 */
@WebServlet("/qus")
public class FaqQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("문의하이염");
			
		
		HttpSession session = request.getSession();
		
		/*		if(session.getAttribute("SESS_ID") == null) {
		response.sendRedirect("/user/login.jsp");
		} else {*/
		
			String sess_id = "wch@naver.com"; //session.getAttribute("SESS_ID").toString();
									  		  //request.getSession().getAttribute("SESS_ID").toString();
			
			session.setAttribute("SESS_ID", sess_id); //test용
						
			response.setContentType("application/json; charset=UTF-8");
		}
	

}

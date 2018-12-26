package com.oneday.faq;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Admin_FaqAnswerAddServlet
 */
@WebServlet("/answeradd")
public class Admin_FaqAnswerAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 답변 추가 */
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		FaqVO fvo = new FaqVO();
		FaqDAO dao = new FaqDAO();
		
		String message = request.getParameter("message");
		
		fvo.setaContent(message);
	
		int res = dao.adminAnswerAdd(fvo);
		
		if(res > 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('답변 추가 완료'); opener.parent.location.href = 'admin/pages-answer.jsp'; self.close();</script>");	 

			out.flush();
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('답변 추가 실패'); self.close();</script>");	 
			out.flush();
		}
	}

}

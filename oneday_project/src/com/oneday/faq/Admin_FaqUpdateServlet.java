package com.oneday.faq;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class Admin_FaqUpdateServlet
 */
@WebServlet("/adminfaqupdate")
public class Admin_FaqUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 관리자 문의 답변 삭제 */
		FaqDAO dao = new FaqDAO();
		Gson gson = new Gson();
		
		String strJson = request.getParameter("MYKEY");
		
		FaqVO fvo = gson.fromJson(strJson, FaqVO.class);
		
		int res = dao.adminQuestionUpdate(fvo);
		
		if(res > 0) {
			//성공
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('답변 삭제실패');</script>");	 
			out.flush();
		}
	}

}

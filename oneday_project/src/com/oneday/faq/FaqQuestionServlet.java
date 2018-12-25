package com.oneday.faq;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

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
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 용도 */
		HttpSession session = request.getSession();
		FaqDAO dao = new FaqDAO();
		ArrayList<FaqVO> list = new ArrayList<FaqVO>();


		if(session.getAttribute("SESS_EMAIL") == null) {
			response.sendRedirect("/user/login.jsp");
		} else {

		String sess_id = session.getAttribute("SESS_EMAIL").toString();

		list = dao.myInfoSelect(sess_id);

		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out  = response.getWriter();
		out.println(jsonStr);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		FaqVO fvo = new FaqVO();
		FaqDAO dao = new FaqDAO();
		
		String service = request.getParameter("service");
		String title = request.getParameter("title");
		String email = request.getParameter("email");
		String message = request.getParameter("message");
		String secret = request.getParameter("cc"); //on or null
		
		int qmseq = dao.myInfoSelect2(email);
		
		fvo.setQmSeq(qmseq);
		fvo.setqGubun(service);
		fvo.setqTitle(title);
		fvo.setqContent(message);
		if(secret == null) {
			fvo.setqSecret("n");
		}
		else if(secret.equals("on")) {
			fvo.setqSecret("y");
		}
		
		int res = dao.questionInsert(fvo);
		
		if(res > 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('문의글 작성완료'); self.close();</script>");	 
			out.flush();
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('문의글 작성실패'); self.close();</script>");	 
			out.flush();
		}
		
	}
	

}

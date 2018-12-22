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
 * Servlet implementation class FaqServlet
 */
@WebServlet("/faq")
public class FaqServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get하이염");
		
		HttpSession session = request.getSession();
		
		//세션 값 체크
/*		if(session.getAttribute("SESS_ID") == null) {
			response.sendRedirect("/user/login.jsp");
		} else {*/
			
		String sess_id = "wch@naver.com"; //session.getAttribute("SESS_ID").toString();
										  //request.getSession().getAttribute("SESS_ID").toString();
			
	  	FaqDAO dao = new FaqDAO();
    	ArrayList<FaqVO> list = new ArrayList<FaqVO>();
    	
    	list = dao.myQuestionSelect(sess_id);
    	
		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);
		System.out.println(jsonStr);
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out  = response.getWriter();
		out.println(jsonStr);
		
		//}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post하이염");
	  	FaqDAO dao = new FaqDAO();
    	ArrayList<FaqVO> list = new ArrayList<FaqVO>();
    	
    	list = dao.questionSelect();
    	
		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);
		System.out.println(jsonStr);
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out  = response.getWriter();
		out.println(jsonStr);

	}

}

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
 * Servlet implementation class FaqSearchServlet
 */
@WebServlet("/faqsearch")
public class FaqSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		//세션 값 체크
/*		if(session.getAttribute("SESS_ID") == null) {
			response.sendRedirect("/user/login.jsp");
		} else {*/
			
		String sess_id = "kimtaku@naver.com"; //session.getAttribute("SESS_ID").toString();
										  //request.getSession().getAttribute("SESS_ID").toString();
		
		String searchText = request.getParameter("searchText");	//전달된  String데이터
		
		ArrayList<FaqVO> list = new ArrayList<FaqVO>();
		FaqDAO dao = new FaqDAO();
		FaqVO fvo = new FaqVO();
		
		fvo.setmEmail(sess_id);
		fvo.setSearchCheck(searchText);
		list = dao.searchMyQuestionSelect(fvo);
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);							//String변환
		System.out.println(jsonStr);
		
		response.setContentType("application/json; encoding=UTF-8"); //응답 데이터 타입:JSON
		PrintWriter out = response.getWriter();
		out.println(jsonStr);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String searchText = request.getParameter("searchText");	//전달된  String데이터
		ArrayList<FaqVO> list = new ArrayList<FaqVO>();
		FaqDAO dao = new FaqDAO();
		FaqVO fvo = new FaqVO();
		
		fvo.setSearchCheck(searchText);
		list = dao.searchQuestionSelect(fvo);
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);							//String변환
		System.out.println(jsonStr);
		
		response.setContentType("application/json; encoding=UTF-8"); //응답 데이터 타입:JSON
		PrintWriter out = response.getWriter();
		out.println(jsonStr);
	}

}

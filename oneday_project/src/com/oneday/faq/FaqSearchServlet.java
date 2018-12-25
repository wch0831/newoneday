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
		/* 내 문의 검색 */
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String sess_id = session.getAttribute("SESS_EMAIL").toString();
	
		String searchText = request.getParameter("searchText");
		
		ArrayList<FaqVO> list = new ArrayList<FaqVO>();
		FaqDAO dao = new FaqDAO();
		FaqVO fvo = new FaqVO();
		
		fvo.setmEmail(sess_id);
		fvo.setSearchCheck(searchText);
		list = dao.searchMyQuestionSelect(fvo);
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);							
		
		response.setContentType("application/json; encoding=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(jsonStr);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 전체 문의 검색 */
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String searchText = request.getParameter("searchText");
		ArrayList<FaqVO> list = new ArrayList<FaqVO>();
		FaqDAO dao = new FaqDAO();
		FaqVO fvo = new FaqVO();
		
		fvo.setSearchCheck(searchText);
		list = dao.searchQuestionSelect(fvo);
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);						
		
		response.setContentType("application/json; encoding=UTF-8"); 
		PrintWriter out = response.getWriter();
		out.println(jsonStr);
	}

}

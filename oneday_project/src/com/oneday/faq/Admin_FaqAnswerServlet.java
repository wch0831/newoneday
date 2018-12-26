package com.oneday.faq;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class Admin_FaqAnswerServlet
 */
@WebServlet("/adminfaqanswerlist")
public class Admin_FaqAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 관리자 답변 목록 조회 */
	  	FaqDAO dao = new FaqDAO();
    	ArrayList<FaqVO> list = new ArrayList<FaqVO>();
    	
    	list = dao.adminAnswerSelect();
    	
		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out  = response.getWriter();
		out.println(jsonStr);
	}

}

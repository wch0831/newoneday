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
		/* 전체 문의 출력 */
		FaqDAO dao = new FaqDAO();
		ArrayList<FaqVO> list = new ArrayList<FaqVO>();

		list = dao.questionSelect();

		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);

		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out  = response.getWriter();
		out.println(jsonStr);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		/* 내 문의 출력 */
		HttpSession session = request.getSession();

		//세션 값 체크
		if(session.getAttribute("SESS_EMAIL") == null) {
			System.out.println("안녕");
			//response.sendRedirect("user/login.jsp");
			request.getRequestDispatcher("user/login.jsp").forward(request, response);
		} else {
			String sess_id = session.getAttribute("SESS_EMAIL").toString();
			System.out.println("하이");
			FaqDAO dao = new FaqDAO();
			ArrayList<FaqVO> list = new ArrayList<FaqVO>();

			list = dao.myQuestionSelect(sess_id);

			Gson gson = new Gson();
			String jsonStr = gson.toJson(list);

			response.setContentType("application/json; charset=UTF-8");
			PrintWriter out  = response.getWriter();
			out.println(jsonStr);

		}

	}

}

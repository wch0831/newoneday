package com.oneday.review;

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
 * Servlet implementation class reviewServlet
 */
@WebServlet("/reviewServlet")
public class reviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String reply = request.getParameter("reply");
		String oseqStr = request.getParameter("oseq");
		int oseq = Integer.parseInt(oseqStr);
		
		String sess_email = session.getAttribute("SESS_EMAIL").toString();
		//String session_id = request.getSession().getAttribute("SESS_ID").toString();
		
		
		
		ReviewVO rvo = new ReviewVO();
		rvo.setrContent(reply);
		rvo.setoSeq(oseq);
		rvo.setmEmail(sess_email);
		ReviewDAO dao = new ReviewDAO();
		int res = dao.mainReviewInsert(rvo);
		
		ArrayList<ReviewVO> rlist = new ArrayList<ReviewVO>();
		rlist = dao.mainReviewSelect(rvo);
		Gson gson = new Gson();
		String gsonStr = gson.toJson(rlist);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.println(gsonStr);
	}

}

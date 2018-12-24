package com.oneday.review;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

/**
 * Servlet implementation class reviewDelServlet
 */
@WebServlet("/reviewDel")
public class reviewDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reviewDelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		// TODO Auto-generated method stub
		Gson gson = new Gson();
		HttpSession session = request.getSession();
				
	/*	String sess_email = session.getAttribute("SESS_EMAIL").toString();*/
		
		  String jsonStr = request.getReader().lines().collect(Collectors.joining());   //전달된  Json데이터
	      System.out.println(jsonStr);
	      ReviewVO rvo = gson.fromJson(jsonStr, ReviewVO.class);
	      
		  ReviewDAO dao = new ReviewDAO();
	      ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
	      
	      System.out.println("리뷰 삭제 get");
	      int res = dao.mainReviewDel(rvo);
	      System.out.println(res+""+"건삭제");	      
	      /*rvo.setmEmail(sess_email);*/
	      list = dao.mainReviewList(rvo);
	      System.out.println(list.size()+""+"건 셀렉트");
	        String gsonStr = gson.toJson(list);
	         System.out.println(gsonStr);
	         
	         response.setContentType("application/json; charset=UTF-8"); //응답 데이터 타입:JSON
	         PrintWriter out = response.getWriter();
	         out.println(gsonStr);
	}

}

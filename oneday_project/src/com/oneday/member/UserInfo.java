package com.oneday.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oneday.review.ReviewDAO;
import com.oneday.review.ReviewVO;


@WebServlet("/userInfo")
public class UserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		list = dao.userSelect();
		
		Gson gson = new Gson();
		
		response.setContentType("application/json; encoding=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String plist = gson.toJson(list);
		
		out.println(plist);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  Gson gson = new Gson();
		  String jsonStr = request.getReader().lines().collect(Collectors.joining());   //전달된  Json데이터
	      System.out.println(jsonStr);
	      
	      MemberVO mvo = gson.fromJson(jsonStr, MemberVO.class);
		  MemberDAO dao = new MemberDAO();
	      ArrayList<MemberVO> list = new ArrayList<MemberVO>();
	      
	      System.out.println("post");
	      int res = dao.memberDelate(mvo);
	      System.out.println(res+",건수정");
	      
	      list = dao.userSelect();
	      String gsonStr = gson.toJson(list);
	      System.out.println(gsonStr);
	         
	      response.setContentType("application/json; charset=UTF-8"); //응답 데이터 타입:JSON
	      PrintWriter out = response.getWriter();
	      out.println(gsonStr);
		
	}

}

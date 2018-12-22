package com.oneday.member;

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
 * Servlet implementation class CheckServlet
 */
@WebServlet("/CheckServlet")
public class CheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
/*	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
		
	}*/

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int res = 0;
		System.out.println("2222222");
		String memail = request.getParameter("MAIL");
		String mpw = request.getParameter("MPW");
		System.out.println(memail+mpw);
		
		MemberDAO dao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();

		mvo.setmPw(mpw);
		mvo.setmEmail(memail);
        Gson gson = new Gson();
		list = dao.loginCheck();
		
		for(MemberVO vo : list) {
		    if(vo.getmEmail().equals(memail) && vo.getmPw().equals(mpw)) {
		    	res += 1;
		    }
		}
		
	
		/*response.setContentType("application/json; encoding=UTF-8");
		response.setCharacterEncoding("UTF-8");*/
		
		PrintWriter out = response.getWriter();
		out.println(res);

	}

}

package com.oneday.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/singinCheckServlet")
public class SigninCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}*/


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("EMAIL");
		System.out.println(email);
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		System.out.println(list.get(0));
		list = dao.checkEmail();
		
		int res = 0;
		for(MemberVO mvo : list) {
			if(mvo.getmEmail().equals(email)) {
				res += 1;
			} 
		} 
		System.out.println(res);

//		for(int i=0;i<list.size();i++) {
//			MemberVO mvo = list.get(i);
//				res += 1;
//			}
//		}
		
		
		Gson gson = new Gson();
		
		//response.setContentType("application/json; encoding=UTF-8");
		//response.setCharacterEncoding("UTF-8");
		//String checkMail = gson.toJson(res);
		
		PrintWriter out = response.getWriter();
		out.println(res);
		
	
	}

}

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

@WebServlet("/mailCheckServlet")
public class MailCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("EMAIL");
		System.out.println(email);

		MemberDAO dao = new MemberDAO();
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		list = dao.checkEmail();
		System.out.println(list.get(0).getmEmail());
		
		int res = 0;
		for(MemberVO mvo : list) {
			System.out.println(mvo.getmEmail());
			if(mvo.getmEmail().equals(email)) {
				res += 1;
				System.out.println(res);
			} 
		} 

//		for(int i=0;i<list.size();i++) {
//			MemberVO mvo = list.get(i);
//				res += 1;
//			}
//		}
		

		//response.setContentType("application/json; encoding=UTF-8");
		//response.setCharacterEncoding("UTF-8");
		//String checkMail = gson.toJson(res);
		
		PrintWriter out = response.getWriter();
		out.println(res);
	}


	/*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	}*/

}

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


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//아이디
		int res = 0;

		System.out.println("333333");
		String memail = request.getParameter("MAIL");

		System.out.println(memail+"메일확인");

		MemberDAO dao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();

		mvo.setmEmail(memail);


		list = dao.loginCheck();
		System.out.println(list.size()+",아이디갯수");

		PrintWriter out = response.getWriter();

		//아이디비교
		
		for(MemberVO vo : list) {
			if(!vo.getmEmail().equals(memail)) {
				res = 1;
				System.out.println(res+",아이디");
			} else {
				res = 0;
				out.println(res);
				System.out.println(res+",아이디");
			}
		}
		out.println(res);
								
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//패스워드
		try {
			int respw = 0;


			System.out.println("2222222");
			String memail = request.getParameter("MAIL");
			String mpw = request.getParameter("MPW");

			System.out.println(memail+","+mpw);

			MemberDAO dao = new MemberDAO();
			MemberVO mvo = new MemberVO();

			mvo.setmPw(mpw);
			mvo.setmEmail(memail);

			Gson gson = new Gson();        

			//비밀번호비교
			String pw = "";
			pw = dao.pwChack(mvo.getmEmail());

			System.out.println(pw+",패스워드검사//////");


			PrintWriter out = response.getWriter();

			//비밀번호 비교
			if(!pw.equals(mpw) || pw.equals("0")) {
				respw += 1;
				System.out.println(pw+","+mpw+",비밀번호");
			}
			out.println(respw);
		} catch(NullPointerException e) {
			e.printStackTrace();
		}
	}
}

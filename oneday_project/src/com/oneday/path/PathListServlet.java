package com.oneday.path;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oneday.member.MemberDAO;
import com.oneday.member.MemberVO;

/**
 * Servlet implementation class PathListServlet
 */
@WebServlet("/pathlist")
public class PathListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		ArrayList<OnePathVO> list = new ArrayList<>();
		ArrayList<MemberVO> mlist = new ArrayList<>();
		MemberVO mvo = new MemberVO();
		OnePathDAO dao = new OnePathDAO();
		MemberDAO mdao = new MemberDAO();
		list = dao.pathListSelect();
		for(int i=0;i<list.size();i++) {
			mvo = mdao.selectNick(list.get(i).getmSeq());
			mlist.add(mvo);
		}
		request.setAttribute("KEY_LIST", list);
		request.setAttribute("KEY_MLIST", mlist);
		request.getRequestDispatcher("/pathlist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("cococo");
		response.setContentType("application/json;");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		OnePathVO ovo = new OnePathVO();
		OnePathDAO dao = new OnePathDAO();
		Gson gson = new Gson();
		ovo.setoTheme(request.getParameter("theme"));
		ovo.setoArea(request.getParameter("area"));
		ovo.setoTitle(request.getParameter("title"));
		ArrayList<OnePathVO> list = dao.pathSelect(ovo);
		String restr = gson.toJson(list);
		System.out.println(restr);
		PrintWriter out = response.getWriter();
		out.println(restr);
	}

}

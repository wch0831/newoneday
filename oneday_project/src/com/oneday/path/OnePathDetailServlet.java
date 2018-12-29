package com.oneday.path;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oneday.place.PlaceDAO;
import com.oneday.place.PlaceVO;
import com.oneday.review.ReviewDAO;
import com.oneday.review.ReviewVO;

/**
 * Servlet implementation class OnePathDetailServlet
 */
@WebServlet("/pathdetail")
public class OnePathDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		ReviewDAO rdao = new ReviewDAO();
		ArrayList<ReviewVO> rlist = new ArrayList<ReviewVO>();
		ReviewVO rvo = new ReviewVO();		
		rvo.setoSeq(Integer.parseInt(request.getParameter("oseq")));
		rlist = rdao.mainReviewList(rvo);

		
		OnePathVO ovo = new OnePathVO();
		OnePathDAO dao = new OnePathDAO();
		ovo.setoSeq(Integer.parseInt(request.getParameter("oseq")));
		ovo = dao.pathDetailSelect(ovo);
		ovo.setoSee(ovo.getoSee()+1);
		dao.seeAdd(ovo);
		
		PlaceDAO pdao = new PlaceDAO();
		ArrayList<PlaceVO> plist = pdao.selectlonlat(ovo.getoSeq());
		System.out.println(plist.get(0).getpLat());
		
		request.setAttribute("KEY_VO", ovo);
		request.setAttribute("KEY_LIST", rlist);
		request.setAttribute("KEY_PLIST", plist);
		request.getRequestDispatcher("/path-detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

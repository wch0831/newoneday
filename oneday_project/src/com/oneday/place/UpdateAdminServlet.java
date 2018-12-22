package com.oneday.place;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;


@WebServlet("/UpdateAdmin")
public class UpdateAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pseq = Integer.parseInt(request.getParameter("pSeq"));
		System.out.println(pseq);
		
		AdminPlaceDAO dao = new AdminPlaceDAO();
		PlaceVO pvo = dao.adminSelectUpdate(pseq);
		//dao 만들기
		//pseq를 가지고 dao update를 실행
		//PlaceVO pvo = dao.adminUpdate(pseq);

		request.setAttribute("PVO", pvo);
		request.getRequestDispatcher("/admin/updateadmin.jsp").forward(request, response);
		
		
	}	

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pseq = Integer.parseInt(request.getParameter("pSeq"));
		
		System.out.println("관리자수정에서 셀렉트한걸 다시 인설트할래");
		String saveDirectory = "C:/uploads/place";  
		int maxPostSize = 1024 * 1024 * 10; //10M
		String encoding = "UTF-8";
		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		AdminPlaceDAO dao = new AdminPlaceDAO();	

		MultipartRequest mrequest = new MultipartRequest(request,saveDirectory,maxPostSize,encoding,policy);
		
		String p_title = mrequest.getParameter("p_title");
		String p_purpose = mrequest.getParameter("p_purpose");
		String p_content = mrequest.getParameter("p_content");
		String p_lat = mrequest.getParameter("p_lat");
		String p_lng = mrequest.getParameter("p_lng");
		String p_area = mrequest.getParameter("p_area");
		int p_cost = Integer.parseInt(mrequest.getParameter("p_cost")); // String을 int 로바꿈
		String p_inout = mrequest.getParameter("p_inout");
		String oldPname = mrequest.getParameter("originPic");
		String oldSysname = mrequest.getParameter("pSysname");
		
		System.out.println(p_title+":::");
		
		
		
	
		//getParameter 값을 placeVO 에 담아야한다.
		
		PlaceVO pvo = new PlaceVO();
		//update할떄는 seq번호가 필요하다 수정할 번호가 필요하기때문
		pvo.setpSeq(pseq);
		pvo.setpTitle(p_title);
		pvo.setpPurpose(p_purpose);
		pvo.setpContent(p_content);
		pvo.setpLat(p_lat);
		pvo.setpLng(p_lng);
		pvo.setpArea(p_area);
		pvo.setpCost(p_cost);
		pvo.setpInout(p_inout);
		pvo.setpPpath(saveDirectory);
		
		
		
		
		//-----------------------------------------------		
		// * shop_pic : cos.jar 를 이용한 단일 파일 업로드 처리 
		//-----------------------------------------------
		String origPname = mrequest.getOriginalFileName("pname");
		if(origPname == null) {
			pvo.setpPname(oldPname);
		} else {
			pvo.setpPname(origPname);	
		}
				
		//중복 시 리네임된 파일명
		String sysPname = mrequest.getFilesystemName("pname");
		if(sysPname == null) {
			pvo.setpSysname(oldSysname);
		} else {
			pvo.setpSysname(sysPname);	
		}
		//파일크기
		//long attachFileSize = pfile.length();		
		
		//contentType
		//String attachFileContentType = mrequest.getContentType("pname");
		
		//파일 확장자 처리
		String attachFileExt = "jpg";
		if(pvo.getpPname().lastIndexOf(".") != -1) {
			attachFileExt = pvo.getpPname().substring(pvo.getpPname().lastIndexOf(".")+1);
		}
		if(!attachFileExt.toUpperCase().equals("JPG") &&
				!attachFileExt.toUpperCase().equals("JPEG") &&
				!attachFileExt.toUpperCase().equals("PNG") &&
				!attachFileExt.toUpperCase().equals("GIF")
		) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미지 첨부만 가능')</script>");
			//response.sendRedirect("shop_form.jsp");
		}
		
		int res = dao.adminUpdate(pvo);
		System.out.println(res+"건 수정");
		
		if(res > 0) {
			response.sendRedirect("/adplace");
			System.out.println("수정완료");
		} else {
			response.sendRedirect("404.jsp");
			System.out.println("실패");
		}

	}

}

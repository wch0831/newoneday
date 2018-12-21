package com.oneday.place;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/AddAdmin")
public class AddAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("33333333333333333333333333");
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
		String p_regdate = mrequest.getParameter("p_regdate");
		
		System.out.println(p_title);
		System.out.println(p_content);
		System.out.println(p_cost);
		
		
		
	
		//getParameter 값을 placeVO 에 담아야한다.
		
		PlaceVO pvo = new PlaceVO();
		
		pvo.setpTitle(p_title);
		pvo.setpPurpose(p_purpose);
		pvo.setpContent(p_content);
		pvo.setpLat(p_lat);
		pvo.setpLng(p_lng);
		pvo.setpArea(p_area);
		pvo.setpCost(p_cost);
		pvo.setpInout(p_inout);
		pvo.setpRegdate(p_regdate);
		pvo.setpPpath(saveDirectory);
		

		//-----------------------------------------------		
		// * shop_pic : cos.jar 를 이용한 단일 파일 업로드 처리 
		//-----------------------------------------------
		String origPname = mrequest.getOriginalFileName("pname");
		pvo.setpPname(origPname);	
				
		//중복 시 리네임된 파일명
		String sysPname = mrequest.getFilesystemName("pname");
		pvo.setpSysname(sysPname);
		
		//파일크기
		//long attachFileSize = pfile.length();		
		
		//contentType
		//String attachFileContentType = mrequest.getContentType("pname");
		
		//파일 확장자 처리
		String attachFileExt = "jpg";
		if(origPname.lastIndexOf(".") != -1) {
			attachFileExt = origPname.substring(origPname.lastIndexOf(".")+1);
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
		
		int res = dao.adminInsert(pvo);
		
		
		if(res > 0) {
			response.sendRedirect("/adplace");
			System.out.println("담기성공");
		} else {
			response.sendRedirect("404.jsp");
			System.out.println("실패");
		}

		
		//response.sendRedirect("login.jsp");

		
		
	}

}

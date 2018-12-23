package com.oneday.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RandonPwServlet
 */
@WebServlet("/randonPwServlet")
public class RandonPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String mail = request.getParameter("mEmail");
		String resnum = request.getParameter("mResnum");
		
		System.out.println("메일:"+mail+",주민번호:"+resnum+"일단 들어와지나 보고요");
		
		//pw 랜덤설정----------------------------
        //0~9까지 생성 *10
        int rnum1 = (int)(Math.random() *10);
        int rnum2 = (int)(Math.random() *10);
        int rnum3 = (int)(Math.random() *10);
        int rnum4 = (int)(Math.random() *10);
        
        String newPw = "!@"+rnum1+rnum2+rnum3+rnum4; //!@뒤에 랜덤 번호 4자리 붙음 
        System.out.println(newPw+"나오니?");
		
		String subject = "[Dangilchigi.com] 임시비밀번호 발급안내";
	
		
		MemberDAO dao = new MemberDAO();
		MemberVO mvo = new MemberVO();
		
		mvo.setmEmail(mail);
		mvo.setmResnum(resnum);
		mvo.setmPw(newPw);
		
		System.out.println(mvo.getmEmail());
		System.out.println(mvo.getmResnum());
		System.out.println(mvo.getmPw());
		
		int res = 0;
		res = dao.randomPassword(mvo);
		
		if(res > 0) {
			
			StringBuffer buffer = new StringBuffer();
			buffer.append("<html>");
			buffer.append("<head>");
			buffer.append("<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>");
			buffer.append("<title> 임시 비밀번호 발급안내 </title>");
			buffer.append("</head>");
			buffer.append("<body>");
			buffer.append("<table width='200'>");
			buffer.append("<tr><td><img src='http://www.ikosmo.co.kr/userfile/main_list/1523413562121866.jpg'></td></tr>");         
			buffer.append("<tr><td> 아래의 URL을 통하여 비밀번호를 변경하여 주시기 바랍니다. </td></tr>");
			buffer.append("<tr><td> ///////////////// </td></tr>");
			buffer.append("</table>");
			buffer.append("</body>");
			buffer.append("</html>");
			
			SendMail g = new SendMail(); //sendMail에 있는 정보들을 가지고 와서
			g.SendMail(mail, subject, buffer.toString()); //메일 보내기
				response.sendRedirect("/user/index.jsp");
				
			} else {
				response.sendRedirect("/index.jsp");
			}
	
	}

}

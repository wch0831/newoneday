package com.oneday.member;


import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

//------------------------------------------------------------------------
//https://www.google.com/settings/security/lesssecureapp
//https://support.google.com/accounts/answer/6009563
//https://accounts.google.com/DisplayUnlockCaptcha
//534-5.7.14
//------------------------------------------------------------------------


import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendMail
{
	public final String HOST = "smtp.naver.com";
	public final String HOST_ID = "xxxxxx"; //보내는사람 메일주소
	public final String HOST_PW = "xxxxxx"; //보내는 사람 메일 패스워드
	public final String HOST_PORT = "587";
	public final String HOST_AUTH = "true";
	public final String HOST_STARTTLS = "true";

//   public static void main(String [] args)
//   { 
//	   SendMailTest g = new SendMailTest();
//	   g.SendMail();
//   }
   						 //받는사람           //메일제목	    //메일내용
   public void SendMail(String to, String subject, String body) {
	   
      // Sender's email ID needs to be mentioned
     // String from = "coms.korea@gmail.com";
    //  String pass ="dd";
      // Recipient's email ID needs to be mentioned.
      //String to = "pontea1123@google.com"; //받는사람 e-mail


      // Get system properties
      Properties properties = System.getProperties();
      // Setup mail server
      properties.put("mail.smtp.starttls.enable", HOST_STARTTLS);
      properties.put("mail.smtp.host", HOST);
      properties.put("mail.smtp.user", HOST_ID);
      properties.put("mail.smtp.password", HOST_PW);
      properties.put("mail.smtp.port", HOST_PORT);
      properties.put("mail.smtp.auth", HOST_AUTH);

      // Get the default Session object.
      Session session = Session.getDefaultInstance(properties);

      try{
         // Create a default MimeMessage object.
         MimeMessage message = new MimeMessage(session);

         // Set From: header field of the header.
         message.setFrom(new InternetAddress(HOST_ID));

         // Set To: header field of the header.
         message.addRecipient(Message.RecipientType.TO,
               new InternetAddress(to));

         // Set Subject: header field
         message.setSubject(subject); //제목
         
         

         String htmlStr = "<font color='blue'> 비밀번호가 변경되었습니다. </font>"; //내용
         message.setContent(htmlStr, "text/html"); //html 형식으로 보내기
         //message.setText(htmlStr); //일반 문장으로 보내기
         
         // Send message
         Transport transport = session.getTransport("smtp");
         transport.connect(HOST, HOST_ID, HOST_PW);
         transport.sendMessage(message, message.getAllRecipients());
         transport.close();
         System.out.println("Sent message successfully....");
      }catch (MessagingException mex) {
         mex.printStackTrace();
      }
   }
}


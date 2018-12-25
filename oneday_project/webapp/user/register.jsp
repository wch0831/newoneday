<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>

<html lang="en">
  <head>
    
      <%@ include file="./include/header.jsp" %>
   
      
    <script> 
	$(document).ready(function(){
		var check = 0;
		var checke = 0;
		
	//이메일 중복확인 -----------------------------------------//
     
     $("#mailCheck").click(function(){
    	 check = 0;
		 var email = $("#mEmail").val();
    	 $.ajax({
			url:"/mailCheckServlet",
			tpye:"GET",
			data: "EMAIL="+email,
			success:function(res){		
					if(res == 0){
						alert("사용가능한 이메일주소 입니다.");
						check = 1;
						return false;
					} else {
						alert("중복된 이메일이 존재합니다. 다시 시도해 주세요.");
						return false;
					}
			}
		});
		   
	   });
		
	
	//닉네임 중복확인 -----------------------------------------------//
	
    $("#nickCheck").click(function(){
    	checke = 0;
		 var nick = $("#mNick").val();
    	 $.ajax({
			url:"/nickCheckServlet",
			tpye:"GET",
			data: "NICK="+nick,
			success:function(res){		
					if(res == 0){
						alert("사용가능한 닉네임 입니다.")
						checke = 1;
						return false;
					} else {
						alert("중복된 닉네임이 존재합니다. 다시 시도해 주세요.");
						return false;
					}
			}
		});
		   
	   });
	
    

   
	//회원가입-----------------------------------------------//
   
   $("#signButton").click(function(){
	   var memail = $('#mEmail').val();
	   var mname = $('#mName').val();
	   var mpw = $('#mPw').val();
	   var mpw2 = $('#mPw2').val();
	   var mnick = $('#mNick').val();
	   var mresnum = $('#mResnum').val();
	   if(memail == ""){
      		alert("이메일을 입력해 주세요");
      		return false;
   		} else if (mname == ""){
   			alert("이름을 입력해 주세요.");
      		return false;
   		} else if (mpw == ""){
   			alert("패스워드를 입력해 주세요.");
      		return false;
   		} else if (mpw2 == ""){
   			alert("패스워드를 입력해 주세요.");
      		return false;
   		} else if (mnick == ""){
   			alert("닉네임을 입력해 주세요.");
      		return false;
   		} else if (mresnum == ""){
   			alert("주민등록번호를 입력해 주세요.");
      		return false;
   		} else if (mpw != mpw2){
      		alert("비밀번호가 다릅니다.");
      		$('#Password').focus();
      		return false;
   		} else if (check == 0 ){
   			alert("이메일 중복체크를 해주세요");
   			return false;
   		} else if (checke == 0){
   			alert("닉네임 중복체크를 해주세요");
   			return false;
   		} else {
	   		alert("회원가입성공");
    		$('#regForm').submit();
   		}
   });
	
});
	
   </script>
  </head>
  
  
  
  <body class="app flex-row align-items-center">
 
   
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="card mx-4">
            <div class="card-body p-4">
              <h1>Sign up</h1>
              <p class="text-muted">아래의 정보들을 모두 입력해 주시기 바랍니다.</p>
              <form id="regForm" method="post" action="/registerServlet">
             
              
              <!-- 회원정보 받기 -->
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">　이메일　　</span>
                </div>
                <input class="form-control" type="text" id="mEmail" name="mEmail">&emsp;
                <input type="button" id="mailCheck" value="중복확인">
              </div>
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">　이　름　　</span>
                </div>
                <input class="form-control" type="text" id="mName" name="mName">
              </div>
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">　닉네임　　</span>
                </div>
                <input class="form-control" type="text" id="mNick" name="mNick">&emsp;
                <input type="button" id="nickCheck" value="중복확인">
              </div>
              <div class="input-group mb-4">
                <div class="input-group-prepend">
                  <span class="input-group-text">　비밀번호　</span>
                </div>
                <input class="form-control" type="password" id="mPw" name="mPw">
              </div>
              <div class="input-group mb-4">
                <div class="input-group-prepend">
                  <span class="input-group-text">비밀번호확인</span>
                </div>
                <input class="form-control" type="password" id="mPw2" name="mPw2">
              </div>
              <div class="input-group mb-4">
                <div class="input-group-prepend">
                  <span class="input-group-text">주민등록번호</span>
                </div>
                <input class="form-control" type="text" id="mResnum" name="mResnum" placeholder="뒤 1자리까지표시">
              </div>
              
              
              
              <!-- 회원가입 버튼 -->
              <button class="btn btn-block btn-success" type="button" id="signButton">회원가입</button>
              </form>
            </div>
            
            
            
            <div class="card-footer p-4">
              <div class="row">
                <div class="col-6">
                  <button class="btn btn-block btn-facebook" type="button">
                    <span>facebook</span>
                  </button>
                </div>
                <div class="col-6">
                  <button class="btn btn-block btn-twitter" type="button" id="regButton">
                    <span>twitter</span>
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    

     <%@ include file="./include/script.jsp" %>
     
     
  </body>
</html>

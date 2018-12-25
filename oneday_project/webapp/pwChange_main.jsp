<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- header -->
  	<%@ include file="/include/header.jsp" %> 	
  	
  	<style>
	
   *{padding:0;margin: 0;}
    ul li{list-style: none;}
    .clearfix:after{content: "";display: block;clear: both;}
    h1{text-align: center;padding: 20px 0;}
    .f_question1>ul>li,.f_answer1>ul>li{float: left;}
    .fnq{width: 75%;line-height:300%;margin: 0 auto;}
    .f_question1{position: relative}
    .f_answer1{background: #eee;display: none;}
    .f_answer1.on{display: block;}
    .f_question1>ul>li:nth-child(1){width: 7%;text-align: center;}
    .f_answer1>ul>li:nth-child(1){width: 7%;text-align: center;}
    .f_answer1>ul>li:nth-child(2){width: 93%;}
    .f_answer1>ul>li:nth-child(3){width: 7%;text-align: center;}
    .f_answer1>ul>li:nth-child(4){width: 93%;}
    .f_answer1>ul>li:nth-child(5){width: 32%;text-align: center;}
    .f_question1>ul>li:nth-child(2){width: 20%;text-align: center;}
    .f_question1>ul>li:nth-child(3){width:35%; }
    .f_question1>ul>li:nth-child(4){width:17%;text-align: center;}
    .f_question1>ul>li:nth-child(5){width:15%; 	}
    .f_question1>ul>li:nth-child(6){width:5%; }
    .f_q_link{width: 100%;height: 100%;position:absolute;top: 0;left: 0;}
    
    #bt {position:absolute; right:245px;}
    
    
    
 @import url(https://fonts.googleapis.com/css?family=Raleway:400,500);
button.snip0059 {
  font-family: 'Raleway', Arial, sans-serif;
  border: none;
  background-color: #000000;
  border-radius: 5px;
  color: rgba(255, 255, 255, 0.7);
  cursor: pointer;
  padding: 10px 20px;
  display: inline-block;
  margin: 0px 0px;
  text-transform: uppercase;
  letter-spacing: 1px;
  font-weight: 500;
  font-size: 1em;
  outline: none;
  position: relative;
  overflow: hidden;
}
button.snip0059:before {
  content: '';
  display: block;
  border-radius: 3px;
  position: absolute;
  top: 10px;
  bottom: 10px;
  left: 50%;
  right: 50%;
  background-color: #ffffff;
  border-left: 2px solid rgba(255, 255, 255, 0.8);
  border-right: 2px solid rgba(255, 255, 255, 0.8);
  opacity: 0;
  -webkit-transition: all 0.3s;
  transition: all 0.3s;
  -webkit-transition-delay: 0.3s;
  transition-delay: 0.3s;
}
button.snip0059:hover,
button.snip0059.hover {
  color: #ffffff;
  -webkit-animation: flashText 0.5s;
  animation: flashText 0.5s;
}
button.snip0059:hover:before,
button.snip0059.hover:before {
  left: 12px;
  right: 12px;
  background-color: rgba(255, 255, 255, 0.1);
  opacity: 0.8;
}
button.snip0059:active:before {
  background-color: rgba(255, 255, 255, 0.3);
  opacity: 1;
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}
button.snip0059.blue {
  background-color: #1e5d87;
}
button.snip0059.red {
  background-color: #8e2a20;
}
button.snip0059.yellow {
  background-color: #1e5d87;
}
@-webkit-keyframes flashText {
  0% {
    color: rgba(255, 255, 255, 0.5);
  }
  50% {
    color: transparent;
  }
  100% {
    color: #fff;
  }
}
@keyframes flashText {
  0% {
    color: rgba(255, 255, 255, 0.5);
  }
  50% {
    color: transparent;
  }
  100% {
    color: #fff;
  }
}
  
</style>
    
<title>비밀번호 변경</title>
  	
    <script>
   
    $(document).ready(function(){
    	$('#enter').click(function(){
    		var email = $('#mEmail').val();
    		var oldPw = $('#odlPw').val();
    		var newPw = $('#newPw').val();
    		var nwePw2 = $('#newPw2').val();
    		
    		if(email == ""){ //email이 입력되지 않았거나, db에 없을경우
    			alert("존재하지 않는 이메일 입니다.");
    		} else if(oldPw == ""){ //email과 pw가 일치하지 않는 경우
    			alert("비밀번호를 잘 못 입력하셨습니다.")
    		} else if(newPw == ""){
    			alert("새로운 비밀번호를 입력해 주세요.");
    		} else if(newPw2 == ""){
    			alert("비밀번호 확인란을 입력해 주세요.");
    		} else {
    			$('#regForm').submit;
    		}
    	});
    	
    });
    
    </script>
  </head>
  <body class="animsition">
  
  <!-- Header -->
	<%@ include file="/include/top.jsp" %>

	<%@ include file="/include/left.jsp" %>
	<form id="regForm" name="regForm" method="post" action="/changePwServlet">

	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			비밀번호 찾기
		</h2>
	</section>	

  
  
  
  
  
  <!-- Content page -->
	<section class="bg0 p-t-104 p-b-116">
			
	
	<h1>비밀번호 찾기 </h1>
			
			<div align="center">
			<div style="width:600px;">
				<div align="left">
					<span class="mtext-110 cl2">▷이메일</span>
				</div>
					<p class="stext-115 cl6 size-213 p-t-18">
					<div class="bor8 m-b-20 how-pos4-parent">
					<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30"
							type="text" id="mEmail" name="mEmail" placeholder="Your Email Address">
					</div></p>
			</div>
	
			<div style="width:600px;" >
				<div align="left">
					<span class="mtext-110 cl2">▷기존비밀번호</span>
				</div>
					<p class="stext-115 cl6 size-213 p-t-18">
					<div class="bor8 m-b-20 how-pos4-parent"> 
					<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text"
							id="oldPw" name="oldPw" placeholder="기존비밀번호를 입력해 주세요.">
					</div></p>
			</div>
			
			
			<div style="width:600px;" >
				<div align="left">
					<span class="mtext-110 cl2">▷변경비밀번호</span>
				</div>
					<p class="stext-115 cl6 size-213 p-t-18">
					<div class="bor8 m-b-20 how-pos4-parent"> 
					<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text"
							id="newPw" name="newPw" placeholder="변경 할 비밀번호를 입력해 주세요.">
					</div></p>
			</div>
			
			<div style="width:600px;" >
				<div align="left">
					<span class="mtext-110 cl2">▷비밀번호확인</span>
				</div>
					<p class="stext-115 cl6 size-213 p-t-18">
					<div class="bor8 m-b-20 how-pos4-parent"> 
					<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text"
							id="newPw2" name="newPw2" placeholder="변경 할 비밀번호를 다시 한 번 입력해 주세요.">
					</div></p>
			</div>
			
			
		</div>
	
	<!-- 버튼 -->	
	<div id="bt">
	<button class="snip0059 yellow" id="enter">확인</button>
    </div>
    
    <br><br>
    
    	<!-- 뿌려지는 영역 -->
		<ul class="fnq" id="qlist">
 	
		</ul>
	<hr>



	</section>
	
	</form>
  
		 
		 
	<%@ include file="/include/footer.jsp" %>
		 
		 
   <!-- script -->
	<%@ include file="/include/script.jsp" %>
		
  </body>
</html>

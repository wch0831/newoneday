<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
    *{padding:0;margin: 0;}
    ul li{list-style: none;}
    .clearfix:after{content: "";display: block;clear: both;}
    h1{text-align: center;padding: 20px 0;}
    .f_question1>ul>li,.f_answer1>ul>li{float: left;}
    .fnq{width: 70%;line-height:300%;margin: 0 auto;}
    .f_question1{position: relative}
    .f_answer1{background: #eee;display: none;}
    .f_answer1.on{display: block;}
    .f_question1>ul>li:nth-child(1){width: 7%;text-align: center;}
    .f_answer1>ul>li:nth-child(1){width: 7%;text-align: center;}
    .f_answer1>ul>li:nth-child(2){width: 93%;}
    .f_answer1>ul>li:nth-child(3){width: 7%;text-align: center;}
    .f_answer1>ul>li:nth-child(4){width: 93%;}
    .f_answer1>ul>li:nth-child(5){width: 33%;text-align: center;}
    .f_question1>ul>li:nth-child(2){width: 20%;text-align: center;}
    .f_question1>ul>li:nth-child(3){width:35%; }
    .f_question1>ul>li:nth-child(4){width:17%;text-align: center;}
    .f_question1>ul>li:nth-child(5){width:15%; 	}
    .f_question1>ul>li:nth-child(6){width:5%; }
    .f_q_link{width: 100%;height: 100%;position:absolute;top: 0;left: 0;}
</style>
    
	<title>FAQ</title>
	<%@ include file="/include/header.jsp" %>

<script>
$(document).ready(function(){	
	
	
});


/* <!-- 아코디언 --> */
$(function(){
	  var className =""  //변수를 선언한다.
	     
	   $('.f_q_link').on({    //버튼을
	 
	       click: function(){  //클릭했을때 
	 
	            className=$(this).parent().next().attr('class').slice(-2); 
	            //보여줄 li의 class이름을 뒤에서 두자리(on)를 변수에 담는다.
	 
	           if(className=='on'){  //만약 클래스명이 'on'이면
	 
	               $(this).parent().next().removeClass('on'); //class'on' 삭제
	 
	              $(this).prev().children().eq(3).children()
	              .css({transform:'rotate(0deg)',transition:'all 0.4s',color:'#000'});
	               //화살표 아이콘의 원래 css로 돌리기
	           }
	           else if(className!='on'){  //만약 클래스명이 'on'이 아니면
	 
	               $(this).parent().next().addClass('on');  //class'on' 추가
	 
	              $(this).prev().children().eq(3).children()
	             .css({transform:'rotate(180deg)',transition:'all 0.4s',color:'#7070ea'});  
	              // 화살표 아이콘 css 수정
	           }
	             
	        }
	        
	    });
	     
	});
	
</script>

</head>
<body class="animsition">
	
	<!-- Header -->
	<%@ include file="/include/top.jsp" %>

	<%@ include file="/include/left.jsp" %>


	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			문의하기
		</h2>
	</section>	


	<!-- Content page -->
	<section class="bg0 p-t-104 p-b-116">


				<!-- 작성 폼으로 떼서 쓸 부분 -->
<!--  					<form>
						<h4 class="mtext-105 cl2 txt-center p-b-30">
							Send Us A Message
						</h4>

						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="email" placeholder="Your Email Address">
							<img class="how-pos4 pointer-none" src="images/icons/icon-email.png" alt="ICON">
						</div>

						<div class="bor8 m-b-30">
							<textarea class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" name="msg" placeholder="How Can We Help?"></textarea>
						</div>

						<button class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
							Submit
						</button>
					</form> -->
				
				
	<!-- 뿌려지는 영역 -->
	<h1>Q&A</h1>
		<ul class="fnq">
		<c:forEach var="vo" items="${KEY_LIST}">
			<li class="f_question1">
				<ul class="clearfix">
					<li>${vo.qSeq}</li>
					<li>${vo.qGubun}</li>
					<li>${vo.qTitle}</li>
					<li>${vo.mNick}</li>
					<li>${vo.qRegdate}</li>
					<li><i class="fa fa-angle-double-down"></i></li>
				</ul> <a class="f_q_link"></a>
			</li>
			<li class="f_answer1">
				<ul class="clearfix">
					<li>Q</li>
					<li>${vo.qContent}</li>
					<li><font color="#00FF00">A</font></li>
					<li>${vo.aContent}</li>
					<li><font color="#00FF00">(등록일 : ${vo.aRegdate})</font></li>
				</ul>
			</li>
		</c:forEach> 
		</ul>



	</section>
	



<%@ include file="/include/footer.jsp" %>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

<%@ include file="/include/script.jsp" %>
</body>
</html>
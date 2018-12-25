<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
    
    
    
    #bt {position:absolute; right:200px;}
    
@import url(https://fonts.googleapis.com/css?family=Raleway:400,500);
button.snip0059 {
  font-family: 'Raleway', Arial, sans-serif;
  border: none;
  background-color: #000000;
  border-radius: 5px;
  color: rgba(255, 255, 255, 0.7);
  cursor: pointer;
  padding: 8px 20px;
  display: inline-block;
  margin: 12px 0px;
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
button.snip0059.yellow {
  background-color: #00B4CC;
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
  

@import url(https://fonts.googleapis.com/css?family=Open+Sans);
.search {
  width: 100%;
  position: relative
}

.searchTerm {
  position: absolute;
  bottom: -50px;
  float: left;
  width: 100%;
  border: 3px solid #00B4CC;
  padding: 5px;
  height: 36px;
  border-radius: 5px;
  outline: none;
  color: #9DBFAF;
}

.searchTerm:focus{
  color: #00B4CC;
}

.searchButton {
  position: absolute;  
  right: -50px;
  bottom: -50px;
  width: 40px;
  height: 36px;
  border: 1px solid #00B4CC;
  background: #00B4CC;
  text-align: center;
  color: #fff;
  border-radius: 5px;
  cursor: pointer;
  font-size: 20px;
}

/*Resize the wrap to see the search bar change!*/
.wrap{
  width: 20%;
  position: relative;
  bottom: 75%;
  left: 13%;
  /* transform: translate(-50%, -50%); */
}  
</style>
    
<title>FAQ</title>
	
<script>
$(document).ready(function(){	
	var checkswitch=0;	
	qnalist();
	
	/* 검색 */
	$("#searchButton").click(function name() {	
			var sendData = $("#searchForm").serialize();
			if(checkswitch == 0) {
			  	$.ajax({ 
					url:"/faqsearch",
					type:"post",
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					data:sendData,
					resultType:"json",
					success:function(resObject){
						var listStr = "";
						listStr += "<hr>";
		 				listStr += "<li class='f_question1'>";
		 				listStr += "<ul class='clearfix'>";
		 				listStr += "<li>번호</li>";
		 				listStr += "<li>구분</li>";
		 				listStr += "<li align='center'>제목</li>";
		 				listStr += "<li>닉네임</li>";
		 				listStr += "<li align='center'>등록일</li>";
		 				listStr += "<li><i></i></li>";
		 				listStr += "</ul>";
		 				listStr += "</li>";
		 				listStr += "<hr>";
		 				var sessEmail = '<%=session.getAttribute("SESS_EMAIL") %>';
			 			$.map(resObject, function(vv, idx){		
			 				if(sessEmail != vv.mEmail && vv.qSecret == 'y'){
				 				listStr += "<li class='f_question1' onClick=alertMessage()>";
				 				listStr += "<ul class='clearfix'>";
				 				listStr += "<li>" + vv.qSeq + "</li>";
				 				listStr += "<li>" + vv.qGubun + "</li>";
				 				listStr += "<li>" + vv.qTitle + "&nbsp;&nbsp;<i class='fa fa-lock'></i></li>";
				 				listStr += "<li>" + vv.mNick + "</li>";
				 				listStr += "<li>" + vv.qRegdate + "</li>";
				 				listStr += "<li><i class='fa fa-angle-double-down'></i></li>";
				 				listStr += "</ul><a class='f_q_link'></a>";
				 				listStr += "</li>";
			 				}
			 				else{
			 				listStr += "<li class='f_question1'>";
			 				listStr += "<ul class='clearfix'>";
			 				listStr += "<li>" + vv.qSeq + "</li>";
			 				listStr += "<li>" + vv.qGubun + "</li>";
			 				listStr += "<li>" + vv.qTitle + "</li>";
			 				listStr += "<li>" + vv.mNick + "</li>";
			 				listStr += "<li>" + vv.qRegdate + "</li>";
			 				listStr += "<li><i class='fa fa-angle-double-down'></i></li>";
			 				listStr += "</ul><a class='f_q_link'></a>";
			 				listStr += "</li>";
			 				listStr += "<li class='f_answer1'>";
			 				listStr += "<ul class='clearfix'>";
			 				listStr += "<li>Q</li>";
			 				listStr += "<li>" + vv.qContent + "</li>";
			 				listStr += "<li><font color='#00FF00'>A</font></li>";
			 				listStr += "<li>" + vv.conCheck + "</li>";
			 				listStr += "<li><font color='#00FF00'>(등록일 : " + vv.dateCheck + ")</font></li>";
			 				listStr += "</ul>";
			 				listStr += "</li>";
			 				}
			 			});
			 			$("#qlist").empty();
			 			$("#qlist").html(listStr);
			 			/* <!-- 아코디언 --> */
			 			accordion();
					}
			});
				
			} else if(checkswitch == 1) {
				$.ajax({ 
					url:"/faqsearch",
					type:"get",
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					data:sendData,
					resultType:"json",
					success:function(resObject){
						var listStr = "";
						listStr += "<hr>";
		 				listStr += "<li class='f_question1'>";
		 				listStr += "<ul class='clearfix'>";
		 				listStr += "<li>번호</li>";
		 				listStr += "<li>구분</li>";
		 				listStr += "<li align='center'>제목</li>";
		 				listStr += "<li>닉네임</li>";
		 				listStr += "<li align='center'>등록일</li>";
		 				listStr += "<li><i></i></li>";
		 				listStr += "</ul>";
		 				listStr += "</li>";
		 				listStr += "<hr>";
		 				var sessEmail = '<%=session.getAttribute("SESS_EMAIL") %>';
			 			$.map(resObject, function(vv, idx){		
			 				if(sessEmail != vv.mEmail && vv.qSecret == 'y'){
				 				listStr += "<li class='f_question1' onClick=alertMessage()>";
				 				listStr += "<ul class='clearfix'>";
				 				listStr += "<li>" + vv.qSeq + "</li>";
				 				listStr += "<li>" + vv.qGubun + "</li>";
				 				listStr += "<li>" + vv.qTitle + "&nbsp;&nbsp;<i class='fa fa-lock'></i></li>";
				 				listStr += "<li>" + vv.mNick + "</li>";
				 				listStr += "<li>" + vv.qRegdate + "</li>";
				 				listStr += "<li><i class='fa fa-angle-double-down'></i></li>";
				 				listStr += "</ul><a class='f_q_link'></a>";
				 				listStr += "</li>";
			 				}
			 				else{
			 				listStr += "<li class='f_question1'>";
			 				listStr += "<ul class='clearfix'>";
			 				listStr += "<li>" + vv.qSeq + "</li>";
			 				listStr += "<li>" + vv.qGubun + "</li>";
			 				listStr += "<li>" + vv.qTitle + "</li>";
			 				listStr += "<li>" + vv.mNick + "</li>";
			 				listStr += "<li>" + vv.qRegdate + "</li>";
			 				listStr += "<li><i class='fa fa-angle-double-down'></i></li>";
			 				listStr += "</ul><a class='f_q_link'></a>";
			 				listStr += "</li>";
			 				listStr += "<li class='f_answer1'>";
			 				listStr += "<ul class='clearfix'>";
			 				listStr += "<li>Q</li>";
			 				listStr += "<li>" + vv.qContent + "</li>";
			 				listStr += "<li><font color='#00FF00'>A</font></li>";
			 				listStr += "<li>" + vv.conCheck + "</li>";
			 				listStr += "<li><font color='#00FF00'>(등록일 : " + vv.dateCheck + ")</font></li>";
			 				listStr += "</ul>";
			 				listStr += "</li>";
			 				}
			 			});
			 			$("#qlist").empty();
			 			$("#qlist").html(listStr);
			 			/* <!-- 아코디언 --> */
			 			accordion();
					}
				});
			} else {
				console.log('실패');	
			}
			
			

	});
	
	/* 문의하기 */
	$("#questionButton").click(function name() {	
		var sessCheck = '<%=session.getAttribute("SESS_EMAIL") %>';
		
		if(sessCheck == 'null'){
			needLogin();
		}
		else{
			window.open('/contact/index.jsp','문의하기','width=800,height=700,location=no,status=no');
		}
	});
	
	/* 전체 문의보기 */
	$("#allQuestionButton").click(function name() {
		checkswitch = 0;
		qnalist();		
	});
	
	/* 내 문의보기 */
	$("#myQuestionButton").click(function name() {
		var sessCheck = '<%=session.getAttribute("SESS_EMAIL") %>';
		
		if(sessCheck == 'null'){
			needLogin();
		}
		else{
			checkswitch = 1;
			$.ajax({ 	
				url:"/faq",   
				type:"post",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data: "nothing", 
				resultType:"json",
				success:function(resObject){
						var listStr = "";
						listStr += "<hr>";
		 				listStr += "<li class='f_question1'>";
		 				listStr += "<ul class='clearfix'>";
		 				listStr += "<li>번호</li>";
		 				listStr += "<li>구분</li>";
		 				listStr += "<li align='center'>제목</li>";
		 				listStr += "<li>닉네임</li>";
		 				listStr += "<li align='center'>등록일</li>";
		 				listStr += "<li><i></i></li>";
		 				listStr += "</ul>";
		 				listStr += "</li>";
		 				listStr += "<hr>";
		 		
		 				var sessEmail = '<%=session.getAttribute("SESS_EMAIL") %>';
			 			$.map(resObject, function(vv, idx){		
			 				if(sessEmail != vv.mEmail && vv.qSecret == 'y'){
				 				listStr += "<li class='f_question1' onClick=alertMessage()>";
				 				listStr += "<ul class='clearfix'>";
				 				listStr += "<li>" + vv.qSeq + "</li>";
				 				listStr += "<li>" + vv.qGubun + "</li>";
				 				listStr += "<li>" + vv.qTitle + "&nbsp;&nbsp;<i class='fa fa-lock'></i></li>";
				 				listStr += "<li>" + vv.mNick + "</li>";
				 				listStr += "<li>" + vv.qRegdate + "</li>";
				 				listStr += "<li><i class='fa fa-angle-double-down'></i></li>";
				 				listStr += "</ul><a class='f_q_link'></a>";
				 				listStr += "</li>";
			 				}
			 				else{
			 				listStr += "<li class='f_question1'>";
			 				listStr += "<ul class='clearfix'>";
			 				listStr += "<li>" + vv.qSeq + "</li>";
			 				listStr += "<li>" + vv.qGubun + "</li>";
			 				listStr += "<li>" + vv.qTitle + "</li>";
			 				listStr += "<li>" + vv.mNick + "</li>";
			 				listStr += "<li>" + vv.qRegdate + "</li>";
			 				listStr += "<li><i class='fa fa-angle-double-down'></i></li>";
			 				listStr += "</ul><a class='f_q_link'></a>";
			 				listStr += "</li>";
			 				listStr += "<li class='f_answer1'>";
			 				listStr += "<ul class='clearfix'>";
			 				listStr += "<li>Q</li>";
			 				listStr += "<li>" + vv.qContent + "</li>";
			 				listStr += "<li><font color='#00FF00'>A</font></li>";
			 				listStr += "<li>" + vv.conCheck + "</li>";
			 				listStr += "<li><font color='#00FF00'>(등록일 : " + vv.dateCheck + ")</font></li>";
			 				listStr += "</ul>";
			 				listStr += "</li>";
			 				}
			 			});
			 			$("#qlist").empty();
			 			$("#qlist").html(listStr);
			 			/* <!-- 아코디언 --> */
			 			accordion();
					}
				});
		}
	});

});


function qnalist() {
	$.ajax({ 	
		url:"/faq",   
		type:"get",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		data: "nothing", 
		resultType:"json",
		success:function(resObject){
				var listStr = "";
				listStr += "<hr>";
 				listStr += "<li class='f_question1'>";
 				listStr += "<ul class='clearfix'>";
 				listStr += "<li>번호</li>";
 				listStr += "<li>구분</li>";
 				listStr += "<li align='center'>제목</li>";
 				listStr += "<li>닉네임</li>";
 				listStr += "<li align='center'>등록일</li>";
 				listStr += "<li><i></i></li>";
 				listStr += "</ul>";
 				listStr += "</li>";
 				listStr += "<hr>";
 				var sessEmail = '<%=session.getAttribute("SESS_EMAIL") %>';
	 			$.map(resObject, function(vv, idx){		
	 				if(sessEmail != vv.mEmail && vv.qSecret == 'y'){
		 				listStr += "<li class='f_question1' onClick=alertMessage()>";
		 				listStr += "<ul class='clearfix'>";
		 				listStr += "<li>" + vv.qSeq + "</li>";
		 				listStr += "<li>" + vv.qGubun + "</li>";
		 				listStr += "<li>" + vv.qTitle + "&nbsp;&nbsp;<i class='fa fa-lock'></i></li>";
		 				listStr += "<li>" + vv.mNick + "</li>";
		 				listStr += "<li>" + vv.qRegdate + "</li>";
		 				listStr += "<li><i class='fa fa-angle-double-down'></i></li>";
		 				listStr += "</ul><a class='f_q_link'></a>";
		 				listStr += "</li>";
	 				}
	 				else{
	 				listStr += "<li class='f_question1'>";
	 				listStr += "<ul class='clearfix'>";
	 				listStr += "<li>" + vv.qSeq + "</li>";
	 				listStr += "<li>" + vv.qGubun + "</li>";
	 				listStr += "<li>" + vv.qTitle + "</li>";
	 				listStr += "<li>" + vv.mNick + "</li>";
	 				listStr += "<li>" + vv.qRegdate + "</li>";
	 				listStr += "<li><i class='fa fa-angle-double-down'></i></li>";
	 				listStr += "</ul><a class='f_q_link'></a>";
	 				listStr += "</li>";
	 				listStr += "<li class='f_answer1'>";
	 				listStr += "<ul class='clearfix'>";
	 				listStr += "<li>Q</li>";
	 				listStr += "<li>" + vv.qContent + "</li>";
	 				listStr += "<li><font color='#00FF00'>A</font></li>";
	 				listStr += "<li>" + vv.conCheck + "</li>";
	 				listStr += "<li><font color='#00FF00'>(등록일 : " + vv.dateCheck + ")</font></li>";
	 				listStr += "</ul>";
	 				listStr += "</li>";
	 				}
	 			});
	 			$("#qlist").empty();
	 			$("#qlist").html(listStr);
	 			/* <!-- 아코디언 --> */
	 			accordion();
	 		
			}
		});
	}
	
	
	/* <!-- 아코디언 --> */
	function accordion() {
		var className = "" //변수를 선언한다.

		$('.f_q_link').on({ //버튼을

			click : function() { //클릭했을때 

				className = $(this).parent().next().attr('class').slice(-2);
				//보여줄 li의 class이름을 뒤에서 두자리(on)를 변수에 담는다.

				if (className == 'on') { //만약 클래스명이 'on'이면

					$(this).parent().next().removeClass('on'); //class'on' 삭제

					$(this).prev().children().eq(3).children().css({
						transform : 'rotate(0deg)',
						transition : 'all 0.4s',
						color : '#000'
					});
					//화살표 아이콘의 원래 css로 돌리기
				} else if (className != 'on') { //만약 클래스명이 'on'이 아니면

					$(this).parent().next().addClass('on'); //class'on' 추가

					$(this).prev().children().eq(3).children().css({
						transform : 'rotate(180deg)',
						transition : 'all 0.4s',
						color : '#7070ea'
					});
					// 화살표 아이콘 css 수정
				}

			}

		});
	}
	
	
	function alertMessage() {
		alert('비밀글은 본인만 볼 수 있습니다.');
	}
	
	function needLogin() {
		alert('로그인이 필요합니다.');
		return false;
	}
</script>
</head>

<body class="animsition">


	<!-- Header -->
	<%@ include file="/include/top.jsp"%>

	<%@ include file="/include/left.jsp"%>


	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92"
		style="background-image: url('images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">문의하기</h2>
	</section>


	<!-- Content page -->
	<section class="bg0 p-t-104 p-b-116">

		<h1>Q&A</h1>

		<!-- 검색 -->
		<form id="searchForm">
			<div class="wrap">
				<input type="text" class="searchTerm" placeholder="검색할 제목을 입력하세요" id="searchText" name="searchText">
				<button type="button" class="searchButton" id="searchButton">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</form>

		<!-- 버튼 -->
		<div id="bt">
			<button class="snip0059 yellow" id="questionButton">문의하기</button>
			<button class="snip0059 yellow" id="myQuestionButton">내 문의보기</button>
			<button class="snip0059 yellow" id="allQuestionButton">전체 문의보기</button>
		</div>

		<br>
		<br>

		<!-- 뿌려지는 영역 -->
		<ul class="fnq" id="qlist">

		</ul>
		<hr>



	</section>



	<%@ include file="/include/footer.jsp"%>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<%@ include file="/include/script.jsp"%>
</body>
</html>
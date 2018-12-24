<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- header -->
  	<%@ include file="./include/header.jsp" %>
  	
  	
    <script>
    
    $(document).ready(function(){
    	var checke = 0;
    	
    	$.ajax({
				url:"/MyInfoServlet",
				type:"POST",
				success:function(res){
							console.log(res);
							console.log(res.mEmail);
							$('#mEmail').val(res.mEmail);
							$('#mName').val(res.mName);
							$('#mNick').val(res.mNick);
							$('#mResnum').val(res.mResnum);
				}
			});
    	
    	//닉네임 확인--------------------------
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
    	
    	
    	//업데이트 서블릿 만들고 갔다오는것 해야함. seq랑 pw 받아야함.
     	$("#updateButton").click(function(){
    		var nick = $("#mNick").val();
    		var pw1 = $("#mPw").val();
    		var pw2 = $("#mPw2").val();
			if(pw1 == ""){
				alert("비밀번호를 입력해 주세요.");
				return false;
			} else if(pw2 == ""){
				alert("확인 비밀번호를 입력해 주세요.");
				return false;
			} else if(pw1 != pw2){
				alert("입력된 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
				return false;
			} else {
				$('#regForm').submit();
			}
    	});
    	 
    	
    	//서블릿 -> session에서 seq받아서 삭제하고 돌아와서 alert띄움 
    	$("#delButton").click(function(){
    		alert("탈퇴 할 경우 지금까지 이용한 정보들이 모두 삭제됩니다. 정말 탈퇴하시겠습니까?");
    		
    		$.ajax({
				url:"/delInfoServlet",
				type:"POST",
				success:function(res){
					alert("회원탈퇴가 완료되었습니다. 이용해 주셔서 감사합니다.");
				}
			});
    	});
    });
    
    </script>
  </head>
  <body class="app header-fixed sidebar-fixed aside-menu-fixed sidebar-lg-show">
  
  
    <!-- top -->
  	<%@ include file="./include/top.jsp" %>



	<div class="app-body">

		<!-- left -->
		<%@ include file="./include/left.jsp"%>



		<main class="main"> <!-- Breadcrumb-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item">MYPAGE</li>
			<li class="breadcrumb-item"><a href="#">내 정보</a></li>
		</ol>

		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="card mx-4">
						<div class="card-body p-4">
							<h1>MYPAGE > 내 정보</h1>
							<p class="text-muted">수정 또는 탈퇴가 가능합니다.</p>

							<form id="regForm" name="regForm" method="post"
								action="/updateServlet">


								<!-- 회원정보 받기 -->
								<div class="input-group mb-4">
									<div class="input-group-prepend">
										<span class="input-group-text"> 이메일 </span>
									</div>
									<input class="form-control" type="text" id="mEmail"
										name="mEmail" value="" readonly>&emsp; &emsp;
									<div class="input-group-prepend">
										<span class="input-group-text"> 이 름 </span>
									</div>
									<input class="form-control" type="text" id="mName" name="mName"
										value="" readonly>
								</div>


								<div class="input-group mb-4">
									<div class="input-group-prepend">
										<span class="input-group-text"> 닉네임 </span>
									</div>
									<input class="form-control" type="text" id="mNick" name="NICK"
										value="">&emsp; <input type="button" id="nickCheck"
										value="중복확인">
								</div>


								<div class="input-group mb-4">
									<div class="input-group-prepend">
										<span class="input-group-text"> 비밀번호 </span>
									</div>
									<input class="form-control" type="password" id="mPw" name="mPw">&emsp;
									&emsp;
									<div class="input-group-prepend">
										<span class="input-group-text">비밀번호확인</span>
									</div>
									<input class="form-control" type="password" id="mPw2"
										name="mPw2">
								</div>


								<div class="input-group mb-4">
									<div class="input-group-prepend">
										<span class="input-group-text">주민등록번호</span>
									</div>
									<input class="form-control" type="text" id="mResnum"
										name="mResnum" value="" readonly placeholder="뒤 1자리까지표시">
								</div>



								<!-- 회원가입 버튼 -->
								<div align="right">
									<input class="col-md-1" type="button" id="updateButton" value="수정">&emsp; 
									<input class="col-md-1" type="button" id="delButton" value="탈퇴">
								</div>
							</form>
						</div>




					</div>
				</div>
			</div>
		</div>
		</main>
	</div>


	<!-- footer -->
  	<%@ include file="./include/footer.jsp" %>
    
    
    <!-- CoreUI and necessary plugins-->
   <!-- left -->
	<%@ include file="./include/script.jsp"%>
		
  </body>
</html>

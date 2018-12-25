<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- header -->
  	<%@ include file="./include/header.jsp" %>
  	
  	
    <script>
   	
  //session에 있는 seq값으로 oldpw를 조회
    $(document).ready(function(){
    	$('#updateButton').click(function(){
    		var oldPw = $("#oldPw").val();
    		var newPw = $("#newPw").val();
    		var newPw2 = $("#newPw2").val();    		
    	
    		if(oldPw == ""){
    			alert("기존 비밀번호를 입력해 주세요.");
    			return false;
    		} else if (newPw == ""){
    			alert("변경 할 비밀번호를 입력해 주세요.");
    			return false;
    		} else if (newPw2 == ""){
    			alert("비밀번호 확인란을 입력해 주세요.");
    			return false;
    		} else if(newPw != newPw2){
    			alert("변경 비밀번호가 일치하지 않습니다.");
    			return false;
    		} else {
    			$('#regForm').submit();
    		}
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
			<li class="breadcrumb-item"><a href="#">비밀번호변경</a></li>
		</ol>

		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-10">
					<div class="card mx-4">
						<div class="card-body p-4">
							<h1>MYPAGE > 비밀번호 변경</h1>
							<p class="text-muted">변경 할 비밀번호를 입력해주세요.</p>

							<form id="regForm" name="regForm" method="post"
								action="/changePwServlet_MP">


								<!-- 회원정보 받기 -->
								

								<div class="input-group mb-4">
									<div class="input-group-prepend">
										<span class="input-group-text"> 기존비밀번호 </span>
									</div>
									<input class="form-control" type="text" id="oldPw" name="oldPw" value="">
								</div>


								<div class="input-group mb-4">
									<div class="input-group-prepend">
										<span class="input-group-text"> 변경비밀번호 </span>
									</div>
									<input class="form-control" type="password" id="newPw" name="newPw">
								</div>
								
								
								<div class="input-group mb-4">
									<div class="input-group-prepend">
										<span class="input-group-text">비밀번호확인</span>
									</div>
									<input class="form-control" type="password" id="newPw2" name="newPw2">
								</div>
								

								<!-- 회원가입 버튼 -->
								<div align="right">
									<input class="col-md-1" type="button" id="updateButton" value="확인">
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

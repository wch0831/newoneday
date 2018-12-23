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
    	$('#updateButton').click(function(){
    		var email = $('#mEmail').val();
    		var resnum = $('#mResnum').val();
    		if(email == ""){
    			alert("존재하지 않는 이메일 입니다.");
    		} else if(resnum == ""){
    			alert("주민등록번호를 잘 못 입력했습니다.")
    		} else {
    			alert("등록하신 이메일로 임시 비밀번호가 발급되었습니다.")
    		}
    		
    	});
    	
    });
    
    </script>
  </head>
  <body class="app header-fixed sidebar-fixed aside-menu-fixed sidebar-lg-show">
  
  <!-- header -->
  	<%@ include file="./include/top.jsp" %>
	<div class="app-body" align="center">


		<div class="container">
			<div class="card">
              <div class="warpper">
                <div class="row"> <br><br>
                  <div class="col-sm-10" align="left">
                    <h4 class="card-title mb-0">&nbsp;비밀번호 찾기</h4>
                    <div class="small text-muted">&nbsp;&nbsp;아래의 정보를 입력해주세요.</div> <br><br>
                  </div>
          
          
         				
								<form id="regForm" name="regForm" method="post" action="/registerServlet">
								<div class="container" >
			         				<div calss="card" >
								<div class="input-group mb-4" align="center">
									<div class="input-group-prepend">
										&nbsp;<span class="input-group-text"> 　이메일　　 </span>
									</div>
									&nbsp;<input class="col-sm-12" type="text" id="mEmail" name="mEmail" value="">
								</div>
						
								<div class="input-group mb-4">
									<div class="input-group-prepend">
										&nbsp;<span class="input-group-text"> 주민등록번호 </span>
									</div>
									<input class="col-sm-12" type="password" id="mResnum" name="mResnum" placeholder="뒤 1자리까지표시">
								</div>
						
	
								<div align="center">
									<input class="col-md-2" type="button" id="updateButton" value="찾기">
								</div>
								
							</div>
								</div>
							</form>					
          
                </div>
              </div>
            </div>
        </div>
		
   <!-- script -->
	<%@ include file="./include/script.jsp"%>
		
  </body>
</html>

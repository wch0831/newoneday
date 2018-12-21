<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>


<html lang="en">
  <head>
  <!-- header -->
  	<%@ include file="./include/header.jsp" %>
  	
  </head>
  <body class="app flex-row align-items-center">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-8">
          <div class="card-group">
            <div class="card p-4">
              <div class="card-body">
                <h1>Login</h1>
                <p class="text-muted">로그인 정보를 입력해 주세요.</p>
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text"> 이메일　 </span>
                  </div>
                  <input class="form-control" type="text">
                </div>
                <div class="input-group mb-4">
                  <div class="input-group-prepend">
                    <span class="input-group-text"> 패스워드 </span>
                  </div>
                  <input class="form-control" type="password">
                </div>
                <div class="row">
                  <div class="col-6">
                    <button class="btn btn-primary px-4" type="button">Login</button>
                  </div>
                  <div class="col-6 text-right">
                    <button class="btn btn-link px-0" type="button">PW찾기</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="card text-white bg-primary py-5 d-md-down-none" style="width:44%">
              <div class="card-body text-center">
                <div>
                  <h2>Sign up</h2>
                  <p>Oneday의 모든 서비스를 이용하려면 <br> 먼저 회원가입하여 주시기 바랍니다.</p>
                  <button class="btn btn-primary active mt-3" type="button" href="register.jsp">회원가입</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- CoreUI and necessary plugins-->
    
    <!-- script -->
    <%@ include file="./include/script.jsp" %>
    
  </body>
</html>

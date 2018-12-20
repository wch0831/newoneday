<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="/admin/include/header.jsp" %>

<script>


$(document).ready(function(){
	$.ajax({
		url:"/userInfo",
		tpye:"GET",
		success:function(res){
			console.log(res);
			var html = "";
			$.each(res, function(index, vv){
				html += "<tr><td>" + vv.mSeq + "</td>"
				html += "<td>"+ vv.mEmail +"</td>"
				html += "<td>"+ vv.mName +"</td>"
				html += "<td>"+ vv.mNick +"</td>"
				html += "<td>"+ vv.mResnum +"</td>"
				html += "<td>"+ vv.mGubun +"</td>"
				html += "<td>"+ vv.mRegdate +"</td>"
				html += "<td>"+ vv.mDel +"</td>"
				html += "<td>"+ vv.mDeldate +"</td></tr>"
			})
			$("#memberTable").html(html);
		}
	})	
	
})
	
</script>
</head>

<body class="fix-header fix-sidebar card-no-border">

    <!-- Preloader - style you can find in spinners.css -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
    
    <!-- Main wrapper - style you can find in pages.scss -->
    <div id="main-wrapper">
        
        
        <!-- top side -->

	<%@ include file="/admin/include/top.jsp" %>
        
        
        
      <!-- left side -->

	<%@ include file="/admin/include/left.jsp" %>
	
	
      
        <div class="page-wrapper">
        
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-8 align-self-center">
                        <h3 class="text-themecolor m-b-0 m-t-0">회원관리</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">회원관리</li>
                        </ol>
                    </div>
                   
                </div>
                
                
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- column -->
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-block">
                                <h4 class="card-title">회원관리</h4>
                                <h6 class="card-subtitle">회원정보 </h6>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>이메일</th>
                                                <th>이름</th>
                                                <th>닉네임</th>
                                                <th>주민번호</th>
                                                <th>유저구분</th>
                                                <th>가입일자</th>
                                                <th>탈퇴여부</th>
                                                <th>탈퇴일자</th>
                                            </tr>
                                        </thead>
                                        <tbody id = "memberTable" name= "memberTable">
                                           <!-- ajax이용해서 회원테이블 출력 --> 
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            
            
            <!-- footer -->
            <%@ include file="/admin/include/footer.jsp" %>
            
 
        </div>
    </div>
    
   		    <!-- script -->
            <%@ include file="/admin/include/script.jsp" %>
</body>

</html>

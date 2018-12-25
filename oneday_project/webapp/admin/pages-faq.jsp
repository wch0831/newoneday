<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="/admin/include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>


$(document).ready(function(){

	qnalist();
	
	
	
	function qnalist() {
		$.ajax({ 	
			url:"/adminfaq",   
			type:"post",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data: "nothing", 
			resultType:"json",
			success:function(resObject){
					console.log(resObject);		//객체
					var listStr = "";
		 			$.map(resObject, function(vv, idx){			
		 				
	 	            	listStr += "<tr>";
	 	            	listStr += "<td align='center'>" + vv.qSeq + "</td>";
	 	            	listStr += "<td>" + vv.mEmail + "</td>";

	 	            	listStr += "<td>" + vv.qGubun + "</td>";
	 	            	listStr += "<td width='25%'>" + vv.qTitle + "</td>";
	 	            	listStr += "<td>" + vv.qRegdate + "</td>";
	 	            	
	 	            	if(vv.aSeq == 0){
	 	            		listStr += "<td align='center'><i class='mdi mdi-close'></i></td>";
	 	            	}
	 	            	else{
	 	            		listStr += "<td align='center'><i class='mdi mdi-checkbox-blank-circle-outline'></i></td>";
	 	            	}
	 	            	
	 	            	listStr += "<td><input type='button' value='문의삭제'></td>";
	 	            	listStr += "</tr>";
	 	            	
 	 	            	listStr += "<tr>";
 	 	            	listStr += "<td></td>";
	 	            	listStr += "<td colspan='3'><i class='mdi mdi-subdirectory-arrow-right'></i>&nbsp;&nbsp;" + vv.qContent + "</td>";

	 	            	listStr += "<td>" + vv.qRegdate + "</td>";
	 	            	listStr += "<td></td>";
	 	            	listStr += "<td><input type='button' value='답변 작성 or 수정'></td>";
	 	            	listStr += "</tr>"; 

		 			});
		 			$("#qnaTable").html(listStr);
				}
			});
		}
	
	
});
	
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

	<header class="topbar">
            <nav class="navbar top-navbar navbar-toggleable-sm navbar-light">
              
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp">
                        <!-- Logo icon --><b>
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            
                            <!-- Light Logo icon -->
                            <img src="assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
                        </b>
                        <!--End Logo icon -->
                        <!-- Logo text --><span>
                         
                         <!-- Light Logo text -->    
                         <img src="assets/images/logo-light-text.png" class="light-logo" alt="homepage" /></span> </a>
                </div>
                
                <div class="navbar-collapse">

                    <ul class="navbar-nav mr-auto mt-md-0">
                       
                        <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="mdi mdi-menu"></i></a> </li>
                        <li class="nav-item hidden-sm-down search-box"> <a class="nav-link hidden-sm-down text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="ti-search"></i></a>
                            <form class="app-search">
                                <input type="text" class="form-control" placeholder="Search & enter"> <a class="srh-btn"><i class="ti-close"></i></a> </form>
                        </li>
                    </ul>
                    
                    <ul class="navbar-nav my-lg-0">
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="assets/images/users/1.jpg" alt="user" class="profile-pic m-r-10" />Markarn Doe</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        
        
        
      <!-- left side -->

	<%@ include file="/admin/include/left.jsp" %>
	
	
      
        <div class="page-wrapper">
        
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-8 align-self-center">
                        <h3 class="text-themecolor m-b-0 m-t-0">문의관리</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item active">문의관리</li>
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
                                <h4 class="card-title">문의관리</h4>
                                <h6 class="card-subtitle">문의글 목록 </h6>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>번호</th>
                                                <th>이메일</th>                                                
                                                <th>구분</th>
                                                <th>제목</th>
                                                <th>등록일</th>
                                                <th>답변여부</th>
                                                <th>삭제</th>
                                            </tr>
                                        </thead>
                                        <tbody id="qnaTable">
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

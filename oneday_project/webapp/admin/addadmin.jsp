<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file="/admin/include/header.jsp" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script>
$(document).ready(function(){
	$("#gumbtn").click(function(){
		var search = $("#search").val();
		console.log(search);
		var gum = $("#gum").val();
		console.log(gum);
	});

});
		

</script>

</head>



<body class="fix-header fix-sidebar card-no-border">
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
       
                      
                        
                
                
           <%@ include file="/admin/include/top.jsp" %>           
                   
                      
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
       <%@ include file="/admin/include/left.jsp" %>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-8 align-self-center">
                        <h3 class="text-themecolor m-b-0 m-t-0">관리자 추가 리스트</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Addplace</li>
                        </ol>
                    </div>
                         <div  class="col col-xs-6 text-right">
						
						<div  class="col col-xs-6 text-right">
						<select id="search" name="search">
   						<option value="">search</option>
    					<option value="주소">주소</option>
    					<option value="목적">목적</option>
    					<option value="실내/실외">실내/실외</option>
						</select>
						
						<input type = "text" id="gum" placeholder="검색어">
						<button id="gumbtn">검색</button>
						</div>
						</div>
                   
                </div>
               
               <!---------------------- 폼작성 ----------------------->
               
             	               <div class="row">
                    <!-- column -->
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-block">
                              
                                <div class="table-responsive">
                                        <form id="regForm" method="POST" action="/place-list" class="needs-validation"
                enctype="multipart/form-data">
                  <div class="row">
                    <div class="form-group col-6">
                      <label for="name">이름</label>
                      <input id="p_title" type="text" 
                      class="form-control" name="p_title" autofocus 
                       required>
                     
                    </div>
                    <div class="form-group col-6">
                      <label for="purpose">목적</label>
                      <input id="p_purpose" type="text" class="form-control" 
                      name="p_purpose">
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="content">주소</label>
                    <input id="p_content" type="text" class="form-control" name="p_content">
                    <div class="invalid-feedback">
                    		
                    </div>
                  </div>

                  <div class="row">
                    <div class="form-group col-6">
                      <label for="lat" class="d-block">위도</label>
                      <input id="p_lat" type="text" class="form-control" name="p_lat">
                    </div>
                    <div class="form-group col-6">
                      <label for="lng" class="d-block">경도</label>
                      <input id="p_lng" type="text" class="form-control" name="p_lng">
                    </div>
                  </div>
									
                 
                  <div class="form-group">
                  	<div class="graybox" style="line-height:220%">
									    <div id="ex2_postcodify" class="postcodify_search_form postcode_search_form">	
									   <!--  <div class="postcodify_search_controls postcode_search_controls">
									    	<label for="postcodify_15420024258697316" style="display: none;">검색 키워드</label>
									    	<input type="text" class="keyword" value="" id="postcodify_15420024258697316" style="width: 343px;">
									    	<button type="button" class="search_button" id="postcodify_15420024258697316_button">검색</button>
									    </div>
									    <div class="too_short postcodify_search_status postcode_search_status">검색어는 3글자 이상 입력해 주십시오.</div>
									     -->
									    </div>
									    <label for="area">지역  </label>
									    <input type="text" id="p_area" class="form-control" value="" style="width: 343px;">
									    <br>
									    <label for="cost">비용  </label>
									    <input type="text" id="p_cost" class="form-control" value="" style="width: 343px;">
									    <br>
									    <label for="inout">실내/실외</label>
									    <input type="text" id="p_inout" class="form-control" value="" style="width: 305px;">
									    <br>
									    <label for="regdate">날짜  </label>
									    <input type="text" id="p_regdate" class="form-control" value="" style="width: 343px;">
									    <br>
									    
									    
									</div>
                </div>
                  

                  <div class="form-group">	
                    <button onclick="location='place-list.jsp'" type="button" id="regButton" class="btn btn-primary btn-block">
                      Register
                    </button>
                  </div>
                </form>
                                </div>
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
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer">
                Â© 2018 Pro Admin 
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
  <%@ include file="/admin/include/script.jsp" %>
  
    <!-- google maps api -->
    <script src="https://maps.google.com/maps/api/js?key=AIzaSyCUBL-6KdclGJ2a_UpmB2LXvq7VOcPT7K4&sensor=true"></script>
    <script src="assets/plugins/gmaps/gmaps.min.js"></script>
    <script src="assets/plugins/gmaps/jquery.gmaps.js"></script>
</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    
    
    <%@ include file="/admin/include/header.jsp" %>
    
    
    <script src="/admin/assets/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="/admin/assets/plugins/bootstrap/js/tether.min.js"></script>
    <script src="/admin/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="/admin/js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="/admin/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="/admin/js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="/admin/assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <!--Custom JavaScript -->
    <script src="/admin/js/custom.min.js"></script>
    
    <script>
   $(document).ready(function(){
	   // 에이잭스
			
		   
	   $(document).on("click",".adRseq",function(){
	   var seq = $(this).attr("name");
		alert("삭제되었습니다");	
	   var sendData = {"rSeq":seq};
	   
	   
		   
			$.ajax({ 	
			url:"/ad_review",
			type:"post",
			contentType: "application/json; charset=UTF-8",
			data:JSON.stringify(sendData),
			success:function(gsonStr){
					console.log(gsonStr);		//객체
					var topListStr = "";
					var listStr = "";
		 			$.map(gsonStr, function(vv, idx){				 					 	            			 	            
		 	            	listStr += "<tr>";
		 	            	listStr += "<td>"+vv.oSeq+"</td>";
		 	            	listStr += "<td>"+vv.rSeq+"</td>";
		 	            	listStr += "<td>"+vv.oTitle+"</td>";
		 	            	listStr += "<td>"+vv.mNick+"</td>";
		 	            	listStr += "<td>"+vv.rContent+"</td>";
		 	            	listStr += "<td>"+vv.rRegdate+"</td>";          
		 	            	//listStr += "<td><input type='button' name='"+vv.rSeq+"' id='delBtn' class='adRseq' value='삭제'></td>";
		 	            	listStr += "<td><img src='/admin/img/del.jpg' name='"+vv.rSeq+"' class='adRseq' width='35' height='35'></td>";
		 	            	listStr += "</tr>";                               	 	            	 	            	
		 	  	});
		 			
		 			$("#contents").empty();
		 			$("#contents").html(listStr);	 			
		 			
			} //end of success
		});  	
		
	   
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
        <header class="topbar">
            <nav class="navbar top-navbar navbar-toggleable-sm navbar-light">
                <!-- ============================================================== -->
                <!-- Logo -->
                <!-- ============================================================== -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp">
                        <!-- Logo icon --><b>
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                           
                            <!-- Light Logo icon -->
                            <img src="/admin/assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
                        </b>
                        <!--End Logo icon -->
                        <!-- Logo text --><span>
                         
                         <!-- Light Logo text -->    
                         <img src="/admin/assets/images/logo-light-text.png" class="light-logo" alt="homepage" /></span> </a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav mr-auto mt-md-0">
                        <!-- This is  -->
                        <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="mdi mdi-menu"></i></a> </li>
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
                        <li class="nav-item hidden-sm-down search-box"> <a class="nav-link hidden-sm-down text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="ti-search"></i></a>
                            <form class="app-search">
                                <input type="text" class="form-control" placeholder="Search & enter"> <a class="srh-btn"><i class="ti-close"></i></a> </form>
                        </li>
                    </ul>
                    <!-- ============================================================== -->
                    <!-- User profile and search -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav my-lg-0">
                        <!-- ============================================================== -->
                        <!-- Profile -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="assets/images/users/1.jpg" alt="user" class="profile-pic m-r-10" />Markarn Doe</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
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
                        <h3 class="text-themecolor m-b-0 m-t-0">Table</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Table</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-4 align-self-center">
                        <a href="https://themewagon.com/themes/material-bootstrap-4-free-admin-template/" class="btn waves-effect waves-light btn-danger pull-right hidden-sm-down">Download Now</a>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- column -->
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-block">
                                <h4 class="card-title">Basic Table</h4>
                                <h6 class="card-subtitle">Add class <code>.table</code></h6>
                                <div class="table-responsive">
                                   <table class="table" id="ad_table" name="ad_table">
                                        <thead>                                                                                   
                                            <tr>
                                                <th><b>게시글번호</th>
                                                <th><b>댓글번호</th>
                                                <th><b>게시글제목</th>
                                                <th><b>닉네임</th>
                                                <th><b>댓글내용</th>
                                                <th><b>등록일자</th>
                                            	<!-- <th>체크</th> -->
                                            	<th>삭제</th>
                                           
                                            </tr>
                                        </thead>
                                         <tbody id="contents">
                                            <c:forEach var="vo" items="${KEY_LIST}">
                                                <tr>
	                                                <td>${vo.oSeq}</td>
	                                                <td>${vo.rSeq}</td>
	                                                <td>${vo.oTitle}</td>
	                                                <td>${vo.mNick}</td>
	                                                <td>${vo.rContent}</td>
	                                                <td>${vo.rRegdate}</td> 
	                                                <%-- <td><input type="button" name="${vo.rSeq}" id="delBtn" class="adRse" value="삭제"></td> --%>	                                               
	                                                <td><img src="/admin/img/del.jpg" name="${vo.rSeq}" class="adRseq" width="35" height="35"></td>

	                                                
                                                </tr>		
                                            </c:forEach> 
                                         </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                                   
                </div>
                <div align="right" id=search>
          		   <form name="rSearch" method="post" action="/admin_search">
               			 <select name="searchCom" id="searchCom" >
                 			   <option value="rContent">내용                     		
               			 </select>
              			  <input type="textarea" id="searchTxt" name="searchTxt">
             		     <input type="submit" id="searchBtn" value="검색">
           		  </form>                   
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
                Â© 2017 Material Pro Admin by wrappixel.com
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
   
</body>

</html>

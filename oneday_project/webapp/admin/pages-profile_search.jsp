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
		type:"GET",
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
				html += "<td>"+ vv.mDeldate +"</td>"
				html += "<td><img src='/admin/img/del.jpg' name='"+ vv.mSeq +"' class='mSeq' width='35' height='35'></td></tr>"
			});
			$(".memberTable").html(html);
		}
	});



	 $(document).on("click",".mSeq",function(){
		   var seq = $(this).attr("name");
		   var sendData = {"mSeq":seq};
		   $.ajax({
				url:"/userInfo",
				type:"POST",
				data:JSON.stringify(sendData),
				success:function(gsonStr){
					console.log(gsonStr);
					var html = "";
					$.map(gsonStr, function(vv, idx){
						html += "<tr><td>" + vv.mSeq + "</td>";
						html += "<td>"+ vv.mEmail +"</td>";
						html += "<td>"+ vv.mName +"</td>";
						html += "<td>"+ vv.mNick +"</td>";
						html += "<td>"+ vv.mResnum +"</td>";
						html += "<td>"+ vv.mGubun +"</td>";
						html += "<td>"+ vv.mRegdate +"</td>";
						html += "<td>"+ vv.mDel +"</td>";
						html += "<td>"+ vv.mDeldate +"</td>";
						html += "<td><img src='/admin/img/del.jpg' name='"+ vv.mSeq +"' class='mSeq' width='35' height='35'></td></tr>";
					});
					
					$(".memberTable").empty();
					$(".memberTable").html(html);
				}
			});
	 });
	
	 
	 $(document).on("click","#searchbtn",function(){
		 var seq = $(this).attr("searchbtn");
		 var sendData = {"mSeq":seq};
		   $.ajax({
				url:"/memberSearchServlet",
				type:"POST",
				data:JSON.stringify(sendData),
				success:function(gsonStr){
					console.log(gsonStr);
					var html = "";
					$.map(gsonStr, function(vv, idx){
						html += "<tr><td>" + vv.mSeq + "</td>";
						html += "<td>"+ vv.mEmail +"</td>";
						html += "<td>"+ vv.mName +"</td>";
						html += "<td>"+ vv.mNick +"</td>";
						html += "<td>"+ vv.mResnum +"</td>";
						html += "<td>"+ vv.mGubun +"</td>";
						html += "<td>"+ vv.mRegdate +"</td>";
						html += "<td>"+ vv.mDel +"</td>";
						html += "<td>"+ vv.mDeldate +"</td>";
						html += "<td><img src='/admin/img/del.jpg' name='"+ vv.mSeq +"' class='mSeq' width='35' height='35'></td></tr>";
					});
					
					$(".memberTable").empty();
					$(".memberTable").html(html);
				}
			});
	 });
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
                    
                    <form mathod="post" action="memberSearchServlet">
                    <div  class="col col-xs-6 text-right">
						
						<div  class="col col-xs-6 text-right">
						<select id="search" name="search">
    					<option value="닉네임">닉네임</option>
    				
						</select>
						
						<input type = "text" id="search" name="search" placeholder="검색어">
						<input type="button" id="searchbtn">검색</button>
						</div>
					</div>
                   </form>
                   
                   
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
                                                <th>강퇴</th>
                                            </tr>
                                        </thead>
                                        <tbody class="memberTable" id = "memberTable" name= "memberTable">
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

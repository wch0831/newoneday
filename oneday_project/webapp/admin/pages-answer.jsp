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
	
	/* 답변 삭제 */
	$(document).on("click",".deleteBtn",function(){	
		var aSeq = $(this).attr("name");
		var sendData = {"aSeq":aSeq};
		
		if (confirm("정말 답변을 삭제하시겠습니까?") == true){  
				$.ajax({ 
					url:"/adminanswerdelete",
					type:"post",
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					data:"MYKEY="+JSON.stringify(sendData)
				});
				$("#answerTable").empty();
				qnalist();
		 }else{   
		     return false;
		 }
		
	});
	
	/* 답변 추가 */
	$("#CreateBtn").click(function name() {
		window.open('/contact/answeradd.jsp','답변추가','width=800,height=500,location=no,status=no');
	});
});


function qnalist() {
	$.ajax({ 	
		url:"/adminfaqanswerlist",   
		type:"post",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		data: "nothing", 
		resultType:"json",
		success:function(resObject){
				console.log(resObject);		//객체
				var listStr = "";
				listStr += "<thead>";
				listStr += "<tr>";
				listStr += "<th style='text-align:center;'>번호</th>";
				listStr += "<th>내용</th>";                                                
				listStr += "<th style='text-align:center;'>삭제</th>";
				listStr += "</tr>";
				listStr += "</thead>";
	 			$.map(resObject, function(vv, idx){			
	 				listStr += "<tbody>";
 	            	listStr += "<tr>";
 	            	listStr += "<td align='center'>" + vv.aSeq + "</td>";
 	            	listStr += "<td width='70%'>" + vv.aContent + "</td>";
 	            	listStr += "<td align='center'><input type='button' value='삭제' class='deleteBtn' name='" + vv.aSeq + "'></td>";
 	            	listStr += "</tr>";
 	            	listStr += "</tbody>";
	 			});
	 			$("#answerTable").empty();
	 			$("#answerTable").html(listStr);
			}
		});
}
	
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
                        <h3 class="text-themecolor m-b-0 m-t-0">답변관리</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item active">답변관리</li>
                        </ol>
                    </div>
                   
                <input type="button" value="답변추가" id="CreateBtn" name="CreateBtn" style="position:absolute; right:30px; width:100px; height:60px">
                </div>
                
                
                
             

                
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- column -->
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-block">
                                <h4 class="card-title">답변관리</h4>
                                <h6 class="card-subtitle">답변 목록 </h6>
                                <div class="table-responsive">
                                    <table class="table" id="answerTable">
                                        <thead>
                                            <tr>
                                                <th style="text-align:center;">번호</th>
                                                <th>내용</th>
                                                <th style="text-align:center;">삭제</th>
                                            </tr>
                                        </thead>
                                       
                                        <!-- ajax이용해서 답변 테이블 출력 --> 
                                                                         
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

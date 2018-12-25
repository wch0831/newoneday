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
	
	$(document).on("click",".delBtn",function(){	
		var qSeq = $(this).attr("name");
		var sendData = {"qSeq":qSeq};
		
		if (confirm("정말 삭제하시겠습니까?") == true){  
				$.ajax({ 
					url:"/adminfaqdelete",
					type:"post",
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					data:"MYKEY="+JSON.stringify(sendData)
				});
				$("#qnaTable").empty();
				qnalist();
		 }else{   
		     return false;
		 }
		
	});


});

function qnalist() {
	$.ajax({ 	
		url:"/adminfaq",   
		type:"post",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		data: "nothing", 
		resultType:"json",
		success:function(resObject){
				var listStr = "";
				listStr += "<thead>";
				listStr += "<tr>";
				listStr += "<th>번호</th>";
				listStr += "<th>이메일</th>";                                                
				listStr += "<th>구분</th>";
				listStr += "<th>제목</th>";
				listStr += "<th>등록일</th>";
				listStr += "<th>답변여부</th>";
				listStr += "<th>관리</th>";
				listStr += "</tr>";
				listStr += "</thead>";
	 			$.map(resObject, function(vv, idx){			
	 				listStr += "<tbody>";
	 				/* 첫째 줄 */
 	            	listStr += "<tr>";
 	            	listStr += "<td align='center'>" + vv.qSeq + "</td>";
 	            	listStr += "<td>" + vv.mEmail + "</td>";
 	            	listStr += "<td>" + vv.qGubun + "</td>";
 	            	listStr += "<td width='30%'>" + vv.qTitle + "</td>";
 	            	listStr += "<td>" + vv.qRegdate + "</td>"; 	         
 	            	if(vv.aSeq == 0){
 	            		listStr += "<td align='center'><i class='mdi mdi-close'></i></td>";
 	            	}
 	            	else{
 	            		listStr += "<td align='center'><i class='mdi mdi-checkbox-blank-circle-outline'></i></td>";
 	            	}
 	            	listStr += "<td><input type='button' value='삭제' class='delBtn' name='" + vv.qSeq + "'></td>";
 	            	listStr += "</tr>";
 	            	
 	            	/* 둘째 줄 */
	 	            listStr += "<tr>";
	 	            listStr += "<td align='center'></td>";
 	            	listStr += "<td colspan='3'><i class='mdi mdi-subdirectory-arrow-right'></i>&nbsp;&nbsp;<i class='mdi mdi-quicktime'></i>&nbsp;&nbsp;" + vv.qContent + "</td>";
 	            	if(vv.aRegdate == null){
	 	            	listStr += "<td><font color='#00FF00'>답변 대기중</font></td>";
	 	            	listStr += "<td></td>";
	 	            	listStr += "<td><input type='button' value='답변하기'></td>";
	 	            	listStr += "</tr>"; 
	 	            	listStr += "</tbody>";
 	            	}
 	            	else{
 	            	listStr += "<td><font color='#00FF00'>" + vv.aRegdate + "</font></td>";
 	            	listStr += "<td></td>";
 	            	listStr += "<td><input type='button' value='답변수정'></td>";
 	            	listStr += "</tr>"; 
 	            	listStr += "</tbody>";
 	            	}

	 			});
	 			$("#qnaTable").empty();
	 			$("#qnaTable").html(listStr);
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
                                    <table class="table" id="qnaTable">

										<!-- 뿌려지는 영역 -->
										
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

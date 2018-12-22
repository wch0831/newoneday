<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="/admin/include/header.jsp" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
$(document).ready(function(){
	$("#gumbtn").click(function(){
		console.log("hahahah");
		var gum = $("#gum").val();
		console.log(gum);
		
		$.ajax({ 
			url:"/search",
			type:"post",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:"gum="+gum,
			resultType:"json",
			success:function(resJson){
				console.log(resJson);
				makeHtml(resJson);
				
			}
		}); 
		
		
	});
	
	function makeHtml(obj) {
		var htmlStr = "";
  	$.map(obj, function(vv, idx){
  		htmlStr += "<tr>";
  		htmlStr += "<td><h6 style=text-align:center>"+vv.pSeq+"</h6></td>";
  		htmlStr += "<td><h6 style=text-align:center>"+vv.pTitle+"</h6></td>";
  		htmlStr += "<td><h6 style=text-align:center>"+vv.pContent+"</h6></td> ";
  		htmlStr += "<td><h6 style=text-align:center>"+vv.pLat+"</h6></td>";
  		htmlStr += "<td><h6 style=text-align:center>"+vv.pLng+"</h6></td>";
  		htmlStr += "<td><h6 style=text-align:center>"+vv.pArea+"</h6></td>";
  		htmlStr += "<td><h6 style=text-align:center>"+vv.pCost+"</h6></td>";
  		htmlStr += "<td><h6 style=text-align:center>"+vv.pInout+"</h6></td>";
  		htmlStr += "<td><h6 style=text-align:center>"+vv.pPurpose+"</h6></td>";
  		htmlStr += "<td><h6> <input onclick=\"location='/UpdateAdmin?pSeq="+vv.pSeq+"'\" id='updatebutton' type = 'button' value='수정' name='"+vv.pSeq+"' width='35' height='35'></h6></td>";
  		htmlStr += "</tr>";			
  	});
  	$("#hotbody").empty();
  	$("#hotbody").html(htmlStr);
	}
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
        <%@ include file="/admin/include/left.jsp" %>
        
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
                        <h3 class="text-themecolor m-b-0 m-t-0">관리자 장소 리스트</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/admin/index.jsp">Home</a></li>
                            <li class="breadcrumb-item active">Placelist</li>
                        </ol>
                    </div>
                         <div  class="col col-xs-6 text-right">
						
						<div  class="col col-xs-6 text-right">
						<select id="search" name="search">
   						<option value="">search</option>
    					<option value="이름">이름</option>
    				
						</select>
						
						<input type = "text" id="gum" placeholder="검색어">
						<button id="gumbtn">검색</button>
						</div>
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
                              
                                <div class="table-responsive">
                                   <table class="table" id="ad_table" name="ad_table">
                                        <thead>                                                                                   
                                            <tr style="background-color:#D8D8D8" >
                                               
                     							
                                           		<th><h6 style=text-align:center>번호</h6></th>	
                                                <th><h6 style=text-align:center>이름</h6></th>
                                                <th><h6 style=text-align:center>주소</h6></th>
                                                <th><h6 style=text-align:center>위도</h6></th>
                                                <th><h6 style=text-align:center>경도</h6></th>
                                                <th><h6 style=text-align:center>지역</h6></th>
                                                <th><h6 style=text-align:center>비용</h6></th>
                                                <th><h6 style=text-align:center>실내/외</h6></th>
                                                <th><h6 style=text-align:center>목적</h6></th>
                                                <th><h6 style=text-align:center>수정</h6></th>
                                            </tr>
                                               
                                        </thead>
                                         <tbody id="hotbody">
                                            <c:forEach var="vo" items="${KEY_LIST}">
                                                <tr>
	                                              
                     								
	                                                <td><h6 style=text-align:center>${vo.pSeq}</h6></td>
	                                                <td><h6 style=text-align:center>${vo.pTitle}</h6></td>
	                                                <td><h6 style=text-align:center>${vo.pContent}</h6></td> 
	                                                <td><h6 style=text-align:center>${vo.pLat}</h6></td>
	                                                <td><h6 style=text-align:center>${vo.pLng}</h6></td>
	                                                <td><h6 style=text-align:center>${vo.pArea}</h6></td>
	                                                <td><h6 style=text-align:center>${vo.pCost}</h6></td>
	                                                <td><h6 style=text-align:center>${vo.pInout}</h6></td>
	                                                <td><h6 style=text-align:center>${vo.pPurpose}</h6></td>
	                                                <td><h6> <input onclick="location='/UpdateAdmin?pSeq=${vo.pSeq}'" id="updatebutton" type = "button" value="수정" name="${vo.pSeq}" width="35" height="35"></h6></td>
	                                                
                                                </tr>		
                                            </c:forEach> 
                                         </tbody>       
                             <!--           <tbody>
                                            <tr>
                                                <td>2</td>
                                                <td>Deshmukh</td>
                                                <td>Gaylord</td>
                                                <td>@Ritesh</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Sanghani</td>
                                                <td>Gusikowski</td>
                                                <td>@Govinda</td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>Roshan</td>
                                                <td>Rogahn</td>
                                                <td>@Hritik</td>
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td>Joshi</td>
                                                <td>Hickle</td>
                                                <td>@Maruti</td>
                                            </tr>
                                            <tr>
                                                <td>6</td>s
                                                <td>Nigam</td>
                                                <td>Eichmann</td>
                                                <td>@Sonu</td>
                                            </tr>  
                                         </tbody>  -->
                                    </table>
                                </div>
                                </div>
                             
                                
                            </div>
                            <div id="buttonall">
                            <p align="right" >
                            <input onclick="location='/admin/addadmin.jsp'" id="insertbutton" type = "button" value="추가"/> 
                          	 
                          	
                             </p>
                             
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
            <%@ include file="/admin/include/footer.jsp" %>
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- script -->
     <%@ include file="/admin/include/script.jsp" %>
    <!-- google maps api -->
    <script src="https://maps.google.com/maps/api/js?key=AIzaSyCUBL-6KdclGJ2a_UpmB2LXvq7VOcPT7K4&sensor=true"></script>
    <script src="/admin/assets/plugins/gmaps/gmaps.min.js"></script>
    <script src="/admin/assets/plugins/gmaps/jquery.gmaps.js"></script>
</body>

</html>

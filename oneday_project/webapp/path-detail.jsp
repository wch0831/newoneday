<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>

	<title>하루이야기</title>
<%@ include file="/include/header.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

$(document).ready(function(){
	

	//"수정버튼" 클릭시 text로 활성화
    $(document).on("click",".reUpdate",function(){ //글쓰기 버튼  눌렀을 때 기존의 있는 내용을 불러오고 text로 활성화 된다.
       var names = $(this).attr("name");
        var arr = names.split("^^^");
        alert(arr[0] +""+arr[1]);
		//alert("ㅅㅂ");
        //alert(arr[0] +","+arr[1]);
       //입력된 글이 들어와야한다..!!!
       //일단은 근데 seq랑 content를 제대로 가져오는건 맞으니까.  reUpdate버튼은 서블릿을 타는게 아니라서. 걍 단순히 그 값 가지고 html 그려주는거니까.
       //
       var htmlStr = "<input type='hidden' id='updateReplySeq' value='"+arr[0]+"'>";
           htmlStr += "<input type='text' name='' id='updateReplyContent' value='"+arr[1]+"'>";   
           htmlStr += "<span onClick=\"replyEditSubmit(this)\" class='replyEditSubmit' name=''>글쓰기</span>";  
       
       $("#readContent"+arr[0]).empty();  //<< 여기서 해당 seq댓글을 비움.   
       
       debugger;
        
       $("#readContent"+arr[0]).html(htmlStr);
       /* $("#"+arr[0]).html(htmlStr); */  //<< 여기서 다시 그려줌.   
    });
	
	
    $(document).on("click",".reDel",function(){
       alert("ㅅㅄㅄㅄㅄㅂ");
     });
	
	
	//"수정 확인 버튼 " 클릭시  rseq와 rContent를 가지고 ajax태움.
    function replyEditSubmit() {
		alert("!!!");		
    	var rseq = $("#updateReplySeq").val();
    	var rcontent = $("#updateReplyContent").val();
    	var sendData = {"rseq":rseq, "rcontent":rcontent};
    	
    	  /* $.ajax({ 
    		  		 
    	 
				url:"/reviewUpdate",
				type:"post",
				//contentType: "application/json; charset=UTF-8", 
				data:JSON.stringify(sendData),   
				success:function(gsonStr){
						console.log(gsonStr);		
						var htmlStr = "<ul>";
			 			$.map(gsonStr, function(vv, idx){
				  		htmlStr += "<div class='wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6'>";
				  		htmlStr += "<img src='images/avatar-01.jpg' alt='AVATAR'>";
					    htmlStr += "</div>";
						htmlStr += "<div class='size-207'>";
						htmlStr += "<div class='flex-w flex-sb-m p-b-17'>";
						htmlStr += "<span class='mtext-107 cl2 p-r-20'>"+vv.mNick+"</span>";																				
						htmlStr += "<p class='reUpDel'>";
						htmlStr += "<span class='replyUp_span'><img src='/images/reviewUp.png'  name='"+vv.rSeq^^^$vv.rContent+"'class='reUpdate' width='20' height='20'></span>";
						htmlStr += "<span class='replyDel_span'><img src='/images/reviewDel.png'  name='"+vv.rSeq+"' class='reDel' id='reDel' width='20' height='20'>";
						htmlStr += "</p>";																
						htmlStr += "</span>";
						htmlStr += "</div>";
						htmlStr += "<div class='readContent'>";
						htmlStr += "<input type='textarea' border='0'  value='"+vv.rContent+"' readonly>";
						htmlStr += "</div>";
						htmlStr += "</div>";
				  	});
				  	//htmlStr += "</ul>";
				  	
				  	//div는 남겨두고 기존 댓글 내용만 지우기
				  	$("#replyform").empty();
				  	$("#replyform").html(htmlStr);
				}
	}); //end of ajax  */ 
    	
    }
	

		$(document).on("click",".btn",function(){	  
		  		
		  		var reply = $("#dmt").val();
		  		var ooseq = ${KEY_VO.oSeq};
		  		alert(reply+" "+ooseq);
		  		var sendData = {"rContent":reply , "oSeq":ooseq, "mSeq":$(sessionScope.SESS_SEQ)};
				      $.ajax({ 
							url:"/reviewServlet",
							type:"post",
							contentType: "application/json; charset=UTF-8", 
							data:JSON.stringify(sendData),   
							success:function(gsonStr){
									console.log(gsonStr);		//[{"empno
									var htmlStr = "";
						 			$.map(gsonStr, function(vv, idx){
							  		htmlStr += "<div class='wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6'>";
							  		htmlStr += "<img src='images/avatar-01.jpg' alt='AVATAR'>";
								    htmlStr += "</div>";
									htmlStr += "<div class='size-207'>";
									htmlStr += "<div class='flex-w flex-sb-m p-b-17'>";
									htmlStr += "<span class='mtext-107 cl2 p-r-20'><b>"+vv.mNick+"</b></span>";	
									htmlStr += "<br>";
									htmlStr += "<p class='reUpDel'>";
									htmlStr += "<span class='replyUp_span'><img src='/images/reviewUp.png'  name='"+vv.rSeq+"^^^"+vv.rContent+"'class='reUpdate' width='20' height='20'></span>";
									htmlStr += "<span class='replyDel_span'><img src='/images/reviewDel.png'  name='"+vv.rSeq+"' class='reDel' id='reDel' width='20' height='20'></span>";
									htmlStr += "</p>";								
									htmlStr += "</div>";
									htmlStr += "<div class='readContent'>";
									htmlStr += "<input type='textarea' border='0'  id='reply'  value='"+vv.rContent+"' readonly>";
									htmlStr += "<br>";
									htmlStr += "</div>";
									htmlStr += "</div>";
									
							  	});
						 			
							  	//div는 남겨두고 기존 댓글 내용만 지우기
							  	$(".replyform").empty();
							  	$(".replyform").html(htmlStr);
							}
				}); //end of ajax   
    });

		
/* 	  $(document).on("click",".reUpdate",function(){
		   var seq = $(this).attr("name");
			alert(name);	
		   var sendData = {"rSeq":seq};
		   
				$.ajax({ 	
				url:"/userReview",
				type:"post",
				contentType: "application/json; charset=UTF-8",
				data:JSON.stringify(sendData),
				success:function(gsonStr){
						console.log(gsonStr);		//객체
						var topListStr = "";
						var listStr = "";
			 			$.map(gsonStr, function(vv, idx){				 					 	            			 	            
			 	            	listStr += "<tr>";
			 	            	listStr += "<td class='text-center'>"+vv.oSeq+"</td>";
			 	            	listStr += "<td class='text-center'>"+vv.rSeq+"</td>";		 	            			 	            
			 	            	listStr += "<td class='text-center'>"+vv.rContent+"</td>";
			 	            	listStr += "<td class='text-center'>"+vv.rRegdate+"</td>";            
			 	            	listStr += "<td class='text-center'><img src='/admin/img/del.jpg' onclick='#' name='"+vv.rSeq+"' class='adRseq' width='35' height='35'></td>";
			 	            	listStr += "</tr>";                               	 	            	 	            	
			 	  	});
			 			
			 			$("#contents").empty();
			 			$("#contents").html(listStr);	 			
			 			
				} //end of success
			});  	
			
	   }); */
	  
	  
});    

	
</script>
</head>
<body class="animsition">
	
<%@ include file="/include/top.jsp" %>	

	
<%@ include file="/include/left.jsp" %>

	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.jsp" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="blog.html" class="stext-109 cl8 hov-cl1 trans-04">
				Blog
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">	
				${KEY_VO.oTheme}, ${KEY_VO.oArea}
			</span>
		</div>
	</div>


	<!-- Content page -->
	<section class="bg0 p-t-52 p-b-20">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg">
						<!--  -->
						<div class="wrap-pic-w how-pos5-parent">
							<img src='${KEY_VO.oTmapImg}' alt="IMG-BLOG">

							<div class="flex-col-c-m size-123 bg9 how-pos5">
								<span class="ltext-107 cl2 txt-center">
									22
								</span>

								<span class="stext-109 cl3 txt-center">
									Jan 2018
								</span>
							</div>
						</div>

						<div class="p-t-32">
							<span class="flex-w flex-m stext-111 cl2 p-b-19">
								<span>
									<span class="cl4">By</span> Admin  
									<span class="cl12 m-l-4 m-r-6">|</span>
								</span>

								<span>
									22 Jan, 2018
									<span class="cl12 m-l-4 m-r-6">|</span>
								</span>

								<span>
									StreetStyle, Fashion, Couple  
									<span class="cl12 m-l-4 m-r-6">|</span>
								</span>

								<span>
									8 Comments
								</span>
							</span>

							<h4 class="ltext-109 cl2 p-b-28">
								${KEY_VO.oTitle}
							</h4>

							<p class="stext-117 cl6 p-b-26">
								${KEY_VO.oContent}
							</p>
						</div>

						<div class="flex-w flex-t p-t-16">
							<span class="size-216 stext-116 cl8 p-t-4">
								Tags
							</span>

							<div class="flex-w size-217">
								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Streetstyle
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Crafts
								</a>
							</div>
							
						</div>
					
					<!-- 댓글폼  -->
					<div class="replyform">	
						<c:forEach var="vo" items="${KEY_LIST}">
						<div class="wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6">
												<img src="images/avatar-01.jpg" alt="AVATAR">
						</div>
						<div class="size-207">
											
												<div class="flex-w flex-sb-m p-b-17">
													
													<span class="mtext-107 cl2 p-r-20">														
														<b>${vo.mNick}<b>
													</span>
													
												 
													   <p class="reUpDel">
														<span class="replyUp_span"><img src="/images/reviewUp.png"  name="${vo.rSeq}^^^${vo.rContent}"  class="reUpdate" width="20" height="20"></span>
														<span class="replyDel_span"><img src="/images/reviewDel.png"  name="${vo.rSeq}" class="reDel" id="reDel" width="20" height="20"></span>
													   </p>
																					
												</div>

												<div id="readContent${vo.rSeq}"> 
													<input type="text" border="0" id="reply"  value="${vo.rContent}" readonly></span>
													<br>
												</div> 			
										
										<%-- <div id="${vo.rSeq}"> 
													<input type="text" border="0" id="reply"  value="${vo.rContent}" readonly></span>
													<br>
												</div>	 --%>	
					   </div>
							</c:forEach>	
							<br>			
						</div>					
					

						<div class="p-t-40">
							<h5 class="mtext-113 cl2 p-b-12">
								Leave a Comment
							</h5>

							<p class="stext-107 cl6 p-b-40">
								Your email address will not be published. Required fields are marked *
							</p>

							
								<div class="bor19 m-b-20">
									<textarea class="stext-111 cl2 plh3 size-124 p-lr-18 p-tb-15" id="dmt" name="cmt" placeholder="Comment..."></textarea>
								</div>

								</div>

								<input type="button" class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04" name="replybtn" id="replybtn" value="작성" >
								<input type="button" class="btn" value="작성2">
									
								
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>	
	
		
<%@ include file="/include/footer.jsp" %>
	
<%@ include file="/include/script.jsp" %>

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>



</body>
</html>
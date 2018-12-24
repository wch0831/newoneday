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
	var toggle=0;
	var acheck=0;
	var aa=null;
	var bb=null;
	console.log(toggle);
	$("#categoryt").click(function () {
		if(toggle==0){
			var htmlstr = "<li>";
			htmlstr += "<button class='dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4 t' value='여행'>";
			htmlstr += "-여행</button></li>";
			htmlstr += "<li>";
			htmlstr += "<button class='dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4 t' value='데이트'>";
			htmlstr += "-데이트</button></li>";
			htmlstr += "<li>";
			htmlstr += "<button class='dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4 t' value='산책'>";
			htmlstr += "-산책</button></li>";
			$("#ucateT").html(htmlstr);
			toggle=1;
		}else{
			$("#ucateT").empty();
			toggle=0;
		}
		
		
	});
	$("#categorya").click(function () {
		if(acheck==0){
		var htmlstr = "<li>";
			htmlstr += "<button class='dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4 a' value='서울'>";
			htmlstr += "-서울</button></li>";
			htmlstr += "<li>";
			htmlstr += "<button class='dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4 a' value='경기도'>";
			htmlstr += "-경기도</button></li>";
			htmlstr += "<li>";
			htmlstr += "<button class='dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4 a' value='강원도'>";
			htmlstr += "-강원도</button></li>";
			htmlstr += "<li>";
			htmlstr += "<button class='dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4 a' value='충청도'>";
			htmlstr += "-충청도</button></li>";
			htmlstr += "<li>";
			htmlstr += "<button class='dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4 a' value='전라도'>";
			htmlstr += "-전라도</button></li>";
			htmlstr += "<li>";
			htmlstr += "<button class='dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4 a' value='경상도'>";
			htmlstr += "-경상도</button></li>";
			htmlstr += "<li>";
			htmlstr += "<button class='dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4 a' value='제주도'>";
			htmlstr += "-제주도</button></li>";
			$("#ucateA").html(htmlstr);
			acheck=1;
		}else{
			$("#ucateA").empty();
			acheck=0;
		}
	});
	$(document).on("click",".dis-block.stext-115.cl6.hov-cl1.trans-04.p-tb-8.p-lr-4.t",function(){
		aa=$(this).attr("value");
		console.log(aa);
	});
	$(document).on("click",".dis-block.stext-115.cl6.hov-cl1.trans-04.p-tb-8.p-lr-4.a",function(){
		bb=$(this).attr("value");
		console.log(bb);
	});
	
	$("#searchBtn").click(function () {
		if(aa==null&&bb==null){
			aa="";
			bb="";
		}else if(aa!=null&&bb==null){
			bb="";
		}else if(aa==null&&bb!=null){
			aa="";
		}
		var title = $("#searchtxt").val();
		$.ajax({ 
			url:"/pathlist",
			type:"post",
			data:"theme="+aa+"&area="+bb+"&title="+title,  
			success:function(gsonStr){
					console.log(gsonStr);		
					var htmlStr = "";
		 			$.map(gsonStr, function(vv, idx){
			  		htmlStr += "<div class='p-b-63'>";
			  		htmlStr += "<img src="+vv.oTmapImg+" alt='IMG-BLOG'>";
				    htmlStr += "<div class='p-t-32'>";
					htmlStr += "<h4 class='p-b-15'>";
					htmlStr += "<a href='/pathdetail?oseq="+vv.oSeq+"' class='ltext-108 cl2 hov-cl1 trans-04'>";
					htmlStr += vv.oTitle+"</a></h4>";																				
					htmlStr += "<p class='stext-117 cl6'>";
					htmlStr += vv.oContent+"</p>";
					htmlStr += "<div class='flex-w flex-sb-m p-t-18'>";
					htmlStr += "<span class='flex-w flex-m stext-111 cl2 p-r-30 m-tb-10'>";																
					htmlStr += "<span><span class='cl4'>By</span> Admin<span class='cl12 m-l-4 m-r-6'>|</span></span>";
					htmlStr += "<span>조회수 : "+vv.oSee+"<span class='cl12 m-l-4 m-r-6'>|</span></span>";
					htmlStr += "<span>"+vv.oRegdate+"</span>";
					htmlStr += "</span></div></div></div>";
						
			  	});
			  	
			  	$(".p-r-45.p-r-0-lg").empty();
			  	$(".p-r-45.p-r-0-lg").html(htmlStr);
			}
		});
	});
	
	
});
</script>
</head>
<body class="animsition">
	
	<%@ include file="/include/top.jsp" %>

	<%@ include file="/include/left.jsp" %>


	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-02.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			경로 찾기
		</h2>
	</section>	


	<!-- Content page -->
	<section class="bg0 p-t-62 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg">
						<c:forEach var="vo" items="${KEY_LIST}">
						<div class="p-b-63">
								<img src=${vo.oTmapImg} alt="IMG-BLOG">
							<div class="p-t-32">
								<h4 class="p-b-15">
									<a href="/pathdetail?oseq=${vo.oSeq}" class="ltext-108 cl2 hov-cl1 trans-04">
										${vo.oTitle}
									</a>
								</h4>

								<p class="stext-117 cl6">
									${vo.oContent}
								</p>

								<div class="flex-w flex-sb-m p-t-18">
									<span class="flex-w flex-m stext-111 cl2 p-r-30 m-tb-10">
										<span>
											<span class="cl4">By</span> Admin  
											<span class="cl12 m-l-4 m-r-6">|</span>
										</span>

										<span>
											조회수 : ${vo.oSee}  
											<span class="cl12 m-l-4 m-r-6">|</span>
										</span>

										<span>
											${vo.oRegdate}
										</span>
									</span>
								</div>
							</div>
						</div>
						</c:forEach>

						<!-- Pagination -->
						<div class="flex-l-m flex-w w-full p-t-10 m-lr--7">
							<a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">
								1
							</a>

							<a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7">
								2
							</a>
						</div>
					</div>
				</div>

				<div class="col-md-4 col-lg-3 p-b-80">
					<div class="side-menu">
						<div class="bor17 of-hidden pos-relative">
							<input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" id="searchtxt" name="search" placeholder="Search" value="">

							<button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04" id="searchBtn">
								<i class="zmdi zmdi-search"></i>
							</button>
						</div>

						<div class="p-t-55">
							<h4 class="mtext-112 cl2 p-b-33">
								Categories
							</h4>
							
							<ul>
								<li class="bor18">
									<button  class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4" id="categoryt">
										테마
									</button>
								</li>
									<ul id="ucateT">
									</ul>
								<li class="bor18">
									<button class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4" id="categorya">
										지역
									</button>
								</li>
									<ul id="ucateA">
									</ul>
							</ul>
						</div>

						<!-- <div class="p-t-50">
							<h4 class="mtext-112 cl2 p-b-27">
								Tags
							</h4>

							<div class="flex-w m-r--5">
								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Fashion
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Lifestyle
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Denim
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Streetstyle
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Crafts
								</a>
							</div>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</section>	
	
		

	<%@ include file="/include/footer.jsp" %>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>
	
	<%@ include file="/include/script.jsp" %>

</body>
</html>
<%@page import="com.oneday.place.PlaceVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>

	<title>하루이야기</title>
<%@ include file="/include/header.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=e6def2a6-fc38-4e85-bc48-e1c69869baa7"></script>
<script>
$(document).ready(function(){
	var arr = null;

	//"수정버튼" 클릭시 text로 활성화
    $(document).on("click",".reUpdate",function(){ //글쓰기 버튼  눌렀을 때 기존의 있는 내용을 불러오고 text로 활성화 된다.

    		var names = $(this).attr("name");
            arr = names.split("^^^");
            alert(arr[0] +""+arr[1]);
    		//alert("ㅅㅂ");
            //alert(arr[0] +","+arr[1]);
           //입력된 글이 들어와야한다..!!!
           //일단은 근데 seq랑 content를 제대로 가져오는건 맞으니까.  reUpdate버튼은 서블릿을 타는게 아니라서. 걍 단순히 그 값 가지고 html 그려주는거니까.
           //

           var htmlStr = "<input type='hidden' id='updateReplySeq' value='"+arr[0]+"'>";
               htmlStr += "<input type='text' name='' id='updateReplyContent' value='"+arr[1]+"'>";  
               htmlStr += "<span onClick='replyEditSubmit()' class='replyEditButton' id='replyEditButton' name=''>글쓰기</span>";   
           		
           $("#readContent"+arr[0]).empty();  //<< 여기서 해당 seq댓글을 비움.   
           $("#readContent"+arr[0]).html(htmlStr);
 
    });
	
	
    $(document).on("click",".reDel",function(){
       
       var names = $(this).attr("name");
       var ooseq = ${KEY_VO.oSeq};
<<<<<<< HEAD
=======
       var sessmSeq = ${sessionScope.SESS_SEQ};
>>>>>>> branch 'master' of https://github.com/wch0831/newoneday
 		
 		var sendData = {"rSeq":names, "oSeq":ooseq};
 		$.ajax({ 
			url:"/reviewDel",
			type:"post",
			contentType: "application/json; charset=UTF-8", 
			data:JSON.stringify(sendData),   
			success:function(gsonStr){
					console.log(gsonStr);		//[{"empno
					var htmlStr = "";
		 			$.map(gsonStr, function(vv, idx){
		 				htmlStr += "<div class='d' align='right'>"+vv.rRegdate+"</div>";
						htmlStr += "<div class='size-207'>";
						htmlStr += "<div class='flex-w flex-sb-m p-b-17'>";
						htmlStr += "<span class='mtext-107 cl2 p-r-20'><b><u>"+vv.mNick+"</u></b></span>";	
						htmlStr += "<br>";		
						
						if(sessmSeq == vv.mSeq){										
						htmlStr += "<p class='reUpDel'>";	
						htmlStr += "<span class='replyUp_span'><img src='/images/reviewUp.png'  name='"+vv.rSeq+"^^^"+vv.rContent+"'class='reUpdate' width='20' height='20'></span>";
						htmlStr += "<span class='replyDel_span'><img src='/images/reviewDel.png'  name='"+vv.rSeq+"' class='reDel' id='reDel' width='20' height='20'></span>";
						htmlStr += "</p>";	
						}			
						
						htmlStr += "</div>";
						htmlStr += "<div id='readContent"+vv.rSeq+"'>";
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
		
	//"수정 확인 버튼 " 클릭시  rseq와 rContent를 가지고 ajax태움.
     
	$(document).on("click","#replybtn",function(){	  
	  		
	  		var reply = $("#dmt").val();
	  		var ooseq = ${KEY_VO.oSeq};
	  		var sessmSeq = ${sessionScope.SESS_SEQ};
	  				  		
	  		alert(reply+" "+ooseq);
	  		var sendData = {"rContent":reply , "oSeq":ooseq, "mSeq":${sessionScope.SESS_SEQ}};
			      $.ajax({ 
						url:"/reviewServlet",
						type:"post",
						contentType: "application/json; charset=UTF-8", 
						data:JSON.stringify(sendData),   
						success:function(gsonStr){
								console.log(gsonStr);		//[{"empno
								var htmlStr = "";
					 			$.map(gsonStr, function(vv, idx){
					 				htmlStr += "<div class='d' align='right'>"+vv.rRegdate+"</div>";
									htmlStr += "<div class='size-207'>";
									htmlStr += "<div class='flex-w flex-sb-m p-b-17'>";
									htmlStr += "<span class='mtext-107 cl2 p-r-20'><b><u>"+vv.mNick+"</u></b></span>";	
									htmlStr += "<br>";		
									
									if(sessmSeq == vv.mSeq){										
									htmlStr += "<p class='reUpDel'>";	
									htmlStr += "<span class='replyUp_span'><img src='/images/reviewUp.png'  name='"+vv.rSeq+"^^^"+vv.rContent+"'class='reUpdate' width='20' height='20'></span>";
									htmlStr += "<span class='replyDel_span'><img src='/images/reviewDel.png'  name='"+vv.rSeq+"' class='reDel' id='reDel' width='20' height='20'></span>";
									htmlStr += "</p>";	
									}			
									
									htmlStr += "</div>";
									htmlStr += "<div id='readContent"+vv.rSeq+"'>";
									htmlStr += "<input type='textarea' border='0'  id='reply'  value='"+vv.rContent+"' readonly>";
									htmlStr += "<br>";
									htmlStr += "</div>";
									htmlStr += "</div>";
								
						  	});
					 			
						  	//div는 남겨두고 기존 댓글 내용만 지우기
						  	$(".replyform").empty();
						  	$(".replyform").html(htmlStr);
						  	$("#dmt").val("");
						}
			}); //end of ajax   
   		});
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
	  
	  
/* });  */   

function replyEditSubmit() { 
	
	

	var sessmSeq = ${sessionScope.SESS_SEQ};
	var rseq = $("#updateReplySeq").val();
	var rcontent = $("#updateReplyContent").val();
	var ooseq = ${KEY_VO.oSeq};
	var sendData = {"rSeq":rseq, "rContent":rcontent, "oSeq":ooseq}; 
	
	alert(rseq+""+rcontent+""+ooseq);
	
	 $.ajax({ 
		url:"/reviewUpdate",
		type:"post",
		contentType: "application/json; charset=UTF-8", 
		data:JSON.stringify(sendData),   
		success:function(gsonStr){
				console.log(gsonStr);		//[{"empno
				var htmlStr = "";
	 			$.map(gsonStr, function(vv, idx){		 				
	 			htmlStr += "<div class='d' align='right'>"+vv.rRegdate+"</div>";
				htmlStr += "<div class='size-207'>";
				htmlStr += "<div class='flex-w flex-sb-m p-b-17'>";
				htmlStr += "<span class='mtext-107 cl2 p-r-20'><b><u>"+vv.mNick+"</u></b></span>";	
				htmlStr += "<br>";		
				
				if(sessmSeq == vv.mSeq){										
				htmlStr += "<p class='reUpDel'>";	
				htmlStr += "<span class='replyUp_span'><img src='/images/reviewUp.png'  name='"+vv.rSeq+"^^^"+vv.rContent+"'class='reUpdate' width='20' height='20'></span>";
				htmlStr += "<span class='replyDel_span'><img src='/images/reviewDel.png'  name='"+vv.rSeq+"' class='reDel' id='reDel' width='20' height='20'></span>";
				htmlStr += "</p>";	
				}			
				
				htmlStr += "</div>";
				htmlStr += "<div id='readContent"+vv.rSeq+"'>";
				htmlStr += "<input type='textarea' border='0'  id='reply'  value='"+vv.rContent+"' readonly>";
				htmlStr += "<br>";
				htmlStr += "</div>";
				htmlStr += "</div>";
				
		  	});
	 			
		  	//div는 남겨두고 기존 댓글 내용만 지우기
		  	$(".replyform").empty();
		  	$(".replyform").html(htmlStr);
		  	$("#dmt").val("");
		}
	}); //end of ajax   
	   	
};	
</script>
<!-- <script>
// 페이지가 로딩이 된 후 호출하는 함수입니다.
var map,marker,markerLayer;
// 페이지가 로딩이 된 후 호출하는 함수입니다.
function initTmap(){
	// map 생성
	// Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
	map = new Tmap.Map({div:'map_div', // map을 표시해줄 div
						width:'100%',  // map의 width 설정
						height:'400px' // map의 height 설정
						}); 
	markerLayer = new Tmap.Layer.Markers();//마커 레이어 생성
	map.addLayer(markerLayer);//map에 마커 레이어 추가
	
	var arr = [];
	var sizenum = $("#listsize").val();
	console.log(sizenum);
		for (var i = 0; i< sizenum; i++){
			console.log($("#lng"+i).val()+ "," +$("#lat"+i).val());
			
			arr.push({lonlat: new Tmap.LonLat($("#lng"+i).val(), $("#lat"+i).val()).transform("EPSG:4326", "EPSG:3857")});
		}
	console.log(arr[0].lonlat); 
	
	var size = new Tmap.Size(24, 38);//아이콘 크기
	var offset = new Tmap.Pixel(-(size.w / 2), -(size.h));//아이콘 중심점
	 
	for (var i = 0; i< arr.length; i++){//for문을 통하여 배열 안에 있는 값을 마커 생성
		var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_a.png',size, offset);//아이콘 설정
		var lonlat = arr[i].lonlat;//좌표값
		marker = new Tmap.Marker(lonlat, icon);//마커 생성
		markerLayer.addMarker(marker); //마커 레이어에 마커 추가
	}
}  

// 맵 생성 실행
$(document).ready(function(){
initTmap();	
});
 
</script> -->

<script>		
var map,markerLayer;
	// map 생성
	// Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.	
function initTmap(){
	map = new Tmap.Map({
		div : 'map_div', // map을 표시해줄 div
		width : "100%", // map의 width 설정
		height : "400px", // map의 height 설정
	});
	map.setCenter(new Tmap.LonLat("127.11708936507124", "37.409926348495006").transform("EPSG:4326", "EPSG:3857"), 14);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 즁심점으로 설정합니다.
	
	var routeLayer = new Tmap.Layer.Vector("route");// 백터 레이어 생성
	var markerLayer = new Tmap.Layer.Markers("point");//마커 레이어 생성
	var markerWaypointLayer = new Tmap.Layer.Markers("waypoint");// 마커 레이어 생성
	
	map.addLayer(routeLayer);//맵에 레이어 추가
	map.addLayer(markerLayer);//map에 마커 레이어 추가
	map.addLayer(markerWaypointLayer);//map에 마커 레이어 추가
	var arr = [];
	var sizenum = $("#listsize").val();
	console.log(sizenum);
		for (var i = 0; i< sizenum; i++){
			console.log($("#lng"+i).val()+ "," +$("#lat"+i).val());
			arr.push({lonlat: new Tmap.LonLat($("#lng"+i).val(), $("#lat"+i).val()).transform("EPSG:4326", "EPSG:3857")});
		}
	// 시작
	var size = new Tmap.Size(24, 38);//아이콘 크기 설정
	var offset = new Tmap.Pixel(-(size.w / 2), -size.h);//아이콘 중심점 설정
	var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png />', size, offset);//마커 아이콘 설정
	var marker_s = new Tmap.Marker(arr[0].lonlat, icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
	markerLayer.addMarker(marker_s);//마커 레이어에 마커 추가
	
	// 도착
	var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png />', size, offset);
	var marker_e = new Tmap.Marker(arr[sizenum-1].lonlat, icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
	markerLayer.addMarker(marker_e);//마커 레이어에 마커 추가
	
	// 경유지 심볼 찍기
	var size = new Tmap.Size(24, 38);//아이콘 크기 설정
	var offset = new Tmap.Pixel(-(size.w / 2), -size.h);//아이콘 중심점 설정
	
	for (var i = 1; i< arr.length-1; i++){
	var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png />', size, offset);
	var marker = new Tmap.Marker(arr[i].lonlat, icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
	markerWaypointLayer.addMarker(marker);//마커 레이어에 마커 추가
	}
	
	
	var startlng = $("#lng0").val();
	var startlat = $("#lat0").val();
	var endlng = $("#lng"+(sizenum-1)).val();
	var endlat = $("#lat"+(sizenum-1)).val();
	var point = [];
	for(var i=1;i<sizenum-1;i++){
		point.push({
			 "viaPointId" : "test0"+i,//경유지 id
			 "viaPointName" : "nmae0"+i,//경유지 명칭
			  //경유지의 위경도 좌표입니다.
			 "viaX" : $("#lng"+i).val() ,
			 "viaY" : $("#lat"+i).val() 
		 })
	}
	
	
	console.log(startlng+","+startlat+","+endlng+","+endlat+","+point);
	var headers = {}; 
	headers["appKey"]="e6def2a6-fc38-4e85-bc48-e1c69869baa7";//실행을 위한 키 입니다. 발급받으신 AppKey를 입력하세요.
	headers["Content-Type"]="application/json";
	$.ajax({
			method:"POST",
			headers : headers,
			url:"https://api2.sktelecom.com/tmap/routes/routeSequential30?version=1&format=xml",//다중 경유지안내 api 요청 url입니다.
			async:false,
			data:JSON.stringify({
				"startName" : "출발지", //출발지 명칭  
				//출발지 위경도 좌표입니다.
				"startX" : startlng,
				"startY" : startlat,
				"startTime" : "201708081103",//출발 시간(YYYYMMDDHHMM)
				"endName" : "목적지", //목적지 명칭
				//목적지 위경도 좌표입니다.
				"endX" : endlng,
				"endY" : endlat,
				//경유지 목록 입니다. 
				//목록 전체는 대괄호[] 각각의 리스트는 중괄호{}로 묶습니다.
				"viaPoints" : point,
				"reqCoordType" : "WGS84GEO", //요청 좌표 타입
				"resCoordType" : "EPSG3857",
				"searchOption": 0//경로 탐색 옵션 입니다.
			}),
			//데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
			success:function(response){
				prtcl = response;
				// 결과 출력
				var innerHtml ="";
				var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String	
			    xmlDoc = $.parseXML( prtclString ),
			    $xml = $( xmlDoc ),
		    	$intRate = $xml.find("Document");
		    	
		    	var tDistance = "총 거리 : "+($intRate[0].getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue/1000).toFixed(1)+"km,";
		    	var tTime = " 총 시간 : "+($intRate[0].getElementsByTagName("tmap:totalTime")[0].childNodes[0].nodeValue/60).toFixed(0)+"분,";	
		    	var tFare = " 총 요금 : "+$intRate[0].getElementsByTagName("tmap:totalFare")[0].childNodes[0].nodeValue+"원,";	

		    	$("#result").text(tDistance+tTime+tFare);
				
				prtcl=new Tmap.Format.KML({extractStyles:true, extractAttributes:true}).read(prtcl);//데이터(prtcl)를 읽고, 벡터 도형(feature) 목록을 리턴합니다.
				
				routeLayer.removeAllFeatures();//레이어의 모든 도형을 지웁니다.
				
				//표준 데이터 포맷인 KML을 Read/Write 하는 클래스 입니다.
				//벡터 도형(Feature)이 추가되기 직전에 이벤트가 발생합니다.
				routeLayer.events.register("beforefeatureadded", routeLayer, onBeforeFeatureAdded);
			        function onBeforeFeatureAdded(e) {
				        	var style = {};
				        	switch (e.feature.attributes.styleUrl) {
				        	case "#pointStyle":
					        	style.externalGraphic = "http://topopen.tmap.co.kr/imgs/point.png";//렌더링 포인트에 사용될 외부 이미지 파일의 url입니다.
					        	style.graphicHeight = 16;//외부 이미지 파일의 크기 설정을 위한 픽셀 높이입니다.
					        	style.graphicOpacity = 1;//외부 이미지 파일의 투명도 (0-1)입니다.
					        	style.graphicWidth = 16;//외부 이미지 파일의 크기 설정을 위한 픽셀 폭입니다.
				        	break;
				        	default:
					        	style.strokeColor = "#ff0000";//stroke에 적용될 16진수 color
					        	style.strokeOpacity = "1";//stroke의 투명도(0~1)
					        	style.strokeWidth = "5";//stroke의 넓이(pixel 단위)
				        	};
			        	e.feature.style = style;
			        }
				
				routeLayer.addFeatures(prtcl);//레이어에 도형을 등록합니다.
				
				map.zoomToExtent(routeLayer.getDataExtent());//map의 zoom을 routeLayer의 영역에 맞게 변경합니다.	
			},
			//요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
			error:function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
$(document).ready(function(){
	initTmap();	
});
</script>
<script>	
var map,markerLayer;
// map 생성
// Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.	
function initTmap(){	
map = new Tmap.Map({
	div : 'map_div', // map을 표시해줄 div
	width : "100%",// map의 width 설정
	height : "400px",// map의 height 설정
});

var routeLayer = new Tmap.Layer.Vector("route");
map.addLayer(routeLayer);
map.setCenter(new Tmap.LonLat("127.00245938918971", "37.566777390186154").transform("EPSG:4326", "EPSG:3857"), 14);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 중심점으로 설정합니다.

	// 시작, 도착 심볼찍기
	// 시작
	var markerStartLayer = new Tmap.Layer.Markers("start");
	map.addLayer(markerStartLayer);
	
	var arr = [];
	var sizenum = $("#listsize").val();
	console.log(sizenum);
		for (var i = 0; i< sizenum; i++){
			console.log($("#lng"+i).val()+ "," +$("#lat"+i).val());
			arr.push({lonlat: new Tmap.LonLat($("#lng"+i).val(), $("#lat"+i).val()).transform("EPSG:4326", "EPSG:3857")});
		}
	
	var size = new Tmap.Size(24, 38);
	var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
	var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png' />", size, offset);
	var marker_s = new Tmap.Marker(arr[0].lonlat, icon);
	markerStartLayer.addMarker(marker_s);
	
	// 도착
	var markerEndLayer = new Tmap.Layer.Markers("end");
	map.addLayer(markerEndLayer);
	
	var size = new Tmap.Size(24, 38);
	var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
	var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png' />", size, offset);
	var marker_e = new Tmap.Marker(arr[sizenum-1].lonlat, icon);
	markerEndLayer.addMarker(marker_e);

	var startlng = $("#lng0").val();
	var startlat = $("#lat0").val();
	var endlng = $("#lng"+(sizenum-1)).val();
	var endlat = $("#lat"+(sizenum-1)).val();
	var point = [];
	for(var i=1;i<sizenum-1;i++){
		point.push({
			 "viaPointId" : "test0"+i,//경유지 id
			 "viaPointName" : "nmae0"+i,//경유지 명칭
			  //경유지의 위경도 좌표입니다.
			 "viaX" : $("#lng"+i).val() ,
			 "viaY" : $("#lat"+i).val() 
		 })
	}
	
	
var prtcl;
var headers = {}; 
headers["appKey"]="e6def2a6-fc38-4e85-bc48-e1c69869baa7";//실행을 위한 키 입니다. 발급받으신 AppKey를 입력하세요.
$.ajax({
	type:"POST",
	headers : headers,
	url:"https://api2.sktelecom.com/tmap/routes/routeOptimization30?version=1&format=xml",//경유지 최적화 api요청 url입니다.
	async:false,
	contentType: "application/json",
	data: JSON.stringify({
			  "reqCoordType": "WGS84GEO",//요청 좌표 타입입니다.
			  "resCoordType": "EPSG3857",
			  "startName": "출발",//출발지 명칭입니다.
			  "startX": startlng,//출발지 경도입니다.
			  "startY": startlat,//출발지 위도입니다.
			  "startTime": "201711121314",//출발 시작 시간입니다.
			  "endName": "도착",//도착치 명칭입니다.
			  "endX": endlng,//도착지 경도입니다.
			  "endY": endlat,//도착지 위도입니다.
			  "viaPoints" : point
	}),
	//데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
	success:function(response){
		prtcl = response;
		
		// 결과 출력
		var innerHtml ="";
		var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String	
	    xmlDoc = $.parseXML( prtclString ),
	    $xml = $( xmlDoc ),
    	$intRate = $xml.find("Document");
    	
    	var tDistance = "총 거리 : "+($intRate[0].getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue/1000).toFixed(1)+"km,";
    	var tTime = " 총 시간 : "+($intRate[0].getElementsByTagName("tmap:totalTime")[0].childNodes[0].nodeValue/60).toFixed(0)+"분,";	
    	var tFare = " 총 요금 : "+$intRate[0].getElementsByTagName("tmap:totalFare")[0].childNodes[0].nodeValue+"원";	

    	$("#result").text(tDistance+tTime+tFare);
		
		prtcl=new Tmap.Format.KML({extractStyles:true, extractAttributes:true}).read(prtcl);//데이터(prtcl)를 읽고, 벡터 도형(feature) 목록을 리턴합니다.
		var routeLayer = new Tmap.Layer.Vector("route");//레이어를 생성합니다.
		
		//벡터 도형(Feature)이 추가되기 직전에 트리거됩니다.
		routeLayer.events.register("beforefeatureadded", routeLayer, onBeforeFeatureAdded);
		        function onBeforeFeatureAdded(e) {
			        	var style = {};//스타일을 저장하기위한 변수입니다.
			        	switch (e.feature.attributes.styleUrl) {
			        	case "#pointStyle":
				        	style.externalGraphic = "http://topopen.tmap.co.kr/imgs/point.png"; //렌더링 포인트에 사용될 외부 이미지 파일의 url입니다.
				        	style.graphicHeight = 16;//외부 이미지 파일의 크기 설정을 위한 픽셀 높이입니다.
				        	style.graphicOpacity = 1;//외부 이미지 파일의 투명도 (0-1)입니다.
				        	style.graphicWidth = 16;//외부 이미지 파일의 크기 설정을 위한 픽셀 폭입니다.
			        	break;
			        	default:
				        	style.strokeColor = "#ff0000";//stroke에 적용될 16진수 color입니다.
				        	style.strokeOpacity = "1";//stroke의 투명도(0~1)입니다.
				        	style.strokeWidth = "5";//stroke의 넓이(pixel 단위)
			        	};
		        	e.feature.style = style;//도형의 스타일을 적용합니다.
		        }
		
		routeLayer.addFeatures(prtcl); //레이어에 도형을 등록합니다.
		map.addLayer(routeLayer);//맵에 레이어 추가
		
		//경유지 심볼 찍기
		var markerWaypointLayer = new Tmap.Layer.Markers("waypoint");
		map.addLayer(markerWaypointLayer);
		var size = new Tmap.Size(24, 38);
		var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
		
		for (var i = 1; i< arr.length-1; i++){
			var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png />', size, offset);
			var marker = new Tmap.Marker(arr[i].lonlat, icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
			markerWaypointLayer.addMarker(marker);//마커 레이어에 마커 추가
		}
			
		map.zoomToExtent(routeLayer.getDataExtent());//map의 zoom을 routeLayer의 영역에 맞게 변경합니다.	
	},
	//요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
	error:function(request,status,error){
		console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}
});
}
</script>
</head>
<body class="animsition">
<%@ include file="/include/top.jsp" %>	

	
<%@ include file="/include/left.jsp" %>
	
	<%
		ArrayList<PlaceVO> list = (ArrayList)request.getAttribute("KEY_PLIST");
		out.println("<input type='hidden' id='listsize' value='"+list.size()+"'>");				
	for (int i = 0; i < list.size(); i++) {
			out.println("<input type='hidden' id='lng"+i+"' value='"+list.get(i).getpLng()+"'>");
			out.println("<input type='hidden' id='lat"+i+"' value='"+list.get(i).getpLat()+"'>");
		}
	%>
	<input type="hidden" id="" value="">
	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.jsp" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="/pathlist" class="stext-109 cl8 hov-cl1 trans-04">
				Path
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
							<button class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
								지도 보기
							</button>
						</div>

						<div class="p-t-32">
							<span class="flex-w flex-m stext-111 cl2 p-b-19">
								<span>
									<span class="cl4">By</span> ${KEY_VO.mNick}  
									<span class="cl12 m-l-4 m-r-6">|</span>
								</span>
								
								<span>
									조회수 : ${KEY_VO.oSee}  
									<span class="cl12 m-l-4 m-r-6">|</span>
								</span>

								<span>
									${KEY_VO.oRegdate}
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
					<div class="replyform" id="replyformid">	
						<c:forEach var="vo" items="${KEY_LIST}">
							<div class="d" align="right">${vo.rRegdate}</div>
						<!-- <div class="wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6">
												<img src="images/avatar-01.jpg" alt="AVATAR">
						</div> -->
						<div class="size-207">
											
												<div class="flex-w flex-sb-m p-b-17">
													
													<span class="mtext-107 cl2 p-r-20">														
														<b><u>${vo.mNick}</u></b>
														
													</span>
  																										
												 	<c:if test="${sessionScope.SESS_SEQ eq vo.mSeq}">
  														 <%-- 적용 스타일 --%> 	
  														<p class="reUpDel" align="right"> 
  														 				
														<span class="replyUp_span"><img src="/images/reviewUp.png"  name="${vo.rSeq}^^^${vo.rContent}"  class="reUpdate" width="20" height="20"></span>
														<span class="replyDel_span"><img src="/images/reviewDel.png"  name="${vo.rSeq}" class="reDel" id="reDel" width="20" height="20"></span>
													   </p>
													</c:if>	
													 </span> 
																					
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
								<!-- <input type="button" class="btn" value="작성2"> -->
									
								
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>	
	
	
	<!-- Modal1 -->
	<div class="wrap-modal1 js-modal1 p-t-60 p-b-20">
		<div class="overlay-modal1 js-hide-modal1"></div>

		<div class="container">
			<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal1">
					<img src="images/icons/icon-close.png" alt="CLOSE">
				</button>
				<div id="map_div">
					
				</div>
				<p id="result"></p>
			</div>
		</div>
	</div>
		
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
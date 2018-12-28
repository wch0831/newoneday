<%@page import="com.oneday.place.PlaceVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>하루이야기</title>
<%@ include file="/include/header.jsp"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=e6def2a6-fc38-4e85-bc48-e1c69869baa7"></script>
<script>
 $(document).ready(function(){
	 placelist(); 
	 var LatLng = new Array();
	 var pSeq = new Array();
	 
	 $(document).on("click",".picture",function(){	
			LatLng.push($(this).attr("id").split("^^", 2));
			/* pSeq.push($(this).attr("name")); */
			console.log(LatLng);
	 });
	 	    
	   
	 $("#create").click(function name() {
		 initTmap(LatLng);

	 });
			
	 
	$(".stext-106.cl6.hov1.bor3.trans-04.m-r-32.m-tb-5").click(function () {
				var purpose = $(this).val();
				if(purpose=='All Place'){
					placelist();
				}
				else{
					$.ajax({ 
					url:"/PlaceMain",
					type:"post",
					data:"purpose="+purpose,
					success:function(jsonObj){
							
							var json = JSON.parse(jsonObj);
							
							var htmlStr="";
							
				 			 $.map(json, function(vv, index){
				 					htmlStr += "<div class='col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item" + vv.pPurpose + "'>";
									htmlStr +="<div class='block2'>";
									htmlStr +="<div class='block2-pic hov-img0'>";
									htmlStr +="<img src='/cdir2/"+vv.pPname+"' alt='IMG-PRODUCT' width='250px' height='200px' class='picture' name='" + vv.pSeq + "' id='" + vv.pLat + "^^" + vv.pLng + "'>";
									htmlStr +="</div>";
									htmlStr +="<div class='block2-txt flex-w flex-t p-t-14'>";
									htmlStr +="<div class='block2-txt-child1 flex-col-l'>";
									htmlStr +="<span class='stext-105 cl3'> "+vv.pTitle+" </span>";
									htmlStr +="<span class='stext-105 cl3'> "+vv.pArea+" </span>";
									htmlStr +="<span class='stext-105 cl3'> "+vv.pContent+" </span>";
									htmlStr +="<span class='stext-105 cl3'> "+vv.pCost+" </span> <br> <br>";
									htmlStr +="</div>";
									htmlStr +="</div>";
									htmlStr +="</div>";
									htmlStr +="</div>";
					  		});
				 			$("#plist").empty();
				 		  	$("#plist").html(htmlStr);					
							
					}
				});
			}

		});
});
 
 function placelist() {
	 	
		$.ajax({ 
			url:"/PlaceMain",
			type:"get",
			data:"Unknown",             // data:"purpose="+purpose,
			success:function(jsonObj){
					
					var json = JSON.parse(jsonObj);
					
					var htmlStr="";
					
		 			 $.map(json, function(vv, index){
		 					htmlStr +="<div class='col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item' name='" + vv.pSeq + "'>";
							htmlStr +="<div class='block2'>";
							htmlStr +="<div class='block2-pic hov-img0'>";
							htmlStr +="<img src='/cdir2/"+vv.pPname+"' alt='IMG-PRODUCT' width='250px' height='200px' class='picture' name='" + vv.pSeq + "' id='" + vv.pLat + "^^" + vv.pLng + "'>";
							htmlStr +="</div>";
							htmlStr +="<div class='block2-txt flex-w flex-t p-t-14'>";
							htmlStr +="<div class='block2-txt-child1 flex-col-l'>";
							htmlStr +="<span class='stext-105 cl3'> "+vv.pTitle+" </span>";
							htmlStr +="<span class='stext-105 cl3'> "+vv.pArea+" </span>";
							htmlStr +="<span class='stext-105 cl3'> "+vv.pContent+" </span>";
							htmlStr +="<span class='stext-105 cl3'> "+vv.pCost+" </span> <br> <br>";
							htmlStr +="</div>";
							htmlStr +="</div>";
							htmlStr +="</div>";
							htmlStr +="</div>";
			  		});
		 			$("#plist").empty();
		 		  	$("#plist").html(htmlStr);					
					
			}
		});
 }
 
 var map,markerLayer;
//map 생성
//Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.	
function initTmap(LatLng){	
	console.log(LatLng);
	// map 생성
	// Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.						
	map = new Tmap.Map({
		div : 'map_div', // map을 표시해줄 div
		width : "100%", // map의 width 설정
		height : "400px", // map의 height 설정
	});
	map.setCenter(new Tmap.LonLat(LatLng[0][1], LatLng[0][0]).transform("EPSG:4326", "EPSG:3857"), 14);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 즁심점으로 설정합니다.
	
	var routeLayer = new Tmap.Layer.Vector("route");// 백터 레이어 생성
	var markerLayer = new Tmap.Layer.Markers("point");//마커 레이어 생성
	var markerWaypointLayer = new Tmap.Layer.Markers("waypoint");// 마커 레이어 생성
	
	map.addLayer(routeLayer);//맵에 레이어 추가
	map.addLayer(markerLayer);//map에 마커 레이어 추가
	map.addLayer(markerWaypointLayer);//map에 마커 레이어 추가
	
	// 시작
	var size = new Tmap.Size(24, 38);//아이콘 크기 설정
	var offset = new Tmap.Pixel(-(size.w / 2), -size.h);//아이콘 중심점 설정
	var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png />', size, offset);//마커 아이콘 설정
	var marker_s = new Tmap.Marker(new Tmap.LonLat(LatLng[0][1], LatLng[0][0]).transform("EPSG:4326", "EPSG:3857"), icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
	markerLayer.addMarker(marker_s);//마커 레이어에 마커 추가
	
	// 도착
	var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png />', size, offset);
	var marker_e = new Tmap.Marker(new Tmap.LonLat(LatLng[4][1], LatLng[4][0]).transform("EPSG:4326", "EPSG:3857"), icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
	markerLayer.addMarker(marker_e);//마커 레이어에 마커 추가
	
	// 경유지 심볼 찍기
	var size = new Tmap.Size(24, 38);//아이콘 크기 설정
	var offset = new Tmap.Pixel(-(size.w / 2), -size.h);//아이콘 중심점 설정
	
	var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png />', size, offset);
	var marker = new Tmap.Marker(new Tmap.LonLat(LatLng[1][1],LatLng[1][0]).transform("EPSG:4326", "EPSG:3857"), icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
	markerWaypointLayer.addMarker(marker);//마커 레이어에 마커 추가
	
	var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png' />", size, offset);
	var marker = new Tmap.Marker(new Tmap.LonLat(LatLng[2][1],LatLng[2][0]).transform("EPSG:4326", "EPSG:3857"), icon);
	markerWaypointLayer.addMarker(marker);
	
	var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png' />", size, offset);
	var marker = new Tmap.Marker(new Tmap.LonLat(LatLng[3][1],LatLng[3][0]).transform("EPSG:4326", "EPSG:3857"), icon);
	markerWaypointLayer.addMarker(marker);
	
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
				"startX" : LatLng[0][1],
				"startY" : LatLng[0][0],
				"startTime" : "201708081103",//출발 시간(YYYYMMDDHHMM)
				"endName" : "목적지", //목적지 명칭
				//목적지 위경도 좌표입니다.
				"endX" : LatLng[4][1],
				"endY" : LatLng[4][0],
				//경유지 목록 입니다. 
				//목록 전체는 대괄호[] 각각의 리스트는 중괄호{}로 묶습니다.
				"viaPoints" : 
					[
						 {
							 "viaPointId" : "test01",//경유지 id
							 "viaPointName" : "nmae01",//경유지 명칭
							  //경유지의 위경도 좌표입니다.
							 "viaX" : LatLng[1][1] ,
							 "viaY" : LatLng[1][0] 
						 },
						 {
							 "viaPointId" : "test02",
							 "viaPointName" : "nmae02",
							 "viaX" : LatLng[2][1] ,
							 "viaY" : LatLng[2][0] 
						 },						 										
						 {
							 "viaPointId" : "test03",
							 "viaPointName" : "nmae03",
							 "viaX" : LatLng[3][1] ,
							 "viaY" : LatLng[3][0] 
						 }
						],
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
</script>
<!-- <script>	
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
				 "viaPointName" : "name0"+i,//경유지 명칭
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
		url:"https://api2.sktelecom.com/tmap/routes/routeOptimization10?version=1&format=xml",//경유지 최적화 api요청 url입니다.
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
</script> -->
<script>	

</script>
</head>
<body class="animsition">

	<%@ include file="/include/top.jsp"%>

	<%@ include file="/include/left.jsp"%>
	
<%-- 	<%
		ArrayList<PlaceVO> list = (ArrayList)request.getAttribute("KEY_MLIST");
		out.println("<input type='hidden' id='listsize' value='"+list.size()+"'>");				
	for (int i = 0; i < list.size(); i++) {
			out.println("<input type='hidden' id='lng"+i+"' value='"+list.get(i).getpLng()+"'>");
			out.println("<input type='hidden' id='lat"+i+"' value='"+list.get(i).getpLat()+"'>");
		}
	%> --%>
	
<div id="map_div">



</div>

	<!-- Product -->
	<div class="bg0 m-t-23 p-b-140">
		<div class="container">
			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
						id="all" value="All Place" data-filter="*">All Place</button>
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
						id="restaurant" value="맛집" data-filter=".맛집">맛집</button>	

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
						id="view" value="경치" data-filter=".경치">경치</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
						id="experience" value="체험" data-filter=".체험">체험</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
						id="shopping" value="쇼핑" data-filter=".쇼핑">쇼핑</button>
						
					<button type="button" id="create" value="경로 만들기" >경로 만들기</button>


				</div>

				<div class="flex-w flex-c-m m-tb-10">
					<div
						class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
						<i
							class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
						<i
							class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Filter
					</div>

				</div>

				<div class="dis-none panel-filter w-full p-t-10">
					<div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
						<div class="filter-col1 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								Area
							</div>

							<ul>
								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										서울
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										경기도
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										강원도
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04 ">
										경상도
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										충청도
									</a>
								</li>
								
								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										전라도
									</a>
								</li>
								
									
								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										제주도
									</a>
								</li>
							</ul>
						</div>

						<div class="filter-col2 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								Price
							</div>

							<ul>
								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										All
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										0 - 50,000
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										50,000 - 100,000
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										100,000 - 200,000
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										Up To 200,000
									</a>
								</li>
	
							</ul>
						</div>

						<div class="filter-col3 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								Inside or Outside?
							</div>

							<ul>
								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #222;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<a href="#" class="filter-link stext-106 trans-04">
										Inside
									</a>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #4272d7;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<a href="#" class="filter-link stext-106 trans-04 filter-link-active">
										Outside
									</a>
								</li>

							</ul>
						</div>

					</div>
				</div>
				</div>


			</div>
			<div class="row" id="plist">
			<!-- 출력되는 영역 -->
			</div>
		</div>
	</div>


	<%@ include file="/include/footer.jsp"%>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<!-- Modal1 -->
	<div class="wrap-modal1 js-modal1 p-t-60 p-b-20">
		<div class="overlay-modal1 js-hide-modal1"></div>

		<div class="container">
			<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal1">
					<img src="images/icons/icon-close.png" alt="CLOSE">
				</button>

				<div class="row">
					<div class="col-md-6 col-lg-7 p-b-30">
						<div class="p-l-25 p-r-30 p-lr-0-lg">
							<div class="wrap-slick3 flex-sb flex-w">
								<div class="wrap-slick3-dots"></div>
								<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

								<div class="slick3 gallery-lb">
									<div class="item-slick3"
										data-thumb="images/product-detail-01.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="images/product-detail-01.jpg" alt="IMG-PRODUCT">

											<a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="images/product-detail-01.jpg"> <i
												class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3"
										data-thumb="images/product-detail-02.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="images/product-detail-02.jpg" alt="IMG-PRODUCT">

											<a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="images/product-detail-02.jpg"> <i
												class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3"
										data-thumb="images/product-detail-03.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="images/product-detail-03.jpg" alt="IMG-PRODUCT">

											<a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="images/product-detail-03.jpg"> <i
												class="fa fa-expand"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-5 p-b-30">
						<div class="p-r-50 p-t-5 p-lr-0-lg">
							<h4 class="mtext-105 cl2 js-name-detail p-b-14">Lightweight
								Jacket</h4>

							<span class="mtext-106 cl2"> $58.79 </span>

							<p class="stext-102 cl3 p-t-23">Nulla eget sem vitae eros
								pharetra viverra. Nam vitae luctus ligula. Mauris consequat
								ornare feugiat.</p>

							<!--  -->
							<div class="p-t-33">
								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">Size</div>

									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<select class="js-select2" name="time">
												<option>Choose an option</option>
												<option>Size S</option>
												<option>Size M</option>
												<option>Size L</option>
												<option>Size XL</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>

								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">Color</div>

									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<select class="js-select2" name="time">
												<option>Choose an option</option>
												<option>Red</option>
												<option>Blue</option>
												<option>White</option>
												<option>Grey</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>

								<div class="flex-w flex-r-m p-b-10">
									<div class="size-204 flex-w flex-m respon6-next">
										<div class="wrap-num-product flex-w m-r-20 m-tb-10">
											<div
												class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-minus"></i>
											</div>

											<input class="mtext-104 cl3 txt-center num-product"
												type="number" name="num-product" value="1">

											<div
												class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-plus"></i>
											</div>
										</div>

										<button
											class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
											Add to cart</button>
									</div>
								</div>
							</div>

							<!--  -->
							<div class="flex-w flex-m p-l-100 p-t-40 respon7">
								<div class="flex-m bor9 p-r-10 m-r-11">
									<a href="#"
										class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100"
										data-tooltip="Add to Wishlist"> <i
										class="zmdi zmdi-favorite"></i>
									</a>
								</div>

								<a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
									data-tooltip="Facebook"> <i class="fa fa-facebook"></i>
								</a> <a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
									data-tooltip="Twitter"> <i class="fa fa-twitter"></i>
								</a> <a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
									data-tooltip="Google Plus"> <i class="fa fa-google-plus"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/include/script.jsp"%>
	<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/slick/slick.min.js"></script>
	<script src="js/slick-custom.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
	<!--===============================================================================================-->
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
	<!--===============================================================================================-->
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2, .js-addwish-detail').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});
	
	</script>

</body>
</html>
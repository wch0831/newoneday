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
$(document).ready(function(){
	initTmap();	
});
</script>
<script type="text/javascript" src="/editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<!-- <script type="text/javascript">

var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "ir1",

    sSkinURI: "/editor/SmartEditor2Skin.html",

    fCreator: "createSEditor2"

});

</script> -->
</head>
<body class="animsition">
	
	<%@ include file="/include/top.jsp" %>

	<%@ include file="/include/left.jsp" %>


	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			경로 쓰기
		</h2>
	</section>	

	<!-- Content page -->
	<section class="bg0 p-t-104 p-b-116">
		<div class="container">
			<div class="flex-w flex-tr">
				<div class="col-md-12">
					<form>
						<h4 class="mtext-105 cl2 txt-center p-b-30">
							경로 글쓰기
						</h4>

						<div class="bor8 m-b-20 how-pos4-parent">
							<input width="500" height="40" type="text" name="email" placeholder="Title을 입력하세요">
						</div>

						<div>
					        <div id="ir1">
						        <script type="text/javascript">
						        var oEditors = [];
						        nhn.husky.EZCreator.createInIFrame({
						            oAppRef: oEditors,
						            elPlaceHolder: "ir1",
						            sSkinURI: "/editor/SmartEditor2.html",
						            fCreator: "createSEditor2"
						        });
						        function submitContents(elClickedObj) {
						            // 에디터의 내용이 textarea에 적용됩니다.
						            oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
						            // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
						 
						            try {
						                elClickedObj.form.submit();
						            } catch(e) {}
						            }
						        </script>
					        </div>
							<button class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
								Submit
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>	
	
	
	<!-- Map -->
	<div id="map_div">
		
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
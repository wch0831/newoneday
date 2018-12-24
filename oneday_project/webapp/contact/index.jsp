<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<title>문의하기</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

input[type="checkbox"] {
    display:none;
}

input[type="checkbox"] + label {
    color:#666666;
}

input[type="checkbox"] + label span {
    display:inline-block;
    width:19px;
    height:19px;
    margin:-2px 10px 0 0;
    vertical-align:middle;
    background:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png) left top no-repeat;
    cursor:pointer;
}

input[type="checkbox"]:checked + label span {
    background:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png) -19px top no-repeat;
}
	</style>
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="/images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/noui/nouislider.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->

<script>
$(document).ready(function(){	
	
	$.ajax({ 	
		url:"/qus",   
		type:"get",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		data: "nothing", 
		resultType:"json",
		success:function(resObject){
			var listStr = "";
			var listStr2 = "";
			listStr += "<span class='label-input100'>아이디</span>"
			listStr2 += "<span class='label-input100'>닉네임</span>"
			$.map(resObject, function(vv, idx){
				listStr += "<input class='input100' type='text' name='email' id='email' value='" + vv.mEmail + "' readonly>";
				listStr2 += "<input class='input100' type='text' name='nickname' id='nickname' value='" + vv.mNick + "' readonly>";
			});
			$("#idemail").html(listStr);
			$("#nickname").html(listStr2);
		}
	});
	
	$("#qusBtn").click(function(){
		$("#qusForm").submit();
	});
});

</script>
</head>
<body>


	<div class="container-contact100">
		<div class="wrap-contact100">
			<form class="contact100-form validate-form" method="POST" action="/qus" id="qusForm">
				<span class="contact100-form-title">
					문의하기
				</span>
				
				
				<div class="wrap-input100 input100-select bg1">
					<span class="label-input100">문의 구분 *</span>
					<div>
						<select class="js-select2" name="service" id="service">
							<option>가입/탈퇴</option>
							<option>경로/장소</option>
							<option>정보확인/수정</option>
							<option>기타</option>
						</select>
						<div class="dropDownSelect2"></div>
					</div>
				</div>

				<div class="wrap-input100 validate-input bg1" data-validate="제목을 입력하세요">
					<span class="label-input100">제목 *</span>
					<input class="input100" type="text" name="title" placeholder="제목 입력" id="title">
				</div>

				<div class="wrap-input100 validate-input bg1 rs1-wrap-input100" id="idemail">
					<!-- 이메일 기본적으로 출력되는 영역 -->
				</div>

				<div class="wrap-input100 validate-input bg1 rs1-wrap-input100" id="nickname">
					<!-- 닉네임 기본적으로 출력되는 영역 -->
				</div>

				<div class="wrap-input100 validate-input bg0 rs1-alert-validate" data-validate = "문의 내용을 입력하세요">
					<span class="label-input100">내용</span>
					<textarea class="input100" name="message" placeholder="내용 입력" id="message"></textarea>
				</div>
				<input type="checkbox" id="c1" name="cc" />
    			<label for="c1"><span></span>비밀글로 문의하기 (본인만 확인 가능합니다.)</label>
   				<p>
	
				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn" id="qusBtn">
						<span>
							작성완료
							<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
						</span>
					</button>
				</div>

			</form>
		</div>
	</div>



<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});

		})
	</script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="vendor/noui/nouislider.min.js"></script>
	<script>
	    var filterBar = document.getElementById('filter-bar');

	    noUiSlider.create(filterBar, {
	        start: [ 1500, 3900 ],
	        connect: true,
	        range: {
	            'min': 1500,
	            'max': 7500
	        }
	    });

	    var skipValues = [
	    document.getElementById('value-lower'),
	    document.getElementById('value-upper')
	    ];

	    filterBar.noUiSlider.on('update', function( values, handle ) {
	        skipValues[handle].innerHTML = Math.round(values[handle]);
	        $('.contact100-form-range-value input[name="from-value"]').val($('#value-lower').html());
	        $('.contact100-form-range-value input[name="to-value"]').val($('#value-upper').html());
	    });
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>

</body>
</html>

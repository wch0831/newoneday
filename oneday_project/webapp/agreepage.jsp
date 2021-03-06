<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- header -->
  	<%@ include file="/include/header.jsp" %> 	
  	
  	<style>
	
   *{padding:0;margin: 0;}
    ul li{list-style: none;}
    .clearfix:after{content: "";display: block;clear: both;}
    h1{text-align: center;padding: 20px 0;}
    .f_question1>ul>li,.f_answer1>ul>li{float: left;}
    .fnq{width: 75%;line-height:300%;margin: 0 auto;}
    .f_question1{position: relative}
    .f_answer1{background: #eee;display: none;}
    .f_answer1.on{display: block;}
    .f_question1>ul>li:nth-child(1){width: 7%;text-align: center;}
    .f_answer1>ul>li:nth-child(1){width: 7%;text-align: center;}
    .f_answer1>ul>li:nth-child(2){width: 93%;}
    .f_answer1>ul>li:nth-child(3){width: 7%;text-align: center;}
    .f_answer1>ul>li:nth-child(4){width: 93%;}
    .f_answer1>ul>li:nth-child(5){width: 32%;text-align: center;}
    .f_question1>ul>li:nth-child(2){width: 20%;text-align: center;}
    .f_question1>ul>li:nth-child(3){width:35%; }
    .f_question1>ul>li:nth-child(4){width:17%;text-align: center;}
    .f_question1>ul>li:nth-child(5){width:15%; 	}
    .f_question1>ul>li:nth-child(6){width:5%; }
    .f_q_link{width: 100%;height: 100%;position:absolute;top: 0;left: 0;}
    
    #bt {position:absolute; right:245px;}
    
    
    
 @import url(https://fonts.googleapis.com/css?family=Raleway:400,500);
button.snip0059 {
  font-family: 'Raleway', Arial, sans-serif;
  border: none;
  background-color: #000000;
  border-radius: 5px;
  color: rgba(255, 255, 255, 0.7);
  cursor: pointer;
  padding: 10px 20px;
  display: inline-block;
  margin: 0px 0px;
  text-transform: uppercase;
  letter-spacing: 1px;
  font-weight: 500;
  font-size: 1em;
  outline: none;
  position: relative;
  overflow: hidden;
}
button.snip0059:before {
  content: '';
  display: block;
  border-radius: 3px;
  position: absolute;
  top: 10px;
  bottom: 10px;
  left: 50%;
  right: 50%;
  background-color: #ffffff;
  border-left: 2px solid rgba(255, 255, 255, 0.8);
  border-right: 2px solid rgba(255, 255, 255, 0.8);
  opacity: 0;
  -webkit-transition: all 0.3s;
  transition: all 0.3s;
  -webkit-transition-delay: 0.3s;
  transition-delay: 0.3s;
}
button.snip0059:hover,
button.snip0059.hover {
  color: #ffffff;
  -webkit-animation: flashText 0.5s;
  animation: flashText 0.5s;
}
button.snip0059:hover:before,
button.snip0059.hover:before {
  left: 12px;
  right: 12px;
  background-color: rgba(255, 255, 255, 0.1);
  opacity: 0.8;
}
button.snip0059:active:before {
  background-color: rgba(255, 255, 255, 0.3);
  opacity: 1;
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}
button.snip0059.blue {
  background-color: #1e5d87;
}
button.snip0059.red {
  background-color: #8e2a20;
}
button.snip0059.yellow {
  background-color: #1e5d87;
}
@-webkit-keyframes flashText {
  0% {
    color: rgba(255, 255, 255, 0.5);
  }
  50% {
    color: transparent;
  }
  100% {
    color: #fff;
  }
}
@keyframes flashText {
  0% {
    color: rgba(255, 255, 255, 0.5);
  }
  50% {
    color: transparent;
  }
  100% {
    color: #fff;
  }
}
  
</style>
    
<title>개인정보 동의페이지</title>
  	
    <script>
    
   
    $(document).ready(function(){
    	$("input[id='agree1']").prop("checked", false);
    	$("input[id='agree2']").prop("checked", false);

    	$('#enter').click(function(){
    		var agree1 = $("[id='agree1']:checked").val();
    		var agree2 = $("[id='agree2']:checked").val();
    		if(agree1 != 'y'){
    			 alert("개인정보 수집 및 활용동의를 체크해 주세요.")
                 $("#agree1").focus();
    			 return false;
    		} else if(agree2 != 'y'){
    			 alert("홈페이지 이용동의를 체크해 주세요.")
                 $("#agree2").focus();
    			 return false;
    		}			
	    		$('#regForm').submit;
    	});
    	
    });
    
    </script>
  </head>
  <body class="animsition">
  
  <!-- Header -->
	<%@ include file="/include/top.jsp" %>

	<%@ include file="/include/left.jsp" %>
	
	
	<form id="regForm" action="/user/register.jsp">


	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center"> 개인정보 동의 </h2>
	</section>	

  
  
  
  
  
  <!-- Content page -->
	<section class="bg0 p-t-104 p-b-116">
			
	<div align="center">
	<div style="width:1400px;">
	<h1>개인정보 동의</h1>
	
	
	<!-- 개인정보 -->
					<div align="center">
						<div align="left">
							<div style="width: 1400px;">
								<div>
									<table>
										<tr>
											<th><input type="checkbox" id="agree1" name="agree1" value="y"></th>
											<th>개인정보 활용 및 수집동의</th>
										</tr>
									</table>
								</div>
							</div>
						</div>
						
						
							<div align="center">
								<div class="bor8 m-b-30">
									<textarea class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25">
정보통신망법 규정에 따라 당일치기에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.

1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 당일치기 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 당일치기는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.

회원가입 시점에 당일치기가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 가입인증 휴대폰번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대폰번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소를 수집합니다.
- 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 가입인증 휴대폰번호를 필수항목으로 수집합니다. 그리고 단체 대표자명, 비밀번호 발급용 멤버 이름 및 이메일주소를 선택항목으로 수집합니다.
서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
NAVER 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.

서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다.
구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 정보통신서비스 제공자가 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 
2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환한 후에 수집하는 경우를 의미합니다.
당일치기 위치기반서비스 이용 시 수집·저장되는 위치정보의 이용 등에 대한 자세한 사항은 ‘당일치기 위치정보 이용약관’에서 규정하고 있습니다.

2. 수집한 개인정보의 이용
당일치기 및 당일치기 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.

- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
- 법령 및 당일치기 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
3. 개인정보의 파기
회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.
단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.

이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우는 아래와 같습니다.
부정가입 및 징계기록 등의 부정이용기록은 부정 가입 및 이용 방지를 위하여 수집 시점으로부터 6개월간 보관하고 파기하고 있습니다. 부정이용기록 내 개인정보는 가입인증 휴대폰 번호(만 14세 미만 회원의 경우 법정대리인 DI)가 있습니다.
결제도용, 불법할인대출(일명 '카드깡') 등 관련 법령 및 이용약관을 위반하는 당일치기페이의 부정거래기록(아이디, 이름, 휴대폰번호, 배송지 주소, IP주소, 쿠키, 기기정보)은 부정거래 방지 및 다른 선량한 이용자의 보호, 안전한 거래 환경 보장을 위하여 수집 시점으로부터 3년간 보관하고 파기합니다.
부정이용으로 징계를 받기 전에 회원 가입 및 탈퇴를 반복하며 서비스를 부정 이용하는 사례를 막기 위해 탈퇴한 이용자의 휴대전화번호를 복호화가 불가능한 일방향 암호화(해시 처리)하여 6개월간 보관합니다.

전자상거래 등에서의 소비자 보호에 관한 법률, 전자금융거래법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 당일치기는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.
- 전자상거래 등에서 소비자 보호에 관한 법률 
계약 또는 청약철회 등에 관한 기록: 5년 보관 
대금결제 및 재화 등의 공급에 관한 기록: 5년 보관 
소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관
- 전자금융거래법 
전자금융에 관한 기록: 5년 보관
- 통신비밀보호법 
로그인 기록: 3개월
				 </textarea>
								</div>
							</div>
						</div>
				


		<div align="left">
		<div style="width:1400px;">
				<table>
					<tr>
						<th><input type="checkbox" id="agree2" name="agree2" value="y"></th>
						<th>홈페이지 이용동의</th>
					</tr>
				</table>
			</div>
		</div>
		<div align="center">
			<div class="bor8 m-b-30">
				<textarea class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25">
제1조(목적) 
이 약관은 농업회사법인 주식회사 (주)당일치기가 운영하는 홈페이지(이하 "홈페이지"라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이버홈페이지과 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다. 
※ 「PC통신 등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」 


제2조(정의)
① "홈페이지"란 사업자가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버홈페이지을 운영하는 사업자의 의미로도 사용합니다. 

② "이용자"란 "홈페이지"에 접속하여 이 약관에 따라 "홈페이지"가 제공하는 서비스를 받는 회원 및 비회원을 말합니다. 

③ "회원"이라 함은 "홈페이지"에 개인정보를 제공하여 회원등록을 한 자로서 "홈페이지"의 정보를 지속적으로 제공받으며, "홈페이지"가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.

④ "비회원"이라 함은 회원에 가입하지 않고 "홈페이지"가 제공하는 서비스를 이용하는 자를 말합니다. 


제3조 (약관의 명시와 개정)
① "홈페이지"는 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 사이트의 초기 서비스화면(전면)에 게시합니다. 

② "홈페이지"는 약관의 규제 등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진 등에 관한 법률, 방문판매 등에 관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다. 

③ "홈페이지"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 홈페이지의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 

④ "홈페이지"가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 "홈페이지"에 송신하여 "홈페이지"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다. 

⑤ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 정부가 제정한 전자거래소비자보호지침 및 관계법령 또는 상관례에 따릅니다. 


제4조(서비스의 제공 및 변경)
① "홈페이지"는 다음과 같은 업무를 수행합니다.
1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
2. 구매계약이 체결된 재화 또는 용역의 배송
3. 기타 "홈페이지"가 정하는 업무

② "홈페이지"는 재화의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화·용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화·용역의 내용 및 제공일자를 명시하여 현재의 재화·용역의 내용을 게시한 곳에 그 제공일자 이전 7일부터 공지합니다. 

③ "홈페이지"가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 "홈페이지"는 이로 인하여 이용자가 입은 손해를 배상합니다. 단, "홈페이지"에 고의 또는 과실이 없는 경우에는 그러하지 아니합니다. 


제5조(서비스의 중단)
① "홈페이지"는 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다. 

② 제1항에 의한 서비스 중단의 경우에는 "홈페이지"는 제8조에 정한 방법으로 이용자에게 통지합니다. 

③ "홈페이지"는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단 "홈페이지"에 고의 또는 과실이 없는 경우에는 그러하지 아니합니다. 


제6조(회원가입)
① 이용자는 "홈페이지"가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다. 

② "홈페이지"는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다. 
1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 "홈페이지"의 회원재가입 승낙을 얻은 경우에는 예외로 한다. 
2. 등록 내용에 허위, 기재누락, 오기가 있는 경우 
3. 기타 회원으로 등록하는 것이 "홈페이지"의 기술상 현저히 지장이 있다고 판단되는 경우

③ 회원가입계약의 성립 시기는 "홈페이지"의 승낙이 회원에게 도달한 시점으로 합니다. 

④ 회원은 제15조제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 "홈페이지"에 대하여 그 변경사항을 알려야 합니다. 


제7조(회원 탈퇴 및 자격 상실 등) 
① 회원은 "홈페이지"에 언제든지 탈퇴를 요청할 수 있으며 "홈페이지"는 즉시 회원탈퇴를 처리합니다. 

② 회원이 다음 각 호의 사유에 해당하는 경우, "홈페이지"는 회원자격을 제한 및 정지시킬 수 있습니다. 
1. 가입 신청 시에 허위 내용을 등록한 경우 
2. "홈페이지"를 이용하여 구입한 재화·용역 등의 대금, 기타 "홈페이지"가용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우 
3. 다른 사람의 "홈페이지" 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우 
4. "홈페이지"를 이용하여 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우 

③ "홈페이지"가 회원 자격을 제한·정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 "홈페이지"는 회원자격을 상실시킬 수 있습니다. 

④ "홈페이지"가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 소명할 기회를 부여합니다. 


제8조(회원에 대한 통지)
① "홈페이지"가 회원에 대한 통지를 하는 경우, 회원이 "홈페이지"에 제출한 전자우편 주소로 할 수 있습니다. 

② "홈페이지"는 불특정다수 회원에 대한 통지의 경우 1주일이상 "홈페이지" 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 


제9조(구매신청)
"홈페이지"가용자는 "홈페이지"상에서 이하의 방법에 의하여 구매를 신청합니다. 
1. 성명, 비밀번호, 전화번호, 핸드폰번호, 주소, E-MAIL 입력 
2. 재화 또는 용역의 선택 
3. 결제방법의 선택 
4. 이 약관에 동의한다는 표시(예, 마우스 클릭) 


제10조 (계약의 성립) 
① "홈페이지"는 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하지 않는 한 승낙합니다. 
1. 신청 내용에 허위, 기재누락, 오기가 있는 경우 
2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우 
3. 기타 구매신청에 승낙하는 것이 "홈페이지" 기술상 현저히 지장이 있다고 판단하는 경우

② "홈페이지"의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다. 


제11조(지급방법)
홈페이지"에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각호의 하나로 할 수 있습니다. 
1. 계좌이체 
2. 신용카드결제 
3. 온라인무통장입금 
4. 전자화폐에 의한 결제 
5. 수령 시 대금지급 등 


제12조(수신확인통지·구매신청 변경 및 취소)
① "홈페이지"는 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다. 

② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있습니다. 

③ "홈페이지"는 배송 전 이용자의 구매신청 변경 및 취소 요청이 있는 때에는 지체 없이 그 요청에 따라 처리합니다. 


제13조(배송)
"홈페이지"는 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 "홈페이지"의 고의·과실로 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상합니다. 


제14조(환급, 반품 및 교환)
① "홈페이지"는 이용자가 구매 신청한 재화 또는 용역이 품절 등의 사유로 재화의 인도 또는 용역의 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고, 사전에 재화 또는 용역의 대금을 받은 경우에는 대금을 받은 날부터 3일 이내에, 그렇지 않은 경우에는 그 사유발생일로부터 3일 이내에 계약해제 및 환급절차를 취합니다. 

② 다음 각 호의 경우에는 "홈페이지"는 배송된 재화일지라도 재화를 반품 받은 다음 영업일 이내에 이용자의 요구에 따라 즉시 환급, 반품 및 교환 조치를 합니다. 다만 그 요구기한은 배송된 날로부터 20일 이내로 합니다. 
1. 배송된 재화가 주문내용과 상이하거나 "홈페이지"가 제공한 정보와 상이할 경우 
2. 배송된 재화가 파손, 손상되었거나 오염되었을 경우 
3. 재화가 광고에 표시된 배송기간보다 늦게 배송된 경우 
4. 방문판매 등에 관한 법률 제18조에 의하여 광고에 표시하여야 할 사항을 표시하지 아니한 상태에서 이용자의 청약이 이루어진 경우 


제15조(개인정보보호)
① "홈페이지"는 이용자의 정보 수집시 구매계약 이행에 필요한 최소한의 정보를 수집합니다. 
다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다. 
1. 희망ID(회원의 경우) 
2. 비밀번호(회원의 경우) 
3. 이름
4. 별명
5. E-MAIL
6. 주소 
7. 전화번호
8. 휴대번호
9. 메일링서비스
10. SMS 수신여부

② "홈페이지"가 이용자의 개인 식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다. 

③ 제공된 개인정보는 당해 이용자의 동의 없이 목적 외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 "홈페이지"가 집니다. 다만, 다음의 경우에는 예외로 합니다. 
1. 배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려주는 경우 
2. 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우 

④ "홈페이지"가 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공 받는자, 제공목적 및 제공할 정보의 내용)등 정보통신망이용촉진 등에 관한 법률 제16조제3항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다. 

⑤ 이용자는 언제든지 "홈페이지"가 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 "홈페이지"는 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 "홈페이지"는 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다. 

⑥ "홈페이지"는 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다. 

⑦ "홈페이지" 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다. 


제16조("홈페이지"의 의무)
① "홈페이지은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화·용역을 제공하는 데 최선을 다하여야 합니다. 

② "홈페이지"는 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다. 

③ "홈페이지"가 상품이나 용역에 대하여 「표시·광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시·광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다. 

④ "홈페이지"는 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다. 


제17조( 회원의 ID 및 비밀번호에 대한 의무) 
① 제15조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다. 

② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안 됩니다. 

③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 "홈페이지"에 통보하고 "홈페이지"의 안내가 있는 경우에는 그에 따라야 합니다. 


제18조(이용자의 의무)
이용자는 다음 행위를 하여서는 안 됩니다. 
1. 신청 또는 변경 시 허위내용의 등록 
2. "홈페이지"에 게시된 정보의 변경 
3. "홈페이지"가 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시 
4. "홈페이지" 기타 제3자의 저작권 등 지적재산권에 대한 침해 
5. "홈페이지" 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위 
6. 외설 또는 폭력적인 메시지·화상·음성 기타 공서양속에 반하는 정보를 홈페이지에 공개 또는 게시하는 행위 


제19조(연결"홈페이지"와 피연결"홈페이지" 간의 관계)
① 상위 "홈페이지"와 하위 "홈페이지"가 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 "홈페이지"(웹 사이트)라고 하고 후자를 피연결 "홈페이지"(웹사이트)라고 합니다. 

② 연결 "홈페이지"는 피연결 "홈페이지"가 독자적으로 제공하는 재화·용역에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결 "홈페이지"의 사이트에서 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다. 


제20조(저작권의 귀속 및 이용제한)
① "홈페이지"가 작성한 저작물에 대한 저작권 기타 지적재산권은 "홈페이지"에 귀속합니다. 

② 이용자는 "홈페이지"를 이용함으로써 얻은 정보를 "홈페이지"의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안 됩니다. 


제21조(분쟁해결)
① "홈페이지"는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치·운영합니다. 

② "홈페이지"는 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다. 

③ "홈페이지"와 이용자간에 발생한 분쟁은 전자거래기본법 제28조 및 동 시행령 제15조에 의하여 설치된 전자거래분쟁조정위원회의 조정에 따를 수 있습니다. 


제22조(재판권 및 준거법)
① "홈페이지"와 이용자간에 발생한 전자거래 분쟁에 관한 소송은 민사소송법상의 관할법원에 제기합니다. 

② "홈페이지"와 이용자간에 제기된 전자거래 소송에는 한국법을 적용합니다. 
				
				</textarea>
			</div>
	</div>
</div>

</div>

	<!-- 버튼 -->
		
				<div style="width: 1400px;">
					<div id="bt">
						<button
							class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer"
							id="enter">다음으로</button>
					</div>
				</div>
		

			<br><br>
    
 
	
	</section>
	</form>		 
		 
	<%@ include file="/include/footer.jsp" %>
		 
		 
   <!-- script -->
	<%@ include file="/include/script.jsp" %>
		
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<!-- Header -->
	<header class="header-v2">
		<!-- Header desktop -->
		<div class="container-menu-desktop trans-03">
			<div class="wrap-menu-desktop">
				<nav class="limiter-menu-desktop p-l-45">
					
					<!-- Logo desktop -->		
					<a href="index.jsp" class="logo">
						<img src="images/icons/logo-01.jpg" alt="IMG-LOGO">
					</a>

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m h-full">							
						<div class="flex-c-m h-full p-l-18 p-r-25 bor5">
							<div class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11 icon-header-noti js-show-cart" data-notify="2">
								<i class="zmdi zmdi-shopping-cart"></i>
							</div>
						</div>
							
						<div class="flex-c-m h-full p-lr-19">
							<div class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11 js-show-sidebar">
								<i class="zmdi zmdi-menu"></i>
							</div>
						</div>
					</div>
				</nav>
			</div>	
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo desktop -->		
			<a href="index.jsp" class="logo">
				<img src="images/icons/logo-01.png" alt="IMG-LOGO">
			</a>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m h-full">							
				<div class="flex-c-m h-full p-l-18 p-r-25 bor5">
					<div class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11 icon-header-noti js-show-cart" data-notify="2">
						<i class="zmdi zmdi-shopping-cart"></i>
				</div>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="main-menu-m">
				<li>
					<a href="index.jsp">Home</a>
					<span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
				</li>

				<li>
					<a href="/mypage">MyPage</a>
				</li>

				<li>
					<a href="/user/login.jsp" class="label1 rs1" data-label1="hot">Login</a>
				</li>

				<li>
					<a href="faq.jsp">Q&A</a>
				</li>
			</ul>
		</div>
	</header>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zxx">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>aranoz</title>
<link rel="icon" href="img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/all.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/themify-icons.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/magnific-popup.css">
<!-- swiper CSS -->
<link rel="stylesheet" href="css/slick.css">
<!-- style CSS -->
<link rel="stylesheet" href="css/style.css">
</head>

<body>
	<!--::header part start::-->
	<header class="main_menu home_menu">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-12">
				<nav class="navbar navbar-expand-lg navbar-light"> <a
					class="navbar-brand" href="main"> 갬성경매 </a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="menu_icon"><i class="fas fa-bars"></i></span>
				</button>

				<div class="collapse navbar-collapse main-menu-item"
					id="navbarSupportedContent">
					<ul class="navbar-nav">

						<li class="nav-item"><a class="nav-link" href="list">경매</a></li>
						
<c:if test="${user==null }">
						<li class="nav-item"><a class="nav-link" href="regist">회원가입</a></li>
						<li class="nav-item"><a class="nav-link" href="login">로그인</a></li>
						</c:if>
						
						<c:if test="${user!=null }">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="mypage"
							id="navbarDropdown_3" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> 마이갬성 </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/write"> 상품등록</a> <a
									class="dropdown-item" href="${pageContext.request.contextPath}/tobeseller">판매자등록</a> <a
									class="dropdown-item" href="checkout.html">product checkout</a>
								<a class="dropdown-item" href="cart.html">shopping cart</a> <a
									class="dropdown-item" href="confirmation.html">confirmation</a>
								<a class="dropdown-item" href="elements.html">elements</a>
							</div></li>
						




						<li class="nav-item"><a class="nav-link" href="contact.html">고객센터</a>
						</li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mypage">마이페이지</a>
							<li class="nav-item"><a class="nav-link" href="logout">로그아웃${user.id }</a>
						</li>
						</c:if>
						<c:if test="${user.position.equals('관리자') }">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="blog.html"
							id="navbarDropdown_3" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> 관리자 </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/grade"> 등급관리</a> <a
									class="dropdown-item" href="${pageContext.request.contextPath}/cashchecklist">캐쉬 승인</a> <a
									class="dropdown-item" href="checkout.html">product checkout</a>
								<a class="dropdown-item" href="cart.html">shopping cart</a> <a
									class="dropdown-item" href="confirmation.html">confirmation</a>
								<a class="dropdown-item" href="elements.html">elements</a>
							</div></li>
						</c:if>
					</ul>
				</div>
				<div class="hearer_icon d-flex">
					<a id="search_1" href="javascript:void(0)"><i class="ti-search"></i></a>
					<a href=""><i class="ti-heart"></i></a>
					<div class="dropdown cart">
						<a class="dropdown-toggle" href="#" id="navbarDropdown3"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-cart-plus"></i>
						</a>
						<!-- <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <div class="single_product">
    
                                    </div>
                                </div> -->

					</div>
				</div>
				</nav>
			</div>
		</div>
	</div>
	<div class="search_input" id="search_input_box">
		<div class="container ">
			<form class="d-flex justify-content-between search-inner">
				<input type="text" class="form-control" id="search_input"
					placeholder="Search Here">
				<button type="submit" class="btn"></button>
				<span class="ti-close" id="close_search" title="Close Search"></span>
			</form>
		</div>
	</div>
	</header>
	<!-- Header part end-->

	<!-- jquery plugins here-->
	<script src="js/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- easing js -->
	<script src="js/jquery.magnific-popup.js"></script>
	<!-- swiper js -->
	<script src="js/swiper.min.js"></script>
	<!-- swiper js -->
	<script src="js/masonry.pkgd.js"></script>
	<!-- particles js -->
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<!-- slick js -->
	<script src="js/slick.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/waypoints.min.js"></script>
	
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>
	<!-- custom js -->
	<script src="js/custom.js"></script>
</body>

</html>
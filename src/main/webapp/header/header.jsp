<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<script type="text/javascript">
	function chat() {
		window
				.open(
						'message/messagelist',
						'child',
						'toolbar=no,location=center,status=no,menubar=no,resizable=no,scrollbars=no,width=1200,height=900')
	}
</script>
<style type="text/css">
.main_menu .comment i:after {
	position: absolute;
	border-radius: 50%;
	background-color: #f13d80;
	width: 14px;
	height: 14px;
	right: -8px;
	top: -8px;
	text-align: center;
	line-height: 15px;
	font-size: 10px;
	color: #fff;
}

* {
	box-sizing: border-box;
}

/* Style the side navigation */
.sidenav {
	height: 100%;
	width: 200px;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #088804;
	overflow-x: hidden;
}

/* Side navigation links */
.sidenav a {
	color: white;
	padding: 16px;
	text-decoration: none;
	display: block;
}

/* Change color on hover */
.sidenav a:hover {
	background-color: #ddd;
	color: black;
}
</style>


<c:if test="${unreadcount!=null}">
	<c:set var="unreadcount" value="${unreadcount}" />
	<style type="text/css">
.main_menu .comment i:after {
	content: '${unreadcount}'
}
</style>




</c:if>
</head>

<body>
	<!--::header part start::-->
	<header class="main_menu home_menu">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-12">
				<nav class="navbar navbar-expand-lg navbar-light"> <a
					class="navbar-brand" href="main"> <img src="img/logo.png"
					width="100" height="50" alt="">
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="menu_icon"><i class="fas fa-bars"></i></span>
				</button>

				<div class="collapse navbar-collapse main-menu-item"
					id="navbarSupportedContent">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link"
							href="list?pageNum=1">경매</a></li>
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
									<c:if test="${user.position!=2}">
										<c:if test="${user.position!=3}">
											<a class="dropdown-item"
												href="${pageContext.request.contextPath}/write"> 상품등록</a>
										</c:if>
									</c:if>
									<c:if test="${user.position==2 }">
										<a class="dropdown-item"
											href="${pageContext.request.contextPath}/tobeseller">판매자등록</a>
									</c:if>

									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/liveview">방송보기</a>
										 <a
										class="dropdown-item"
										href="${pageContext.request.contextPath}/startlive">방송시작</a> <a
										class="dropdown-item"
										href="${pageContext.request.contextPath}/endlive">방송종료</a> <a
										class="dropdown-item" href="elements.html">elements</a>

								</div></li>

							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/mypage">마이페이지</a>
							<li class="nav-item"><a class="nav-link" href="logout">로그아웃(${user.id})</a>
							</li>
						</c:if>
					</ul>
				</div>
				<div class="hearer_icon d-flex">
					<a id="search_1" href="list?pageNum=1"><i class="ti-search"></i></a>
					<c:if test="${user!=null }">
						<div class="dropdown comment">
							<a href="#" id="navbarDropdown3" role="button"
								data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
								<i class="ti-comment" onclick="chat()"></i>
							</a>
						</div>


					<a href="mywishseller"><i class="ti-heart"></i></a>
					</c:if>
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
<c:if test="${user.position==0 }">
<div class="sidenav">
  <a href="#">관리자</a>
  <a href="memberList">회원정보</a>
  <a href="memberChart">회원통계</a>
  <a href="grade">등급관리</a>
  <a href="cashchecklist">캐쉬관리</a>
</div>
</c:if>
</body>

</html>

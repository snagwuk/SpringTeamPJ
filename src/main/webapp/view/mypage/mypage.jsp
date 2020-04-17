<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

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
<!-- nice select CSS -->
<link rel="stylesheet" href="css/nice-select.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/all.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/themify-icons.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/magnific-popup.css">
<!-- swiper CSS -->
<link rel="stylesheet" href="css/slick.css">
<link rel="stylesheet" href="css/price_rangs.css">
<!-- style CSS -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
.confirmation_part .box {
	background-color: #EFFBFB;
	padding: 30px 40px;
}
.notification {
  background-color: #555;
  color: white;
  text-decoration: none;
  padding: 15px 26px;
  position: relative;
  display: inline-block;
  border-radius: 2px;
}

.notification:hover {
  background: red;
}

.notification .badge {
  position: absolute;
  top: -10px;
  right: -10px;
  padding: 5px 10px;
  border-radius: 50%;
  background: red;
  color: white;
}
</style>


</head>

<body>

	<section class="cat_product_area section_padding">
		<div class="container">


			<div class="row">
				<div class="col-lg-3">
					<div class="left_sidebar_area">
						<aside class="left_widgets p_filter_widgets">
							<div class="l_w_title">
								<h2>Mypage</h2>
							</div>
							<br>
							<div class="widgets_inner">
								<ul class="list">
									<li><a href="${pageContext.request.contextPath}/beformodify">회원정보수정</a></li>
									<li><a href="${pageContext.request.contextPath}/myOnSale">나의판매목록</a>
										<span>(${myAuctionCount})</span></li>
									<li><a href="${pageContext.request.contextPath}/myBidding">나의구매목록</a>
										<span>(${myBidCount})</span></li>
									<li><a
										href="${pageContext.request.contextPath}/mywishseller">관심판매자상품목록</a></li>
									<li><a href="${pageContext.request.contextPath}/charge">캐시충전</a></li>
									<li><a href="${pageContext.request.contextPath}/cashlist">나의캐시이력</a></li>
									<li><a href="${pageContext.request.contextPath}/withdraw">출금신청</a></li>
									<li><a href="${pageContext.request.contextPath}/myPenalty?pagenum=1">나의패널티기록</a></li>
									<a href="#" class="notification">
									  <span>Inbox</span>
									  <span class="badge">1</span>
									</a>
								</ul>
							</div>
						</aside>
					</div>

				</div>

				<div
					class="product_top_bar d-flex justify-content-between align-items-center">

					<div class="col-lg-13">
						<section class="confirmation_part">
							<div class="container">
								<div class="row">
									<div class="col-lg-5 col-lx-2">
										<img
											src="<%=request.getContextPath()%>/uploadFile/profile.jpg"
											width="480" height="420">
									</div>
									<div class="box">
									<div class="col-lg-20 col-lx-10">
										<div class="col-lg-30">
											<div class="media contact-info">
												<span class="contact-info__icon"><i
													class="far fa-user"></i></span>
												<div class="media-body">
													<h2>${member.name}님
														<h3>
															현재
															<c:if test="${member.position==1}">
													[구매/판매가능] 상태입니다.
													</c:if>
															<c:if test="${member.position==2}">
													[구매가능] 상태입니다.
													</c:if>
															<c:if test="${member.position==3}">
													[판매자 신청 중] 상태입니다.
													</c:if>
														</h3>
													</h2>
												</div>
											</div><br><br>
											<div class="media contact-info">
												<span class="contact-info__icon"><i class="ti-tablet"></i></span>
												<div class="media-body">
													<h3>Phone</h3>
													<p>${member.phone}</p>
												</div>
											</div>
											<div class="media contact-info">
												<span class="contact-info__icon"><i class="ti-email"></i></span>
												<div class="media-body">
													<h3>Email</h3>
													<p>나중에이메일가져오기</p>
												</div>
											</div>
											<div class="media contact-info">
												<span class="contact-info__icon"><i
													class="fas fa-won-sign"></i></span>
												<div class="media-body">
													<h3>MyCash</h3>
													<p>${mycash}원</p>
												</div>
											</div>
										</div>
									</div>

								</div>
								</div>

							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</section>


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
	<script src="js/contact.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/stellar.js"></script>
	<script src="js/price_rangs.js"></script>
	<!-- custom js -->
	<script src="js/custom.js"></script>
</body>

</html>
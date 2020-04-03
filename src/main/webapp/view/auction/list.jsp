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


</head>

<body>

	<!--================Category Product Area =================-->
	<section class="cat_product_area section_padding">
		<div class="container">
		
		<c:if test="${seller!=null}">
	
	<h1>${seller}님의 상점입니다.</h1>
	<h5><a href="addmyseller">관심상점 등록하기</a></h5>
<div class="row">
				<div class="col-lg-6">
</c:if>
		
			
				<c:if test="${seller==null}">
					<div class="row">
				<div class="col-lg-3">
					<div class="left_sidebar_area">
						<aside class="left_widgets p_filter_widgets">
							<div class="l_w_title">
								<h3>카테고리</h3>
							</div>
							<div class="widgets_inner">
								<ul class="list">
									<li><a href="#">의류</a> <span>(0)</span></li>
									<li><a href="#">전자제품</a> <span>(0)</span></li>
									<li><a href="#">잡화</a> <span>(0)</span></li>
									<li><a href="#">category4</a> <span>(0)</span></li>
									<li><a href="#">category5</a> <span>(0)</span></li>
								</ul>
							</div>
						</aside>





						<aside class="left_widgets p_filter_widgets price_rangs_aside">
							<div class="l_w_title">
								<h3>가격</h3>
							</div>
							<div class="widgets_inner">
								<div class="range_item">
									<!-- <div id="slider-range"></div> -->
									<input type="text" class="js-range-slider" value="" />
									<div class="d-flex">
										<div class="price_text">
											<p>가격 :</p>
										</div>
										<div class="price_value d-flex justify-content-center">
											<input type="text" class="js-input-from" id="amount" readonly />
											<span>to</span> <input type="text" class="js-input-to"
												id="amount" readonly />
										</div>
									</div>
								</div>
							</div>
						</aside>
					</div>
					
					</c:if>
				</div>
				<div class="col-lg-9">
					<div class="row">
						<div class="col-lg-12">
							<div
								class="product_top_bar d-flex justify-content-between align-items-center">

								<div class="single_product_menu d-flex">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="search"
											aria-describedby="inputGroupPrepend">
										<div class="input-group-prepend">
											<span class="input-group-text" id="inputGroupPrepend"><i
												class="ti-search"></i></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="row align-items-center latest_product_inner">
						<c:if test="${count==0}">
							<h4>등록된 물품이 없음</h4>
						</c:if>
						<c:if test="${count!=0}">
							<c:forEach var="auction" items="${auctionList}">
								<div class="col-lg-4 col-sm-6">
									<div class="single_product_item">
										<img
											src="<%=request.getContextPath()%>/uploadFile/${auction.filename}"
											width="200" height="200">
										<div class="single_product_text">
											${auction.pname}<br /> 즉시 입찰가 : ${auction.immediateprice} <a
												href="${pageContext.request.contextPath}/content?num=${auction.num}"
												class="add_cart">+ 상품 자세히 보기<i class="ti-heart"></i></a>

										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>


						<div class="col-lg-12">
							<div class="pageination">
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">

										<c:if test="${startPage > bottomLine}">
											<li class="page-item"><a class="page-link"
												href="list?pageNum=${startPage - bottomLine}"
												aria-label="Previous"> <i class="ti-angle-double-left"></i>
											</a></li>
										</c:if>
















										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<li class="page-item"><a class="page-link"
												href="list?pageNum=${i}">${i}</a></li>

										</c:forEach>

										<c:if test="${endPage < pageCount}">
											<li class="page-item"><a class="page-link"
												href="list?pageNum=${startPage + bottomLine}"
												aria-label="Next"> <i class="ti-angle-double-right"></i>
											</a></li>
										</c:if>
									</ul>
								</nav>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Category Product Area =================-->


	<!-- product_list part end-->

	<!--::footer_part start::-->
	<footer class="footer_part">

		<div class="copyright_part">
			<div class="container">
				<div class="row">

					<div class="col-lg-4">
						<div class="footer_icon social_icon">
							<ul class="list-unstyled">
								<li><a href="#" class="single_social_icon"><i
										class="fab fa-facebook-f"></i></a></li>
								<li><a href="#" class="single_social_icon"><i
										class="fab fa-twitter"></i></a></li>
								<li><a href="#" class="single_social_icon"><i
										class="fas fa-globe"></i></a></li>
								<li><a href="#" class="single_social_icon"><i
										class="fab fa-behance"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--::footer_part end::-->

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
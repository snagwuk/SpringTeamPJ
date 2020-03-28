<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<h1>현재 최고가 : ${hprice}</h1>
<%-- <form method="post"> --%>
<form:form commandName="bid">

<input type="hidden" name="num" value="${num}">
<input type="hidden" name="id" value="aaaa"/>

<form:input path="bidprice" /><input type="submit" value = "입찰하기"/>
<br/>
<p style="color : gray;">(입찰금액단위 : ${unit})</p>
<form:errors path="bidprice"/>

<br/>

<%-- </form> --%>
</form:form>
<c:set var="sf" value="${sf}"/>

					<div class="row align-items-center latest_product_inner">
						<c:if test="${bidlist.isEmpty()}">
							<h4>입찰내역이 없습니다.</h4>
						</c:if>
						<c:if test="${!bidlist.isEmpty()}">
							
									<table class="single_product_item">
										<tr>
										<td>아이디</td><td>입찰일시</td><td>입찰금액</td>
										</tr>
							
							<c:forEach var="bidlist" items="${bidlist}">
								
											<tr>
										<td>${bidlist.id}</td><td>${sf.format(bidlist.biddate)}</td><td>${bidlist.bidprice}</td>
										</tr>
										
								
							</c:forEach>
								</table>
							
						</c:if>

</div>
	<%-- 					<div class="col-lg-12">
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


					</div>--%>	
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
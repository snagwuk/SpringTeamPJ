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
<script type="text/javascript">
	function check() {
		var already = $
		{
			already
		}
		if (already == 1) {
			alert('이미 등록된 상점입니다.')
			return false;
		}
		if (confirm("관심상점으로 추가하시겠습니까?") == true) {
			alert('관심상점으로 등록되었습니다.')
			return true;
		} else {
			return false;
		}
	}
	
	
	
</script>
<script type="text/javascript">
function chat() {
	window.open('message/messagelist?seller='+'${seller}','child','toolbar=no,location=center,status=no,menubar=no,resizable=no,scrollbars=no,width=1200,height=900')
	}
</script>

</head>

<body>

	<!--================Category Product Area =================-->
	<section class="cat_product_area section_padding">
		<div class="container">

			<c:if test="${seller!=null}">

				<h1>${seller}님의상점입니다.</h1>
				<c:if test="${seller!=user.id}">
					<h5>
						<a href="addmyseller?seller=${seller}" onclick="return check(); ">[관심상점
							등록하기]</a>
						<h5>
							<a href="#" onclick="chat()">쪽지보내기</a>
						</h5>
				</c:if>
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
										class="ti-search" onclick="searchTab()"></i></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="row align-items-center latest_product_inner" id="searchList">



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

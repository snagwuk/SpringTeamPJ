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
			<div class="row">

				<div class="col-lg-9">

					
					<a href="${pageContext.request.contextPath}/myBidding"><input type="button" value="입찰"></a>
					<a href="${pageContext.request.contextPath}/myBiddingDealing"><input type="button" value="낙찰(거래중)"></a>
					<a href="${pageContext.request.contextPath}/myBiddingComplete"><input type="button" value="낙찰(거래완료)"></a> <br>
					<a href="${pageContext.request.contextPath}/myBiddingComplete"><input type="button" value="유찰/신고/취소"></a> <br>


					<div class="row align-items-center latest_product_inner">
						<c:if test="${count==0}">
							<h4>등록된 물품이 없음</h4>
						</c:if>
						<c:if test="${count!=0}">
							<c:forEach var="myBidList" items="${myBidList}">
								<div>
									<a href="${pageContext.request.contextPath}/content?num=${myBidList.num}"><img
										src="<%=request.getContextPath()%>/uploadFile/${myBidList.filename}"
										width="200" height="200"></a>
										<div>
										상품명: ${myBidList.pname}<br />	
										<c:if test="${myBidList.pstatus eq '입찰중'}">
										입찰마감시간: ${myBidList.enddate}
										</c:if>
																				
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
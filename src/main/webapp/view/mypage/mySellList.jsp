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
	function chat() {
		window
				.open(
						'message/messagelist?',
						'child',
						'toolbar=no,location=center,status=no,menubar=no,resizable=no,scrollbars=no,width=1200,height=900')
	}
</script>


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
									<li><a href="#">회원정보수정</a></li>
									<li><a href="${pageContext.request.contextPath}/myOnSale">나의판매목록</a>
										<span>(${myAuctionCount})</span></li>
									<li><a href="${pageContext.request.contextPath}/myBidding">나의구매목록</a>
										<span>(${myBidCount})</span></li>
									<li><a
										href="${pageContext.request.contextPath}/mywishseller">관심판매자상품목록</a></li>
									<li><a href="${pageContext.request.contextPath}/charge">캐시충전</a></li>
									<li><a href="${pageContext.request.contextPath}/cashlist">나의캐시이력</a></li>
									<li><a href="${pageContext.request.contextPath}/withdraw">출금신청</a></li>
								</ul>
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

									<a href="${pageContext.request.contextPath}/myOnSale"
										class="genric-btn primary">판매중</a>&nbsp;&nbsp; <a
										href="${pageContext.request.contextPath}/myDealing"
										class="genric-btn primary">거래중</a>&nbsp;&nbsp; <a
										href="${pageContext.request.contextPath}/myEndSale"
										class="genric-btn primary">거래완료</a>&nbsp;&nbsp; <a
										href="${pageContext.request.contextPath}/myFailureSale"
										class="genric-btn primary">유찰/취소</a>

								</div>
							</div>
						</div>
					</div>


					<div class="row align-items-center latest_product_inner">

						<c:if test="${count==0}">
							<section class="cart_area padding_top">
								<div class="container">
									<div class="cart_inner">
										<div class="table-responsive">
											<table class="table">
												<tbody>
													<tr>
														<td>
															<div class="media">
																<div class="d-flex">
																	<img
																		src="<%=request.getContextPath()%>/uploadFile/none.jpg"
																		width="200" height="200">
																</div>
																<div class="media-body">
																	<p>아직 등록된 상품이 없습니다.</p>
																</div>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
							</section>
						</c:if>
						<c:if test="${count!=0}">


							<section class="cart_area padding_top">
								<div class="container">
									<div class="cart_inner">
										<div class="table-responsive">


											<table class="table">
												<c:forEach var="myAuctionList" items="${myAuctionList}">

													<tbody>
														<tr>
															<td>
																<div class="media">
																	<div class="d-flex">
																		<a
																			href="${pageContext.request.contextPath}/content?num=${myAuctionList.num}">
																			<img
																			src="<%=request.getContextPath()%>/uploadFile/${myAuctionList.filename}"
																			width="200" height="200">
																		</a>
																	</div>
																	<div class="media-body">
																		<p>${myAuctionList.pname}</p>
																	</div>
																</div>
															</td>

															<td><c:choose>
																	<c:when test="${myAuctionList.pstatus eq '입찰중'}">
																		<h5>[입찰마감시간]</h5>
																		<h5>${myAuctionList.enddate}</h5>
																	</c:when>

																	<c:otherwise>
																	<h5>[낙찰시간]</h5>
																		<h5>${myAuctionList.enddate}</h5>
																	
																	</c:otherwise>
																</c:choose></td>
														</tr>

													</tbody>
												</c:forEach>
											</table>

										</div>
									</div>
							</section>

						</c:if>



						<div class="col-lg-12">
							<div class="pageination">
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">

										<c:if test="${startPage > bottomLine}">
											<li class="page-item"><a class="page-link"
												href="${pagename}?pageNum=${startPage - bottomLine}"
												aria-label="Previous"> <i class="ti-angle-double-left"></i>
											</a></li>
										</c:if>
										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<li class="page-item"><a class="page-link"
												href="${pagename}?pageNum=${i}">${i}</a></li>

										</c:forEach>

										<c:if test="${endPage < pageCount}">
											<li class="page-item"><a class="page-link"
												href="${pagename}?pageNum=${startPage + bottomLine}"
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
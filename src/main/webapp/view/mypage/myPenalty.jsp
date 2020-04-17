<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<section class="cat_product_area section_padding"
		style="text-align: center;">
		<div class="container" style="margin-top: -5%;">
			<div class="row">
				<div class="col-lg-9">
					<div class="row align-items-center latest_product_inner">
						<div style=margin-left:30%;>
							<c:if test="${myPenaltyCount==0}">
								<section class="cart_area padding_top">
									<div class="container">
										<div class="cart_inner">
											<div class="table-responsive">
												<table class="table">
													<thead>
														<tr>
															<th scope="col">내 상태</th>
															<th scope="col">패널티 날짜</th>
															<th scope="col">패널티 사유</th>
															<th scope="col">정지기한</th>
														</tr>
													</thead>
													<tbody>


														<tr>
															<td colspan="4">
																<div class="media">
																	<div class="media-body">
																		<p>아직 나의 패널티가 없습니다.</p>
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
							<c:if test="${myPenaltyCount!=0}">
								<section class="cart_area padding_top">
									<div class="container">
										<div class="cart_inner">
											<div class="table-responsive">
												<table class="table">
													<thead>
														<tr>
															<th scope="col">내 상태</th>
															<th scope="col">패널티 날짜</th>
															<th scope="col">패널티 사유</th>
															<th scope="col">정지기한</th>
														</tr>
													</thead>
													<tbody>

														<c:forEach var="myPenaltyList" items="${myPenaltyList}">
															<tr>
																<td>
																<c:if test="${member.status==1}">
																	<h5>경매활동중지회원</h5>
																</c:if>
																<c:if test="${member.status==0}">
																	<h5>정상회원</h5>
																</c:if>
																</td>
																<td>
																	<h5>${myPenaltyList.penaltyDate}</h5>
																</td>
																<td>
																	<h5>${myPenaltyList.penaltyReason}</h5>
																</td>
																<td>

																	<h5>${fn:replace(myPenaltyList.penaltyEndDate, 'T', ' ')}</h5>
																	

																</td>
															</tr>
														</c:forEach>

													</tbody>
												</table>

											</div>
										</div>
								</section>

							</c:if>
						</div>


						<div class="col-lg-12" style=margin-left:10%;>
							<div class="pageination">
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">

										<c:if test="${startPage > bottomLine}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/${pagename}?pageNum=${startPage - bottomLine}"
												aria-label="Previous"> <i class="ti-angle-double-left"></i>
											</a></li>
										</c:if>
										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/${pagename}?pageNum=${i}">${i}</a></li>

										</c:forEach>

										<c:if test="${endPage < pageCount}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/${pagename}?pageNum=${startPage + bottomLine}"
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
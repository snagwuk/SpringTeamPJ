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
	
	function movetab(tabname) {
		  var xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
			  console.log(this.readyState+":"+this.status)
		    if (this.readyState == 4 && this.status == 200) {
		    myFunction(this);
		    }
		  };
		  xhttp.open("GET", tabname, true);
		  xhttp.send();
		}
		function myFunction(data) {
		  var i;
		  var text = data.responseText;		  
		  document.getElementById("mtab").innerHTML = text;
		}
</script>

</head>

<body>

		<div class="row align-items-center latest_product_inner" id="mtab">
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
									<c:forEach var="myBidList" items="${myBidList}">

										<tbody>
											<tr>
												<td>
													<div class="media">
														<div class="d-flex">
															<a
																href="${pageContext.request.contextPath}/content?num=${myBidList.num}">
																<img
																src="<%=request.getContextPath()%>/uploadFile/${myBidList.filename}"
																width="200" height="200">
															</a>
														</div>
														<div class="media-body">
															<p>${myBidList.pname}</p>
														</div>
													</div>
												</td>

												<td><c:choose>
														<c:when test="${myBidList.pstatus eq '입찰중'}">
															<h5>[입찰마감시간]</h5>
															<h5>${myBidList.enddate}</h5>
														</c:when>

														<c:otherwise>


															<h5>[낙찰시간]</h5>
															<h5>${myBidList.enddate}</h5>

															<c:choose>
																<c:when
																	test="${myBidList.pstatus eq '배송중' and myBidList.seller eq user.id}">

																	<td><h3>(발송완료)</h3></td>

																</c:when>
																<c:otherwise>

																	<td><h3>(${myBidList.pstatus})</h3></td>
																</c:otherwise>
															</c:choose>

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
								onclick="movetab('${pagename}?pageNum=${startPage > bottomLine}')"
							href="#"								
									aria-label="Previous"> <i class="ti-angle-double-left"></i>
								</a></li>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<li class="page-item"><a class="page-link" onclick="movetab('${pagename}?pageNum=${i}')"
									href="#">${i}</a></li>

							</c:forEach>

							<c:if test="${endPage < pageCount}">
								<li class="page-item"><a class="page-link"
								onclick="movetab('${pagename}?pageNum=${endPage < pageCount}')"
									href="#"
									aria-label="Next"> <i class="ti-angle-double-right"></i>
								</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	

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
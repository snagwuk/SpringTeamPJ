<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
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
<link rel="stylesheet" href="css/lightslider.min.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/all.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/themify-icons.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/magnific-popup.css">
<!-- style CSS -->
<link rel="stylesheet" href="css/style.css">

<script>
	//Set the date we're counting down to
	var countDownDate = new Date("${auction.enddate}").getTime();

	//Update the count down every 1 second
	var x = setInterval(function() {

		// Get today's date and time
		var now = new Date().getTime();

		// Find the distance between now and the count down date
		var distance = countDownDate - now;

		// Time calculations for days, hours, minutes and seconds
		var days = Math.floor(distance / (1000 * 60 * 60 * 24));
		var hours = Math.floor((distance % (1000 * 60 * 60 * 24))
				/ (1000 * 60 * 60));
		var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
		var seconds = Math.floor((distance % (1000 * 60)) / 1000);

		// Output the result in an element with id="demo"
		document.getElementById("demo").innerHTML = days + "일 " + hours + ": "
				+ minutes + ": " + seconds + " ";

		// If the count down is over, write some text
		if (distance < 0) {
			clearInterval(x);
			document.getElementById("demo").innerHTML = "EXPIRED";
		}
	}, 1000);
</script>

<script>
	function refundsellerCheck() {
		
		if (confirm("정말 거래 취소하시겠습니까? (패널티 1회가 부여됩니다. -패널티 3회시 7일 간 모든 활동 중지-)") == true) { //확인
			var form = document.createElement('form');
			form.setAttribute('method', 'post');
			form.setAttribute('action', 'refundseller?num=${auction.num}');
			document.charset = "utf-8";
			document.body.appendChild(form);
			form.submit();
		} else { //취소
			return false;
		}
	}
	
function refundbuyerCheck() {
		
		if (confirm("정말 거래 취소하시겠습니까? (패널티 1회가 부여됩니다. -패널티 3회시 7일 간 모든 활동 중지-)") == true) { //확인
			var form = document.createElement('form');
			form.setAttribute('method', 'post');
			form.setAttribute('action', 'refundbuyer?num=${auction.num}');
			document.charset = "utf-8";
			document.body.appendChild(form);
			form.submit();
		} else { //취소
			return false;
		}
	}
function biddingCheck() {
	
	if (confirm("낙찰을 포기하시겠습니까? (패널티 1회가 부여됩니다. -패널티 3회시 7일 간 모든 활동 중지-)") == true) { //확인
		var form = document.createElement('form');
		form.setAttribute('method', 'post');
		form.setAttribute('action', 'giveUpBidding?num=${auction.num}');
		document.charset = "utf-8";
		document.body.appendChild(form);
		form.submit();
	} else { //취소
		return false;
	}
}
function shippingCompleteCheck() {
	
	if (confirm("정말 물품을 받으셨습니까?") == true) { //확인
		var form = document.createElement('form');
		form.setAttribute('method', 'post');
		form.setAttribute('action', 'confirmShipping?num=${auction.num}');
		document.charset = "utf-8";
		document.body.appendChild(form);
		form.submit();
	} else { //취소
		return false;
	}
}
function chat() {
	window.open('message/messagelist?seller='+'${auction.seller}','child','toolbar=no,location=center,status=no,menubar=no,resizable=no,scrollbars=no,width=1200,height=900')
	}
	
</script>


<style>
.modi {
	color: #ff3368;
	background-color: white;
}

.modi:hover {
	color: white;
	background-color: #ff3368;
}
</style>
</head>

<body>


	<!--================Single Product Area =================-->
	<div class="product_image_area section_padding">
		<div class="container">
			<div class="row s_product_inner justify-content-between">
				<div class="col-lg-7 col-xl-7">
					<div class="product_slider_img" style="position: inherit;">
						<div id="vertical">
							<div data-thumb="damagoci.png">
								<img
									src="<%=request.getContextPath()%>/uploadFile/${auction.filename}" />
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-5 col-xl-4">
					<div class="s_product_text">

						<h3>${auction.pname}</h3>

						<c:choose>
							<c:when test="${auction.pstatus eq '입찰중'}">
								<h2>현재가: ${auction.beginsprice}</h2>
								<h2>즉시구매가: ${auction.immediateprice} 원</h2>
								<a class="active" href="#"> <span>남은시간 </span><span
									id="demo"></span></a>
								<br>
							</c:when>

							<c:when test="${auction.pstatus eq '유찰'}">
								<h2>입찰최고가: ${auction.beginsprice}</h2>
								<h4>판매자 ID: ${auction.seller}</h4>
								<h4>경매종료일시 ${auction.enddate}</h4>
							</c:when>

							<c:otherwise>
								<h2>낙찰가: ${auction.beginsprice}</h2>
								<h4>낙찰자 ID: ${auction.winid}</h4>
								<h4>판매자 ID: ${auction.seller}</h4>
								<h4>낙찰일시 ${auction.enddate}</h4>
							</c:otherwise>
						</c:choose>


						<p></p>


						<div style="margin-top: -2%;">
							<ul>
								<c:choose>

									<c:when test="${auction.seller eq user.id}">
										<li><span>판매자</span>:
											${auction.seller}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
											href="sellerstore?seller=${auction.seller}"
											class="genric-btn success medium">내 상점가기</a></li>
									</c:when>
									<c:otherwise>
										<li><span>판매자</span>:
											${auction.seller}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
											href="sellerstore?seller=${auction.seller}"
											class="genric-btn success medium">판매자 상점가기</a></li>
									</c:otherwise>
								</c:choose>



								<li><span>배송방법</span>: 택배</li>
								<li><span>상품상태</span>: ${auction.pstatus}</li>



								<li><p></p></li>




								<c:choose>
									<c:when test="${user.id eq auction.seller}">
										<c:if test="${auction.pstatus ne '입찰중'}">
											<c:choose>
												<c:when test="${auction.pstatus eq '입금전'}">
													<li style="margin-bottom: 5%;"><a
														href="#" class="btn_3" onclick="refundsellerCheck()">거래취소</a></li>
													<li style="margin-bottom: 5%;"><a
														href="shippingInfo?winid=${auction.winid}&num=${auction.num}"
														class="btn_3">낙찰자정보보기</a></li>
												</c:when>
												<c:when test="${auction.pstatus eq '입금완료'}">
													<li style="margin-bottom: 5%;"><a
														href="shippingInfo?winid=${auction.winid}&num=${auction.num}"
														class="btn_3">배송하기</a></li>
													<li style="margin-bottom: 5%;"><a
														href="#" class="btn_3" onclick="refundsellerCheck()">거래취소</a></li>
													
												</c:when>
												<c:otherwise>
												
													<c:if test="${auction.pstatus =='배송중' || auction.pstatus =='거래종료'}">
														<li style="margin-bottom: 5%;"><a
															href="shippingInfo?winid=${auction.winid}&num=${auction.num}"
															class="btn_3">낙찰자정보보기</a></li>
													</c:if>
													
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:when>

									<c:when test="${auction.pstatus eq '입찰중'}">

										<a href="pay?&num=${auction.num}" class="btn_3"
											onMouseOver="this.innerHTML='즉시구매하기'"
											onMouseOut="this.innerHTML='입찰중'">입찰중</a>
										<a href="bidding?&num=${auction.num}" class="btn_3">입찰하기</a>


									</c:when>
									<c:otherwise>
										<c:if test="${auction.pstatus eq '입금전'}">
											<a href="pay?&num=${auction.num}" class="btn_3"
												onMouseOver="this.innerHTML='결제하기'"
												onMouseOut="this.innerHTML='입금전'">입금전</a>


											<a href="#" class="btn_3" onclick="biddingCheck()">낙찰포기</a>

										</c:if>

										<c:if test="${auction.pstatus eq '입금완료'}">
										<li style="margin-bottom: 5%;">
										<a href="#" class="btn_3" onclick="refundbuyerCheck()">거래취소(환불)</a></li>	
												
										</c:if>

									</c:otherwise>
								</c:choose>







							</ul>
						</div>
						<c:if
							test="${user.id eq auction.seller and auction.pstatus eq '입찰중'}">

							<div style="margin-top: 10%;">
								<ul>
									<li><a href="modify?num=${auction.num}" class="btn_3 modi">상품수정</a>
										&nbsp;&nbsp;&nbsp;&nbsp;<a href="delete?num=${auction.num}"
										class="btn_3 modi">상품삭제</a></li>
								</ul>
							</div>
						</c:if>

						<c:if
							test="${user.id eq auction.winid and auction.pstatus eq '배송중'}">						
								<a href="#" class="btn_3" onclick="shippingCompleteCheck()">수취확인</a>							
						</c:if>


					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link active" id="home-tab"
					data-toggle="tab" href="#home" role="tab" aria-controls="home"
					aria-selected="true">상품설명</a></li>
<c:if test="${auction.seller ne user.id}">
				<li class="nav-item"><button class="nav-link" id="contact-tab"
					data-toggle="tab"  onclick = "chat()"role="tab"
					aria-controls="contact" aria-selected="false">문의하기</button></li>
</c:if>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade active show" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<p></p>
					<p>${auction.pdetail}</p>
				</div>

				<div class="tab-pane fade" id="contact" role="tabpanel"
					aria-labelledby="contact-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="comment_list">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/single-product/review-1.png" alt="" />
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<h5>12th Feb, 2017 at 05:56 pm</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
								<div class="review_item reply">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/single-product/review-2.png" alt="" />
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<h5>12th Feb, 2017 at 05:56 pm</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/single-product/review-3.png" alt="" />
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<h5>12th Feb, 2017 at 05:56 pm</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
							</div>
						</div>
						<div class="col-lg-6"></div>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!--================End Product Description Area =================-->

	<!-- product_list part start-->

	<!-- product_list part end-->

	<!--::footer_part start::-->


	<!--::footer_part end::-->

	<!-- jquery plugins here-->
	<!-- jquery -->
	<script src="js/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- easing js -->
	<script src="js/jquery.magnific-popup.js"></script>
	<!-- swiper js -->
	<script src="js/lightslider.min.js"></script>
	<!-- swiper js -->
	<script src="js/masonry.pkgd.js"></script>
	<!-- particles js -->
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<!-- slick js -->
	<script src="js/slick.min.js"></script>
	<script src="js/swiper.jquery.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/contact.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/stellar.js"></script>
	<!-- custom js -->
	<script src="js/theme.js"></script>
	<script src="js/custom.js"></script>
</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script>
	var img = document.querySelector('img');
	var url = "ws://211.63.89.86:9080/SpringTeamPJ/wsServer";


	var socket = new WebSocket(url);
	var img = document.querySelector('img');

	socket.onopen = onOpen;
	socket.onmessage = onMessage;
	function onOpen(event) {
		alert("ok");
	}
	function onMessage(event) {
		img = document.getElementById("img");
		img.src = window.URL.createObjectURL(event.data);
	}
//Time
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
<head>
<style>
.notbold{
    font-weight:normal
}​
</style>
<meta charset="utf-8">
<title>webcam streaming</title>
<link rel="stylesheet" href="css/style.css" />
</head>
<body>
	<div class="product_image_area section_padding">
		<div class="container">
			<div class="row s_product_inner justify-content-between">
				<div class="col-lg-7 col-xl-7">
					<div class="product_slider_img" style="position: inherit;">
						<div id="vertical">
							<h1 style="color:#FB0A07">ON AIR</h1>
							<img alt="" id="img"
								style="width: 700px; height: 400px; background-color: #000;" />
						</div>
					</div>
				</div>
				<div class="col-lg-5 col-xl-4">
					<div class="s_product_text">
					<br/><br/><br/>
					<h3><a class="active" href="#"> <span>남은시간 </span><span
									id="demo"></span></a></h3>
<p style="color: gray;">
						<h3>${auction.pname}(${auction.category})</h3>

						<c:choose>
							<c:when test="${auction.pstatus eq '입찰중'}">
								<h2>현재 최고가 : ${hprice} 원</h2>
								<div class="single_product_text">
								<br/> <h5>즉시 구매가 : ${auction.immediateprice}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								<a href="pay?&num=${auction.num}" class="btn_3">즉시구매하기</a></h5>

							</div>

							</c:when>
						</c:choose>
					<p style="color: gray;">

					<form action="bidding" method="POST">

						<input type="hidden" name="num" value="${auction.num}"> <input
							type="hidden" name="id" value="${user.id}" /> <input
							type="hidden" name="next" value="live" /> <input type="text"
							name="bidprice" value="${hprice+auction.bidunit}"/> &nbsp&nbsp&nbsp<input type="submit" class="btn_3" value="입찰하기" /> <br />
						(입찰금액단위 : ${auction.bidunit})</p>
					</form>


					<div class="single_product_text">
					<a href="${pageContext.request.contextPath}/content?num=${auction.num}"
										class="add_cart">+ 상품 자세히 보기<i class="ti-heart"></i></a>
					</div>
				</div>



			</div>

		</div>
	</div>
		<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link active" id="home-tab"
					data-toggle="tab" href="#home" role="tab" aria-controls="home"
					aria-selected="true">상품설명</a></li>

				<li class="nav-item"><a class="nav-link" id="contact-tab"
					data-toggle="tab" href="#contact" role="tab"
					aria-controls="contact" aria-selected="false">문의하기</a></li>

			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade active show" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<p></p><img
									src="<%=request.getContextPath()%>/uploadFile/${auction.filename}"
									width="300" height="300">
					${auction.pdetail}
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
</body>
</html>

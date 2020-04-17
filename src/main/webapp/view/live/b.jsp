<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script>
	var img = document.querySelector('img');
	var url = "ws://211.63.89.92:8088/WScams/wsServer";

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
</script>
<head>
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
							<h1>Video from Server</h1>
							<img alt="" id="img"
								style="width: 400px; height: 400px; background-color: #000;" />
						</div>
					</div>
				</div>
				<h1>현재 최고가 : ${hprice}</h1>
				<div class="col-lg-4 col-sm-6">


					<div class="single_product_item">
						<a
							href="${pageContext.request.contextPath}/content?num=${auction.num}"
							class="add_cart"> <img
							src="<%=request.getContextPath()%>/uploadFile/${auction.filename}"
							width="200" height="200">
							<div class="single_product_text">
								${auction.pname}<br /> 즉시 구매가 : ${auction.immediateprice}
							</div>
						</a>
					</div>

					<form action="bidding" method="POST">

						<input type="hidden" name="num" value="${auction.num}"> <input
							type="hidden" name="id" value="${user.id}" /> <input
							type="hidden" name="next" value="live" /> <input type="text"
							name="bidprice" /> <input type="submit" value="입찰하기" /> <br />
						<p style="color: gray;">(입찰금액단위 : ${auction.bidunit})</p>
					</form>
				</div>



			</div>

		</div>
	</div>
</body>
</html>
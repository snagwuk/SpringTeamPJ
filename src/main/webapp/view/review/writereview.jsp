<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>


.star {
	display: inline-block;
	width: 30px;
	height: 60px;
	cursor: pointer;
}

.star_left {
	background: url(http://gahyun.wooga.kr/main/img/testImg/star.png)
		no-repeat 0 0;
	background-size: 60px;
	margin-right: -3px;
}

.star_right {
	background: url(http://gahyun.wooga.kr/main/img/testImg/star.png)
		no-repeat -30px 0;
	background-size: 60px;
	margin-left: -3px;
}

.star.on {
	background-image:
		url(http://gahyun.wooga.kr/main/img/testImg/star_on.png);
}

.col-lg-8 {
	flex: 0 0 66.6666667%;
	margin: 0 auto;
	max-width: 80%;
}

.col-md-8 {
	margin-top: 60px;
}

.wform {
	margin: 0 auto;
}

.single-input-parea {
	width: 60%;
	line-height: 40px;
	border: none;
	outline: none;
	background: #f9f9ff;
	padding: 0 20px;
}

.single-input-a1 {
	width: 40%;
	line-height: 40px;
	border: none;
	outline: none;
	background: #f9f9ff;
	padding: 0 20px;
}

.single-input {
	width: 70%;
	line-height: 40px;
	border: none;
	outline: none;
	background: #f9f9ff;
	padding: 0 20px;
}

li {
	list-style-type: none;
	float: left;
	outline: 1px;
	margin-left: 40px;
}
</style>
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>캐쉬 충전</title>
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
<script type="text/javascript">

$(".star").on('click',function(){
	   var idx = $(this).index();
	   $(".star").removeClass("on");
	     for(var i=0; i<=idx; i++){
	        $(".star").eq(i).addClass("on");
	   }
	 });
	 


</script>
</head>
<body>


	<div class="section-top-border">
		<div class="row">
			<div class="col-lg-8 col-md-8">
				<h3 class="mb-30">리뷰작성</h3>

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
							<h2>낙찰가 : ${auction.beginsprice}</h2>
							<ul class="list">
								<li><span>경매 번호 </span>: ${auction.num}</li>
								<li><span>카테고리 </span>: ${auction.category}</li>
								<li><span>판매자</span>: ${auction.seller}</li>
							</ul>



						</div>
					</div>
				</div>


				<form method="POST">
					<!-- <input type="hidden" name="seller" value="testadmin"> -->

					<div class="mt-10">
						작성자ID &nbsp&nbsp&nbsp <input type="text" name="id"
							onfocus="this.placeholder = ''" required
							class="single-input wform">
					</div>


					<br> <br>
					<div class="mt-10">
						물품 평점 &nbsp&nbsp <input type="text" name="productStar" required
							class="single-input-parea">
						<div class="star-box">
							<span class="star star_left"></span> <span
								class="star star_right"></span> <span class="star star_left"></span>
							<span class="star star_right"></span> <span
								class="star star_left"></span> <span class="star star_right"></span>

							<span class="star star_left"></span> <span
								class="star star_right"></span> <span class="star star_left"></span>
							<span class="star star_right"></span>
						</div>
					</div>
					<br>
					<div class="mt-10">
						배송 평점 &nbsp&nbsp <input type="text" name="deliveryStar" required
							class="single-input-parea">
					</div>
					<br>
					<div class="mt-10">
						서비스 평점 &nbsp&nbsp <input type="text" name="serviceStar" required
							class="single-input-parea">
					</div>


					<br> <br> <br> <br> <input type="submit"
						name="confirm" value="리뷰작성"> <input type="submit"
						value="Cancel">

				</form>
			</div>
		</div>
	</div>
</body>
</html>
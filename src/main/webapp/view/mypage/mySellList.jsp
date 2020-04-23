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

<style>
.confirmation_part .box {
	background-color: #EFFBFB;
	padding: 30px 40px;
}
.notification {
  background-color: #555;
  color: white;
  text-decoration: none;
  padding: 15px 26px;
  position: relative;
  display: inline-block;
  border-radius: 2px;
}

.notification:hover {
  background: red;
}

.notification .badge {
  position: absolute;
  top: -10px;
  right: -10px;
  padding: 5px 10px;
  border-radius: 50%;
  background: red;
  color: white;
}
</style>



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
									<li><a href="${pageContext.request.contextPath}/beformodify">회원정보수정</a></li>
									<li><a href="${pageContext.request.contextPath}/mySellList">나의판매목록</a>
										<span>(${myAuctionCount})</span></li>
									<li><a href="${pageContext.request.contextPath}/myPurchaseList">나의구매목록</a>
										<span>(${myBidCount})</span></li>
									<li><a
										href="${pageContext.request.contextPath}/mywishseller">관심판매자상품목록</a></li>
									<li><a href="${pageContext.request.contextPath}/charge">캐시충전</a></li>
									<li><a href="${pageContext.request.contextPath}/cashlist">나의캐시이력</a></li>
									<li><a href="${pageContext.request.contextPath}/withdraw">출금신청</a></li>
									<li><a href="${pageContext.request.contextPath}/myPenalty?pageNum=1">나의패널티기록</a></li>
									<a href="#" class="notification">
									  <span>Inbox</span>
									  <span class="badge">1</span>
									</a>
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

									<a href="#"  onclick="movetab('myOnSaleTab1')"
										class="genric-btn primary">판매중&nbsp;(${myOnSaleCount})</a>&nbsp;&nbsp; 
										<a href="#" onclick="movetab('myDealingTab2')"
										class="genric-btn primary">거래중&nbsp;(${myDealingCount})</a>									&nbsp;&nbsp; <a
										href="#" onclick="movetab('myEndSaleTab3')"
										class="genric-btn primary">거래종료&nbsp;(${myEndSaleCount})</a>&nbsp;&nbsp; <a
										href="#" onclick="movetab('myFailureSaleTab4')"
										class="genric-btn primary">유찰/거래취소&nbsp;(${myFailureSaleCount})</a>

								</div>
							</div>
						</div>
					</div>


					<div class="row align-items-center latest_product_inner"  id="mtab">



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
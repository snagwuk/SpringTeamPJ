<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zxx">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>aranaz</title>
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

<script>
	function payCheck() {	
		var myBalance = ${myBalance}
		if(myBalance < 0){
			alert("캐시를 충전해주세요")
			return false; } 
		if (confirm("정말 결제하시겠습니까??") == true) {
			var form = document.createElement('form');
			form.setAttribute('method', 'post');
			form.setAttribute('action', 'pay?&num=${myBidCompleteAuction.num}');
			document.charset = "utf-8";
			document.body.appendChild(form);
			form.submit();
		} else { //취소
			return false;
		}
	}
</script>




</head>

<body>

	<section class="cart_area padding_top">
		<div class="container">
			<div class="cart_inner">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">상품명(분류)</th>

								<c:choose>
									<c:when test="${myBidCompleteAuction.pstatus eq '입찰중'}">
										<th scope="col">즉시구매가</th>
									</c:when>
									<c:otherwise>
										<th scope="col">낙찰가</th>
									</c:otherwise>
								</c:choose>
								<th scope="col">내캐시</th>
								<th scope="col">배송방법</th>
								<th scope="col">배송비</th>
								<th scope="col">결제후잔액</th>

								<c:if test="${myBidCompleteAuction.pstatus ne '입찰중'}">
									<th scope="col">낙찰시간</th>
								</c:if>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div class="media">
										<div class="d-flex">
											<img
												src="<%=request.getContextPath()%>/uploadFile/${myBidCompleteAuction.filename}"
												width="200" height="200">
										</div>
										<div class="media-body">
											<p>${myBidCompleteAuction.pname}(${myBidCompleteAuction.category})</p>
										</div>
									</div>
								</td>
								<td><c:choose>
										<c:when test="${myBidCompleteAuction.pstatus eq '입찰중'}">
											<h5>${myBidCompleteAuction.immediateprice}</h5>
										</c:when>
										<c:otherwise>
											<h5>${myBidCompleteAuction.beginsprice}</h5>
										</c:otherwise>
									</c:choose></td>
								<td>
									<h5>${cash}원</h5>
								</td>
								<td>
									<h5>택배</h5>
								</td>
								<td>
									<h5>결제금액에포함</h5>
								</td>

								<td>
								<c:choose>
								<c:when test="${myBalance<0}">
									<h5>캐시가 부족합니다. 충전해주세요!</h5>
								</c:when>	
								<c:when test="${myBalance>0}">
									<h5>${myBalance}원</h5>
								</c:when>		
								</c:choose>	
								</td>
								<c:if test="${myBidCompleteAuction.pstatus ne '입찰중'}">
									<td>
										<h5>${myBidCompleteAuction.enddate}</h5>
									</td>
								</c:if>

							</tr>
						</tbody>
					</table>
				</div>


				<div style="margin-top: 5%; margin-left: 70%;">
					<ul>
						<li><a href="#" class="btn_3 modi" onclick="payCheck()">결제하기</a>
							&nbsp;&nbsp;&nbsp;&nbsp;
							
							<a href="charge" class="btn_3 modi">캐시충전</a></li>
					</ul>
				</div>



			</div>
		</div>
	</section>


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
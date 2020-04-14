<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

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
	function shippingCheck() {
		
		if (confirm("물품을 발송하셨습니까?") == true) { //확인
			var form = document.createElement('form');
			form.setAttribute('method', 'post');
			form.setAttribute('action', 'shippingComplete?&num=${auction.num}');
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
	<div class="product_image_area section_padding" style ="width:80%; margin:auto;">
		<div class="container">
			<div class="col-lg-6" style ="margin-left:auto; margin-right:auto; margin-top:10%;">
				<div class="review_box">
					<h4>낙찰자 배송정보</h4>
					<form class="row contact_form" action="contact_process.php"
						method="post" novalidate="novalidate">
						<div class="col-md-12">
							<div class="form-group"
								style="border: 2px solid #ffc200; text-align: center">
								<p>낙찰자 이름 : ${member.name }</p>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group"
								style="border: 2px solid #ffc200; text-align: center">
								<p>
									주소: ${member.address} <br> ${member.detailAddress} <br>
									${member.extraAddress}
								</p>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group"
								style="border: 2px solid #ffc200; text-align: center">
								<p>연락처: ${member.phone}</p>
							</div>
						</div>

						<c:if test="${auction.pstatus eq '입금완료'}">
								<div class="col-md-12 text-right">
									<a href="#" class="btn_3 modi" onclick="shippingCheck()">발송하기</a>
								</div>
						</c:if>
					</form>
				</div>
			</div>
		</div>
	</div>

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
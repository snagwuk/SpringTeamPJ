<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
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
</head>
<body>
	<div class="section-top-border">
		<div class="row">
			<div class="col-lg-8 col-md-8">
				<h3 class="mb-30">캐쉬충전</h3>
				<form method="POST">
					<!-- <input type="hidden" name="seller" value="testadmin"> -->

					<div class="mt-10">
						ID &nbsp&nbsp&nbsp <input type="text" name="id"
							value="${winid}" onfocus="this.placeholder = ''" required
							class="single-input wform">
					</div>
					
					<div class="mt-10">
						현재 금액  &nbsp&nbsp  ${mycash}
					</div>
					<br>

					<br>
					<div class="mt-10">
						금액 &nbsp&nbsp <input type="text" name="cash" required
							class="single-input-parea">
					</div>


					<br>
					<br>
					<br>
					<br> <input type="submit" name="confirm" value="충전 신청">
					<input type="submit" value="Cancel">

				</form>
			</div>
		</div>
	</div>
</body>
</html>
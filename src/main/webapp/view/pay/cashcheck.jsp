<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<h3 class="mb-30">캐쉬 요청 리스트</h3>
				<br>
				<table border="1" class="coure_table">
					<tr>
						<td>날짜</td>
						<td>ID</td>
						<td>변동 금액</td>
						<td>변동 사유</td>
						<td>승인/거절</td>
					</tr>
					<c:forEach var="cash" items="${cashchecklist}">
						<tr>
							
							<td><input type="text" readonly="readonly" name="cashdate" value="${fn:replace(cash.cashdate, 'T', ' ')}"/></td>
							<td><input type="text" readonly="readonly" name="id" value="${cash.id}"/></td>
							<td><input type="text" readonly="readonly" name="cash" value="${cash.cash}"/></td>
							<td><input type="text" readonly="readonly" name="reason" value="${cash.reason}"/></td>
							<td>
							<button type="button" onclick="location.href='${pageContext.request.contextPath}/cashcheck?cnum=${cash.cnum}&cstatus=1'">승인</button>
       						<button type="button" onclick="location.href='${pageContext.request.contextPath}/cashcheck?cnum=${cash.cnum}&cstatus=2'">거절</button>
								
							</td>
							</form>
						</tr>
					</c:forEach>

				</table>
				<%-- 
					<nav class="blog-pagination justify-content-center d-flex">
						<ul class="pagination">
							<li class="page-item"><a href="#" class="page-link"
								aria-label="Previous"> <span aria-hidden="true"> <span
										class="lnr lnr-chevron-left"></span>
								</span>
							</a></li>
							<li class="page-item"><c:forEach var="i"
									begin="${startPage}" end="${endPage}">

									<a href="list?pageNum=${i}" class="page-link">${i}</a>

								</c:forEach></li>

							<li class="page-item"><a href="#" class="page-link"
								aria-label="Next"> <span aria-hidden="true"> <span
										class="lnr lnr-chevron-right"></span>
								</span>
							</a></li>
						</ul>
					</nav>
 --%>


			</div>
		</div>
	</div>


</body>
</html>
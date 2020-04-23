<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
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
.jb-bold {  font-weight: bold;     } 
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
									<li><a href="${pageContext.request.contextPath}/myOnSale">나의판매목록</a>
										<span>(${myAuctionCount})</span></li>
									<li><a href="${pageContext.request.contextPath}/myBidding">나의구매목록</a>
										<span>(${myBidCount})</span></li>
									<li><a
										href="${pageContext.request.contextPath}/mywishseller">관심판매자상품목록</a></li>
									<li><a href="${pageContext.request.contextPath}/charge">캐시충전</a></li>
									<li><a href="${pageContext.request.contextPath}/cashlist">나의캐시이력</a></li>
									<li><a href="${pageContext.request.contextPath}/withdraw">출금신청</a></li>
									<li><a
										href="${pageContext.request.contextPath}/myPenalty?pageNum=1">나의패널티기록</a></li>
									<c:if test="${member.info==0}">
									<a href="detailInfo" class="notification">
									  <span>1,000받기!</span>
									  <span class="badge">1</span>
									</a></c:if>
								</ul>
							</div>
						</aside>
					</div>

				</div>
				 <div
					class="product_top_bar d-flex justify-content-between align-items-center">

					<div class="col-lg-13">
				<h3 class="mb-30">나의 캐쉬 내역  </h3><br>
				<div class="mt-10 jb-bold">
						현재 캐쉬 : &nbsp&nbsp  ${mycash}
					</div><br>

					<br>
				

				<c:if test="${count==0}">
					<table border="1" class="coure_table">
						<tr>
							<td align="center">캐쉬내역이 없습니다.</td>
						</tr>
					</table>
				</c:if>
				<c:if test="${count!=0}">
					<table border="1" class="coure_table">
						<tr>
							<td>날짜</td>
							<td>변동 금액</td>
							<td>변동 사유</td>
							<td>승인여부</td>
						</tr>


						<c:forEach var="cash" items="${cashlist}">
							<tr>
								<td>${fn:replace(cash.cashdate, 'T', ' ')}</td>
								<td>${cash.cash}</td>
								<td>${cash.reason}</td>
								<c:if test="${cash.cstatus == 0}">
									<td>대기</td>
								</c:if>
								<c:if test="${cash.cstatus == 1}">
									<td>승인</td>
								</c:if>
								<c:if test="${cash.cstatus == 2}">
									<td>반려</td>
								</c:if>
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
				</c:if>

			</div>
		</div>
	</div>
	</div>

	</section>

</body>
</html>
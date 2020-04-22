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
	function check() {
		var already = $
		{
			already
		}
		if (already == 1) {
			alert('이미 등록된 상점입니다.')
			return false;
		}
		if (confirm("관심상점으로 추가하시겠습니까?") == true) {
			alert('관심상점으로 등록되었습니다.')
			return true;
		} else {
			return false;
		}
	}
	
	
</script>
<script type="text/javascript">
function chat() {
	window.open('message/messagelist?seller='+'${seller}','child','toolbar=no,location=center,status=no,menubar=no,resizable=no,scrollbars=no,width=1200,height=900')
	}
</script>

</head>

<body>
			<div class="col-lg-12" id="searchList">
			<div class="row align-items-center latest_product_inner">

				<c:if test="${count==0}">
					<h4>등록된 물품이 없음</h4>
				</c:if>
				<c:if test="${count!=0}">
					<c:forEach var="auction" items="${auctionList}">
						<div class="col-lg-4 col-sm-6">
							<div class="single_product_item">
								<img
									src="<%=request.getContextPath()%>/uploadFile/${auction.filename}"
									width="200" height="200">
								<div class="single_product_text">
									${auction.pname}<br /> 즉시 입찰가 : ${auction.immediateprice} <a
										href="${pageContext.request.contextPath}/content?num=${auction.num}"
										class="add_cart">+ 상품 자세히 보기<i class="ti-heart"></i></a>

								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>


				<div class="col-lg-12">
					<div class="pageination">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">

							<c:if test="${startPage > bottomLine}">
								<li class="page-item"><a class="page-link" 
								onclick="movetab('${pagename}?pageNum=${startPage > bottomLine}')"
							href="#"								
									aria-label="Previous"> <i class="ti-angle-double-left"></i>
								</a></li>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<li class="page-item"><a class="page-link" onclick="movetab('${pagename}?pageNum=${i}')"
									href="#">${i}</a></li>

							</c:forEach>

							<c:if test="${endPage < pageCount}">
								<li class="page-item"><a class="page-link"
								onclick="movetab('${pagename}?pageNum=${endPage < pageCount}')"
									href="#"
									aria-label="Next"> <i class="ti-angle-double-right"></i>
								</a></li>
							</c:if>
						</ul>
						</nav>
					</div>
				</div>


			</div>
		</div>
		
	
	
</body>

</html>

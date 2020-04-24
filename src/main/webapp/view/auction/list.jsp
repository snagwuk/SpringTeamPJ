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
<script type="text/javascript"  src="http://code.jquery.com/jquery-1.9.0.min.js" ></script>
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
	
	function searchTab() {
		var inputValue = document.getElementById("inputGroupPrepend").value
		var query = "";
		query = "searchList?inputValue="+inputValue;
		var xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
			  console.log(this.readyState+":"+this.status)
		    if (this.readyState == 4 && this.status == 200) {
		    myFunction(this);
		    }
		  };
		 
		  xhttp.open("GET", query, true);
		  xhttp.send();
		}
	
		function myFunction(data) {
		  var i;
		  var text = data.responseText;		  
		  document.getElementById("searchList").innerHTML = text;
		}
</script>
<script type="text/javascript">
function chat() {
	window.open('message/messagelist?seller='+'${seller}','child','toolbar=no,location=center,status=no,menubar=no,resizable=no,scrollbars=no,width=1200,height=900')
	}
</script>

</head>

<body>

	<!--================Category Product Area =================-->
	<section class="cat_product_area section_padding">
		<div class="container">

			<c:if test="${pagename ne 'mywishseller'}">
<c:if test="${seller!=null}">
				<h1>${seller}님의상점입니다.</h1>
				<c:if test="${seller!=user.id}">
					<h5>
						<a href="addmyseller?seller=${seller}" onclick="return check(); ">[관심상점
							등록하기]</a>
						<h5>
							<a href="#" onclick="chat()">쪽지보내기</a>
						</h5>
				</c:if>
				<div class="left_sidebar_area">
            <aside class="left_widgets p_filter_widgets">
				<div class="row">
					<div class="col-lg-12">
					</div>
			
					</c:if>
			</c:if>


		 <c:if test="${seller==null}">
            <div class="row">

<div class="left_sidebar_area">
            <aside class="left_widgets p_filter_widgets">
                 
                
              
         <c:if test="${pagename ne 'mywishseller'}">
         
         <div class="col-lg-12">
                        <div class="l_w_title">
                           <h3>카테고리</h3>
                        </div>
                        <div class="widgets_inner">
                           <ul class="list">
                           <c:forEach var="category" items="${category}">
                           <li><a href="categorylist?cnum=${category.num}">${category.name}</a> <span>(&nbsp${category.total}&nbsp)</span></li>
                           </c:forEach>

                           </ul>
                        </div>
                     </aside>
                  </div>
                  </c:if>
         </c:if>

		<div class="col-lg-9">
			<div class="row">
				<div class="col-lg-12">
					<div
						class="product_top_bar d-flex justify-content-between align-items-center">

						<div class="single_product_menu d-flex">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="search"
									aria-describedby="inputGroupPrepend" id="inputGroupPrepend">
								<div class="input-group-prepend">
									<span class="input-group-text"><a href="#"><i
										class="ti-search" onclick="searchTab()"></i></a></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

 <c:if test="${secondcategory!=null}">
<c:forEach var="secondcategory" items="${secondcategory}">
 <button class = "btn_3" onclick="location.href='secondcategorylist?cnum=${secondcategory.num}'">${secondcategory.name}(${secondcategory.total})</button> 
</c:forEach>
</c:if> 
		
			<div class="row align-items-center latest_product_inner" id="searchList">

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
										href="${pagename}?pageNum=${startPage - bottomLine}"
										aria-label="Previous"> <i class="ti-angle-double-left"></i>
									</a></li>
								</c:if>
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<li class="page-item"><a class="page-link"
										href="${pagename}?pageNum=${i}">${i}</a></li>

								</c:forEach>

								<c:if test="${endPage < pageCount}">
									<li class="page-item"><a class="page-link"
										href="${pagename}?pageNum=${startPage + bottomLine}"
										aria-label="Next"> <i class="ti-angle-double-right"></i>
									</a></li>
								</c:if>
							</ul>
						</nav>
					</div>
				</div>


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
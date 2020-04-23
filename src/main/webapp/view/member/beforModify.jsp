<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.col-lg-8 {flex:0 0 66.6666667%; margin:0 auto; max-width:80%;}
.col-md-8 {margin-top:60px;}
.wform {margin:0 auto;}
.single-input-parea {  width:60%; line-height:40px; border:none; outline:none;
               background:#f9f9ff; padding:0 20px; }
.single-input-a1 {  width:40%; line-height:40px; border:none; outline:none;
               background:#f9f9ff; padding:0 20px; }
.single-input { width:70%; line-height:40px; border:none; outline:none;
               background:#f9f9ff; padding:0 20px; }
.jb-bold {  font-weight: bold;     } 
</style>
<meta charset="UTF-8">
<!-- Required meta tags -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>회원가입</title>
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
								</ul>
							</div>
						</aside>
					</div>

				</div>
     <div
					class="product_top_bar d-flex justify-content-between align-items-center">

					<div class="col-lg-13">
         <h3 class="mb-30">현재 비밀번호 확인</h3>
         <form action="${pageContext.request.contextPath}/beformodify" method="POST">
       
   			<br>
            <div class="mt-10 jb-bold">
               아이디 : &nbsp&nbsp&nbsp ${user.id }
            </div>
            
            <br>   
            <div class="mt-10">
               현재 비밀번호&nbsp&nbsp
               <input type="password" name="password" required class="single-input-parea">
            </div>
            <br>   
         
         
           
         <input type="hidden" name="id" value="${user.id }">
            <br><br><br><br>
            
            
            <input type="submit" name="confirm" value="확인" class="btn_3 modi">
            <input type="button" value="취소" onclick="location.href='mypage'" class="btn_3 modi">
            
         </form>
      </div>
   </div>
</div>
</div>

	</section>

</body>
</html>
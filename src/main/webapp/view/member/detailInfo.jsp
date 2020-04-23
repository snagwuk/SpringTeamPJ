<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
 <div class="product_top_bar d-flex justify-content-between align-items-center">
 <div class="col-lg-13">
         <h3 class="mb-30">설문조사</h3>
         <form action="${pageContext.request.contextPath}/detailInfo" method="POST">
         <div class="mt-10 jb-bold">
              1. 성별 <br></div>
               <input type="radio" name="gender" value="여성" required> 여성 &nbsp&nbsp
               <input type="radio" name="gender" value="남성"> 남성
            <br><br>
            <div class="mt-10 jb-bold">
              2. 가입하게된 경로 <br></div>
               <input type="radio" name="howToKnow" value="SNS" required> SNS(인스타, 페이스북 등) &nbsp&nbsp
               <input type="radio" name="howToKnow" value="친구추천"> 친구추천 &nbsp&nbsp
                <input type="radio" name="howToKnow" value="카페"> 카페 &nbsp&nbsp
               <input type="radio" name="howToKnow" value="이메일"> 이메일 광고 &nbsp&nbsp
               <input type="radio" name="howToKnow" value="기타"> 기타
               
            <input type="hidden" name="id" value="${user.id }">
            <br><br><br><br>
            <input type="submit" name="confirm" value="1000원 받기" class="btn_3 modi">
            <input type="reset" value="취소" class="btn_3 modi">
            
        </form>
 </div>
</div>				
</div></div></section>
</body>
</html>
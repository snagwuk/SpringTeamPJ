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

            <div class="col-lg-12" style="margin-top: -15%; margin-left: -30%;">


               <div class="product_image_area section_padding"
                  style="width: 80%; margin: auto;">
                  <div class="container">
                     <div class="col-lg-6"
                        style="margin-left: auto; margin-right: auto; margin-top: 10%;">
                        <div class="review_box">
                           <h4>캐시 충전</h4>
                           <form class="row contact_form" action="charge"
                              method="post" novalidate="novalidate">
                              <input type="hidden" name="id" value="${user.id}">
                              <div class="col-md-12">
                                 <div class="form-group"
                                    style="border: 2px solid #ffc200; text-align: center">
                                    <p>나의 현재 캐시 : ${mycash}</p>
                                 </div>
                              </div>
                              <div class="col-md-12">
                                 <div class="form-group"
                                    style="border: 2px solid #ffc200; text-align: center; padding-top: 10px; padding-bottom: 10px;">
                                    <p>
                                       충전할 금액 : <input type="text" name="cash" required
                                          class="single-input-parea"
                                          style="width: 100px; font-size: 15px;"> 원
                                    </p>
                                 </div>
                              </div>

                              <div class="col-md-12 text-right">
                                 <!-- <a href="#" class="btn_3 modi" onclick="cashChargeCheck()">충전하기</a> -->
                                 <input class="btn_3 modi" type="submit" value="충전하기">
                              </div> 
                           </form>
                        </div>
                     </div>
                  </div>
               </div>
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
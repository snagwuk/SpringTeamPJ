<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zxx">

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
//Set the date we're counting down to
var countDownDate = new Date("${auction.enddate}").getTime();

//Update the count down every 1 second
var x = setInterval(function() {

 // Get today's date and time
 var now = new Date().getTime();
   
 // Find the distance between now and the count down date
 var distance = countDownDate - now;
   
 // Time calculations for days, hours, minutes and seconds
 var days = Math.floor(distance / (1000 * 60 * 60 * 24));
 var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
 var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
 var seconds = Math.floor((distance % (1000 * 60)) / 1000);
   
 
 // Output the result in an element with id="demo"
 document.getElementById("demo").innerHTML = days + "일 " + hours + ": "
 + minutes + ": " + seconds + " ";
   
 // If the count down is over, write some text 
 if (distance < 0) {
   clearInterval(x);
   document.getElementById("demo").innerHTML = "EXPIRED";
 }
}, 1000);
</script>



<style>
.modi{
color : #ff3368;
background-color: white;
}

.modi:hover{
color : white;
background-color: #ff3368;
}

</style>
</head>

<body>

   <!--================Single Product Area =================-->
   <div class="product_image_area section_padding">
      <div class="container">
         <div class="row s_product_inner justify-content-between">
            <div class="col-lg-7 col-xl-7">
               <div class="product_slider_img" style="position: inherit;">
                  <div id="vertical">
                     <div data-thumb="damagoci.png">
                        <img src="<%=request.getContextPath()%>/uploadfile/${auction.filename}" />
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-lg-5 col-xl-4">
               <div class="s_product_text">

                  <h3>${auction.pname}</h3>
                  <h2>현재가 : ${auction.beginsprice}</h2>
                  <ul class="list">
                     <li><span>경매 번호 </span>: ${auction.num}</li>
                     <li><span>카테고리 </span>: ${auction.category}</li>
                     <li><a class="active" href="#"> <span>남은시간 </span><span
                           id="demo"></span></a></li>
                     <li><a href="#"> <span>즉시구매가</span>: ${auction.immediateprice} 원
                     </a></li>
                  </ul>
                  <p></p>
                  <div style="margin-top: -2%;">
                     <ul>
                        <li><span>판매자</span>: ${auction.seller}</li>
                        <li><span>배송방법</span>: 택배</li>
                        <li><span>선불</span> ${auction.deliverypay} 원</li>
                        <li><p></p></li>
                        <li style="margin-bottom: 5%;"><a href="#" class="btn_3">입찰내역보기</a></li>
                      
                     
                     </ul>
                  </div>
                  <div
                     class="card_area d-flex justify-content-between align-items-center">
                     <div class="product_count">
                        <span class="inumber-decrement"> <i class="ti-minus"></i></span>
                        <input class="input-number" type="text" value="1" min="0"
                           max="10"> <span class="number-increment"> <i
                           class="ti-plus"></i></span>
                     </div>
                     <a href="#" class="btn_3">장바구니</a> <a href="#" class="like_us">
                        <i class="ti-heart"></i>
                 
                     </a>
                     
                     
                  </div>
                         <div style="margin-top : 10%;">
                        <ul>
                          <li>

                <a href="modify?num=${auction.num}" class="btn_3 modi">상품수정</a> 
              &nbsp;&nbsp;&nbsp;&nbsp;<a href="delete?num=${auction.num}" class="btn_3 modi">상품삭제</a> 
   </li>
                        </ul></div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!--================End Single Product Area =================-->

   <!--================Product Description Area =================-->
   <section class="product_description_area">
      <div class="container">
         <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item"><a class="nav-link active" id="home-tab"
               data-toggle="tab" href="#home" role="tab" aria-controls="home"
               aria-selected="true">상품설명</a></li>
            <li class="nav-item"><a class="nav-link" id="profile-tab"
               data-toggle="tab" href="#profile" role="tab"
               aria-controls="profile" aria-selected="false">상세정보</a></li>
            <li class="nav-item"><a class="nav-link" id="contact-tab"
               data-toggle="tab" href="#contact" role="tab"
               aria-controls="contact" aria-selected="false">문의하기</a></li>

         </ul>
         <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade active show" id="home" role="tabpanel"
               aria-labelledby="home-tab">
               <p></p>
               <p>
                  ${auction.pdetail}
               </p>
            </div>
            <div class="tab-pane fade" id="profile" role="tabpanel"
               aria-labelledby="profile-tab">
               <div class="table-responsive">
                  <table class="table">
                     <tbody>
                        <tr>
                           <td>
                              <h5>Width</h5>
                           </td>
                           <td>
                              <h5>128mm</h5>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <h5>Height</h5>
                           </td>
                           <td>
                              <h5>508mm</h5>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <h5>Depth</h5>
                           </td>
                           <td>
                              <h5>85mm</h5>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <h5>Weight</h5>
                           </td>
                           <td>
                              <h5>52gm</h5>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <h5>Quality checking</h5>
                           </td>
                           <td>
                              <h5>yes</h5>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <h5>Freshness Duration</h5>
                           </td>
                           <td>
                              <h5>03days</h5>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <h5>When packeting</h5>
                           </td>
                           <td>
                              <h5>Without touch of hand</h5>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <h5>Each Box contains</h5>
                           </td>
                           <td>
                              <h5>60pcs</h5>
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </div>
            </div>
            <div class="tab-pane fade" id="contact" role="tabpanel"
               aria-labelledby="contact-tab">
               <div class="row">
                  <div class="col-lg-6">
                     <div class="comment_list">
                        <div class="review_item">
                           <div class="media">
                              <div class="d-flex">
                                 <img src="img/product/single-product/review-1.png" alt="" />
                              </div>
                              <div class="media-body">
                                 <h4>Blake Ruiz</h4>
                                 <h5>12th Feb, 2017 at 05:56 pm</h5>
                                 <a class="reply_btn" href="#">Reply</a>
                              </div>
                           </div>
                           <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                              elit, sed do eiusmod tempor incididunt ut labore et dolore
                              magna aliqua. Ut enim ad minim veniam, quis nostrud
                              exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
                        </div>
                        <div class="review_item reply">
                           <div class="media">
                              <div class="d-flex">
                                 <img src="img/product/single-product/review-2.png" alt="" />
                              </div>
                              <div class="media-body">
                                 <h4>Blake Ruiz</h4>
                                 <h5>12th Feb, 2017 at 05:56 pm</h5>
                                 <a class="reply_btn" href="#">Reply</a>
                              </div>
                           </div>
                           <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                              elit, sed do eiusmod tempor incididunt ut labore et dolore
                              magna aliqua. Ut enim ad minim veniam, quis nostrud
                              exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
                        </div>
                        <div class="review_item">
                           <div class="media">
                              <div class="d-flex">
                                 <img src="img/product/single-product/review-3.png" alt="" />
                              </div>
                              <div class="media-body">
                                 <h4>Blake Ruiz</h4>
                                 <h5>12th Feb, 2017 at 05:56 pm</h5>
                                 <a class="reply_btn" href="#">Reply</a>
                              </div>
                           </div>
                           <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                              elit, sed do eiusmod tempor incididunt ut labore et dolore
                              magna aliqua. Ut enim ad minim veniam, quis nostrud
                              exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-6"></div>
               </div>
            </div>

         </div>
      </div>
   </section>
   <!--================End Product Description Area =================-->

   <!-- product_list part start-->

   <!-- product_list part end-->

   <!--::footer_part start::-->


   <!--::footer_part end::-->

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
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
li {list-style-type:none; float:left; outline:1px; margin-left:40px;}
</style>
<meta charset="UTF-8">
<!-- Required meta tags -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
     <header class="main_menu home_menu">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <a class="navbar-brand" href="main"> 갬성경매 </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="menu_icon"><i class="fas fa-bars"></i></span>
                        </button>

                        <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                
                                <li class="nav-item">
                                    <a class="nav-link" href="list">경매</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_3"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        마이갬성
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
                                        <a class="dropdown-item" href="writeForm"> 상품등록</a>
                                        <a class="dropdown-item" href="tracking.html">tracking</a>
                                        <a class="dropdown-item" href="checkout.html">product checkout</a>
                                        <a class="dropdown-item" href="cart.html">shopping cart</a>
                                        <a class="dropdown-item" href="confirmation.html">confirmation</a>
                                        <a class="dropdown-item" href="elements.html">elements</a>
                                    </div>
                                </li>
                               
                                
                                <li class="nav-item">
                                    <a class="nav-link" href="contact.html">고객센터</a>
                                </li>
                            </ul>
                        </div>
                        <div class="hearer_icon d-flex">
                            <a href=""><i class="ti-heart"></i></a>
                            <div class="dropdown cart">
                                <a class="dropdown-toggle" href="#" id="navbarDropdown3" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-cart-plus"></i>
                                </a>                                
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
<!-- 여기까지 헤드 -->


<div class="section-top-border">
   <div class="row">
      <div class="col-lg-8 col-md-8">
         <h3 class="mb-30">상품 등록</h3>
         <form action="${pageContext.request.contextPath}/write" enctype="multipart/form-data" method="POST">
        			<input type="hidden" name="seller" value="testadmin">
					<input type="hidden" name="winid" value="test">
   
            <div class="mt-10">
               상품 명&nbsp&nbsp&nbsp <input type="text" name="pname"    onfocus="this.placeholder = ''" 
               required class="single-input wform">
            </div>
            
            <br>   
            <div class="mt-10">
               카테고리&nbsp&nbsp
               <input type="text" name="category" required class="single-input-parea">
            </div>
            
            <br>   
            <div class="mt-10">
               경매 시작가&nbsp&nbsp
               <input type="text" name="beginsprice" required class="single-input-parea">
            </div>
            
            <br>   
            <div class="mt-10">
               입찰 금액 단위&nbsp&nbsp
               <input type="text" name="bidunit" required class="single-input-parea">
            </div>
            
            <br>   
            <div class="mt-10">
               즉시 구매가&nbsp&nbsp
               <input type="text" name="immediateprice" required class="single-input-parea">
            </div>
            
            <br>   
            <div class="mt-10">
               경매 시간&nbsp&nbsp<input type="text" name="startdate" required class="single-input-a1 wform">
                  &nbsp&nbsp&nbsp&nbsp~&nbsp&nbsp&nbsp&nbsp
                  <input type="text" name="enddate" required class="single-input-a1 wform">
            </div>
            
            <br>
            <div class="mt-10">
               상품 설명
               <textarea class="single-textarea" name="pdetail"></textarea>
            </div>
            <div class="mt-10">
					상품사진&nbsp&nbsp <input type="file" name="uploadfile" required
						class="single-input-parea">
				</div>
				
				<br>
            
            <br>
            <div class="mt-10">
               배송 방법 선택 <br><br>
               <li>
               <input type="radio" name="dealtype" value="택배"> 택배
               <input type="radio" name="dealtype" value="직거래"> 직거래
               </li>
             
            </div>
            
              <br>   
            <div class="mt-10">
             	  배송비&nbsp&nbsp
               <input type="text" name="deliverypay" required class="single-input-parea">
            </div>
            
            <br><br><br><br>
            <input type="submit" name="confirm" value="글쓰기">
            <input type="submit" value="Cancel">
            
         </form>
      </div>
   </div>
</div>


</body>
</html>
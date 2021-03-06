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
    
<div class="section-top-border">
   <div class="row">
      <div class="col-lg-8 col-md-8">
         <h3 class="mb-30">상품 수정</h3>
         <form  method="post">
            <input type="hidden" name="seller" value="testadmin">
            <input type="hidden" name="winid" value="testadmin">
            
            <div class="mt-10">
               상품 명&nbsp&nbsp&nbsp <input type="text" name="pname"   value="${auction.pname}"
               required class="single-input wform">
            </div>
            
            <br>   
            <div class="mt-10">
               카테고리&nbsp&nbsp
               <input type="text" name="category" value="${auction.category}" required class="single-input-parea">
            </div>
            
            <br>   
            <div class="mt-10">
               경매 시작가&nbsp&nbsp
               <input type="text" name="beginsprice" value="${auction.beginsprice}" 
               required class="single-input-parea" readonly>
            </div>
            
            <br>   
            <div class="mt-10">
               입찰 금액 단위&nbsp&nbsp
               <input type="text" name="bidunit" value="${auction.bidunit}"
               required class="single-input-parea" readonly>
            </div>
            
            <br>   
            <div class="mt-10">
               즉시 구매가&nbsp&nbsp
               <input type="text" name="immediateprice" value="${auction.immediateprice}"
               required class="single-input-parea" readonly>
            </div>
            
            <br>   
            <div class="mt-10">
               경매 시간&nbsp&nbsp<input type="text" name="startdate" value="${auction.startdate}"
               required class="single-input-a1 wform" readonly>
                  &nbsp&nbsp&nbsp&nbsp~&nbsp&nbsp&nbsp&nbsp
                  <input type="text" name="enddate" value="${auction.enddate}"
                  required class="single-input-a1 wform" readonly>
            </div>
            
            <br>
            <div class="mt-10">
               상품 설명
               <textarea class="single-textarea" value="${auction.pdetail}" name="pdetail"></textarea>
            </div>
            
            <br>
            <div class="mt-10">
               배송 방법 선택 <br>
               <br>
               <li><input type="radio" name="dealtype" value="택배"> 택배
                  <input type="radio" name="dealtype" value="직거래"> 직거래</li>
               
            </div>
            <br><br>
            <div class="mt-10">
               배송비
               <input type="text" name="deliverypay" value="${auction.deliverypay}">
               
            </div>
            <br><br><br><br>
            <input type="submit" name="confirm" value="수정">
            <input type="button" value="Cancel">
            
         </form>
      </div>
   </div>
</div>


</body>
</html>
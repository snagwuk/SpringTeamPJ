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
.small {  width:20%; line-height:40px; border:none; outline:none;
               background:#f9f9ff; padding:0 20px; }     
.jb-bold {  font-weight: bold;     }                        
li {list-style-type:none; float:left; outline:1px; margin-left:40px;}
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
   
<div class="section-top-border">
   <div class="row">
      <div class="col-lg-8 col-md-8">
         <h3 class="mb-30">판매자 등록</h3>
         <form action="${pageContext.request.contextPath}/tobeseller" method="POST">
       
   			<br>
            <div class="mt-10 jb-bold"> 아이디:&nbsp&nbsp${member.id }</div> 
            <br>
            <br>
            <div class="mt-10 jb-bold"> 이름:&nbsp&nbsp${member.name }</div> 
            <br>
            <br>
            <div class="mt-10 jb-bold"> 핸드폰번호:&nbsp&nbsp${member.phone }</div> 
            <br>
              <div class="mt-10">
               은행&nbsp&nbsp<br>
               <li>
               <input type="radio" name="bank" required value="국민"> 국민
               <input type="radio" name="bank" required value="우리"> 우리
               <input type="radio" name="bank" required value="신한"> 신한
               <input type="radio" name="bank" required value="농협"> 농협
               </li>

            </div> 
            <br><br>
            <div class="mt-10">
               계좌번호&nbsp&nbsp
               <input type="text" name="account" required class="single-input-parea">
            </div>
            
         	<input type="hidden" name="position" value="신청함">
         	<input type="hidden" name="id" value=${member.id }>
            <br><br><br><br>
            <input type="submit" name="confirm" value="구매자 신청">
            <input type="submit" value="취소">
            
         </form>
      </div>
   </div>
</div>


</body>
</html>
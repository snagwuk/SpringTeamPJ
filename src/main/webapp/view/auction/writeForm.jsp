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
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js">
  $('input[type=radio][name=dealtype]').change(function() {

	    var result = $(this).val()
	    if(result==1){

	        $("#deliverypay").css("display","block");

	    

	    }else{

	    	 $("#deliverypay").css("display","none");

	    }
  })

</script>

  
</head>
<body>

<div class="section-top-border">
   <div class="row">
      <div class="col-lg-8 col-md-8">
         <h3 class="mb-30">상품 등록</h3>
         <form action="${pageContext.request.contextPath}/write" enctype="multipart/form-data" method="POST">
        			<input type="hidden" name="seller" value="${user.id}">
        			<input type="hidden" name="winid" value="cake">
        			<input type="hidden" name="pstatus" value="입금전">

				

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
               <input type="text" name="beginsprice" required class="single-input-parea" onblur="if(this.value==null||this.value==''){this.value=0}else{this.value=parseInt(this.value.replace(/[^\d]+/g, ''))}" onfocus="if(this.value=='0'){this.value=''}"  onKeyup= "this.value=this.value.replace(/[^0-9]/g,'').toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');"/>
            </div>

            <br>
            <div class="mt-10">
               입찰 금액 단위&nbsp&nbsp
               <input type="text" name="bidunit" required class="single-input-parea" onblur="if(this.value==null||this.value==''){this.value=0}else{this.value=parseInt(this.value.replace(/[^\d]+/g, ''))}" onfocus="if(this.value=='0'){this.value=''}"  onKeyup= "this.value=this.value.replace(/[^0-9]/g,'').toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');" />
            </div>

            <br>
            <div class="mt-10">
               즉시 구매가&nbsp&nbsp
               <input type="text" name="immediateprice" required class="single-input-parea" onblur="if(this.value==null||this.value==''){this.value=0}else{this.value=parseInt(this.value.replace(/[^\d]+/g, ''))}" onfocus="if(this.value=='0'){this.value=''}"  onKeyup= "this.value=this.value.replace(/[^0-9]/g,'').toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');">
            </div>

            <br>
            <div class="mt-10">
               경매 시간&nbsp&nbsp<input type="date" name="startdate" required class="single-input-a1 wform">
                  &nbsp&nbsp&nbsp&nbsp~&nbsp&nbsp&nbsp&nbsp
                  <input type="date" name="enddate" required class="single-input-a1 wform">
            </div>

            <br>
            <div class="mt-10">
               상품 설명
               <textarea class="single-textarea" name="pdetail"></textarea>
            </div>
            <div class="mt-10">
					상품사진&nbsp&nbsp <input type="file" name="uploadfile"
						class="single-input-parea">
				</div>

				<br>

            <br>
            <div class="mt-10">
               배송 방법 선택 <br><br>
               <li>
               <input type="radio" name="dealtype" value="1" checked="checked" > 택배
               <input type="radio" name="dealtype" value="2" > 직거래
               </li>

            </div>

              <br>
            <div class="mt-10" id = "postcost">
             	   배송비&nbsp&nbsp
               <input type="text" name="deliverypay" id = "postcost" class="single-input-parea"> -
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

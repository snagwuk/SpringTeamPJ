<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
    function inputPhoneNumber(obj) {



        var number = obj.value.replace(/[^0-9]/g, "");
        var phone = "";



        if(number.length < 4) {
            return number;
        } else if(number.length < 7) {
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3);
        } else if(number.length < 11) {
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3, 3);
            phone += "-";
            phone += number.substr(6);
        } else {
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3, 4);
            phone += "-";
            phone += number.substr(7);
        }
        obj.value = phone;
    }
</script>
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
         <h3 class="mb-30">회원 가입</h3>
         <form action="${pageContext.request.contextPath}/regist" method="POST">
       
   			<br>
            <div class="mt-10">
               아이디&nbsp&nbsp&nbsp <input type="text" name="id" required class="single-input-parea">
            </div>
            
            <br>   
            <div class="mt-10">
               비밀번호&nbsp&nbsp
               <input type="password" name="password" required class="single-input-parea">
            </div>
            <br>   
            <!-- <div class="mt-10">
               비밀번호 확인&nbsp&nbsp
               <input type="password" name="password" required class="single-input-parea">
            </div> -->
            
            <br>   
            <div class="mt-10">
               이름&nbsp&nbsp
               <input type="text" name="name" required class="single-input-parea">
            </div>
            
            
            <br>
            <div class="mt-10">
               핸드폰번호&nbsp&nbsp&nbsp <input type="text" onKeyup="inputPhoneNumber(this);" name="phone" required class="single-input-parea">
            </div>
            예:01012345678
            <div class="mt-10">
            주소&nbsp&nbsp&nbsp <input type="text" id="postcode" name="postcode" placeholder="우편번호" class="small">
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<br>
					<input type="text" id="address" name="address" placeholder="주소" class="single-input-a1"><br>
					<br>
					<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" class="single-input-a1">
					<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목" class="single-input-a1">
               
               
            </div>
         
            <input type="hidden" name="position" value="구매자">
            <input type="hidden" name="status" value="가능">
         
            <br><br><br><br>
            <input type="submit" name="confirm" value="가입하기">
            <input type="submit" value="Cancel">
            
         </form>
      </div>
   </div>
</div>


</body>
</html>
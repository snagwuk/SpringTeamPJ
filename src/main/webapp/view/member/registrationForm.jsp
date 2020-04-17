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
$(document).ready(function(){
    $("#id").blur(function() {
		// id = "id_reg" / name = "userId"
		var user_id = $('#id').val();
		$.ajax({								//controller value="/idcheck"
			url : '${pageContext.request.contextPath}/idcheck?id='+ user_id,
			type : 'GET',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 :p");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else {	
						$('#id_check').text("사용 가능한 이메일 입니다. :)");
						$('#id_check').css('color', 'blue');
						$("#reg_submit").attr("disabled", true);
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
	$("#pw2").blur(function() {
		var pw1 = $('#pw1').val();
		var pw2 = $('#pw2').val();
		$.ajax({								//controller value="/idcheck"
			url : '${pageContext.request.contextPath}/pwcheck?pw1='+ pw1+'&&pw2='+pw2,
			type : 'GET',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						$("#pw_check").text("비밀번호가 같지 않습니다. :p");
						$("#pw_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else {	
						$('#pw_check').text("비밀번호가 같습니다. :)");
						$('#pw_check').css('color', 'blue');
						$("#reg_submit").attr("disabled", true);
					}
				}, error : function() {
						console.log("실패");
				}
			});
		
		});
});
</script>
<style>
.col-lg-8 {flex:0 0 66.6666667%; margin:0 auto; max-width:80%;}
.col-md-8 {margin-top:60px;}
.small {  width:20%; line-height:40px; border:none; outline:none; padding:0 20px; }                             
li {list-style-type:none; float:left; outline:1px; margin-left:40px;}
#test_btn1{ border-top-left-radius: 5px; border-bottom-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; margin-right:-4px; }
#btn_group button{ border: 1px solid skyblue; background-color: rgba(0,0,0,0); color: skyblue; padding: 5px; } 
#btn_group button:hover{ color:white; background-color: skyblue; }
.email_div { display: inline-block; padding: 5px; border: solid 1px #ccc; background-color: #f4f4f4; font-size: 9pt; }
.email { background-color: transparent; width: 100px; padding: 3px; border: 0;  font-size: 9pt; }
.btn { background-color: #99ccff; width: 50px; padding: 3px; border: solid 1px #6699ff;  font-size: 9pt; }
</style>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css2/style.css">
<!-- Required meta tags -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
         <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">회원가입</h2>
                        <form action="${pageContext.request.contextPath}/regist" method="POST" class="register-form" id="register-form">
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" required name="name" id="name" placeholder="실명입력"/>
                            </div>
                            <div class="form-group">
                                <label for="id"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" required name="id" id="id" placeholder="example@example.com 이메일"/>                               
                            </div>
                            <div class="check_font" id="id_check"></div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" required name="password" id="pw1" placeholder="비밀번호"/>
                            </div>
                             <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" required id="pw2" placeholder="비밀번호 확인"/>
                            </div>
                            <div class="check_font" id="pw_check"></div>
                            <div class="form-group">
                                <label for="re-pass"><img src="img/icon/phoneicon.png" width="9" height="9"> </label>
                                <input type="text" onKeyup="inputPhoneNumber(this);" name="phone" placeholder="핸드폰번호"/>
                            </div>
                             <div id = "btn_group">
                                <button type="button" id="test_btn1" style="height:30px; width:150px;" onclick="execDaumPostcode()">우편번호 찾기</button>             
                            </div>
                            <div class="form-group">
                            	<label for="re-pass"><img src="img/icon/postcodicon.png" width="15" height="15"></label>
                                <input type="text" required name="postcode" id="postcode" placeholder="우편번호" class="small"/>              
                            </div>
                            <div class="form-group">
                            	<label for="re-pass"><img src="img/icon/houseicon.png" width="15" height="15"></label>
                                <input type="text" required name="address" id="address" placeholder="주소" class="single-input-a1"/>              
                            </div>
                            <div class="form-group">
                                <input type="text" required name="detailAddress" id="detailAddress" placeholder="상세주소" class="single-input-a1"/>              
                            </div>
                            <div class="form-group">
                                <input type="checkbox" required name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>개인정보 처리 방침 안내의 내용에 동의합니다.</label>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="회원가입"/>
                            </div>
                            <input type="hidden" name="extraAddress" id="extraAddress" class="single-input-a1">
                            <input type="hidden" name="position" value="2">
            				<input type="hidden" name="status" value="0">
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="img/signup-image.jpg" alt="sing up image"></figure>
                    </div>
                </div>
            </div>
        </section>
      </div>
   </div>
</div>


</body>
</html>
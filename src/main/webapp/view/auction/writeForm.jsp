<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
/* #first {
display: block!important;

}
.nice-select{
display: none!important;
} */
.col-lg-8 {
	flex: 0 0 66.6666667%;
	margin: 0 auto;
	max-width: 80%;
}

.col-md-8 {
	margin-top: 60px;
}

.wform {
	margin: 0 auto;
}

.single-input-parea {
	width: 60%;
	line-height: 40px;
	border: none;
	outline: none;
	background: #f9f9ff;
	padding: 0 20px;
}

.single-input-a1 {
	width: 40%;
	line-height: 40px;
	border: none;
	outline: none;
	background: #f9f9ff;
	padding: 0 20px;
}

.single-input {
	width: 70%;
	line-height: 40px;
	border: none;
	outline: none;
	background: #f9f9ff;
	padding: 0 20px;
}

li {
	list-style-type: none;
	float: left;
	outline: 1px;
	margin-left: 40px;
}
</style>
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>aranoz</title>
<link rel="icon" href="img/favicon.png">
<!-- Bootstrap CSS -->
<!--   <link rel="stylesheet" href="css/bootstrap.min.css"> -->
<!-- animate CSS -->

<script type="text/javascript"  src="http://code.jquery.com/jquery-1.9.0.min.js" ></script>

<script>
	function aaaa(obj) {

		var sel = document.getElementById('first');
		var val = sel.options[sel.selectedIndex].value;

		$.ajax({
			url : "${pageContext.request.contextPath}/category",
			type : "get",
			data : {
				num : obj

			},
			dataType : "TEXT",
			success : function(result) {

				$("#second").empty();
				$("#second").append(result);

			}
		});

	}

	/*   function checkprice(p){

	 if( $('#beginsprice').val()<= $('#immediateprice').val()){

	 alert('시작가보다 높은 금액을 입력해주세요')
	 return false;

	 }
	 */
</script>


</head>
<body>

	<div class="section-top-border">
		<div class="row">
			<div class="col-lg-8 col-md-8">
				<h3 class="mb-30">상품 등록</h3>
				<form action="${pageContext.request.contextPath}/write"
					enctype="multipart/form-data" method="POST">
					<input type="hidden" name="seller" value="${user.id}"><input
						type="hidden" name="pstatus" value="입찰중">

						<div class="mt-10">
						 		카테고리 <br> <select name="first" id="first" style="float: left; margin-right: 10px;"
						 			onchange="aaaa(this.value);" required>
						 			<option value="default">대분류</option>
						 			<c:forEach var="category" items="${category}">
						 				<option name="num" value="${category.num}">${category.name}</option>
						 			</c:forEach>
						 		</select>
						 		<div id="second">
						 		<select name="category"  >
						 			<option value="default">중분류</option>
						 		</select>
						 		</div>
						 	</div>

							<div class="mt-10">
								상품 명&nbsp&nbsp&nbsp <input type="text" name="pname"
							onfocus="this.placeholder = ''" required
							class="single-input-parea">
						</div>



					<br>
					<div class="mt-10">
						경매 시작가&nbsp&nbsp <input type="text" id="beginsprice"
							name="beginsprice" required class="single-input-parea"
							onblur="if(this.value==null||this.value==''){this.value=0}else{this.value=parseInt(this.value.replace(/[^\d]+/g, ''))}"
							onfocus="if(this.value=='0'){this.value=''}"
							onKeyup="this.value=this.value.replace(/[^0-9]/g,'').toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');" />
					</div>

					<br>
					<div class="mt-10">
						입찰 금액 단위&nbsp&nbsp <input type="text" name="bidunit" required
							class="single-input-parea"
							onblur="if(this.value==null||this.value==''){this.value=0}else{this.value=parseInt(this.value.replace(/[^\d]+/g, ''))}"
							onfocus="if(this.value=='0'){this.value=''}"
							onKeyup="this.value=this.value.replace(/[^0-9]/g,'').toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');" />
					</div>

					<br>
					<div class="mt-10">
						즉시 구매가&nbsp&nbsp <input type="text" id="immediateprice"
							name="immediateprice" required class="single-input-parea"
							onblur="if(this.value==null||this.value==''){this.value=0}else{this.value=parseInt(this.value.replace(/[^\d]+/g, ''))}"
							onfocus="if(this.value=='0'){this.value=''}"
							onKeyup="this.value=this.value.replace(/[^0-9]/g,'').toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');">
					</div>

					<br>
					<div class="mt-10">
						경매 시간&nbsp&nbsp<input type="date" name="startdate" required
							class="single-input-a1 wform">
						&nbsp&nbsp&nbsp&nbsp~&nbsp&nbsp&nbsp&nbsp <input type="date"
							name="enddate" required class="single-input-a1 wform">
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

					<br> <br> <br> <br>
					<br>
					<br>
					<br> <input type="submit" name="confirm" value="글쓰기">
					<input type="submit" value="Cancel">

				</form>
			</div>
		</div>
	</div>


</body>
</html>

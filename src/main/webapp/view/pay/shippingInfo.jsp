<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>배송정보보기</title>
</head>
<body>

	이름: ${member.name }
	<br> 주소: ${member.address} <br> 
		${member.detailAddress } <br>
		${member.extraAddress }<br>
	<br> 연락처: ${member.phone }
	<br>
	<br>
	<br>	
	<form action="${pageContext.request.contextPath}/shippingComplete"
		method="POST">
		<input type="hidden" name="seller" value="${User.id}"> <input
			type="hidden" name="num" value="${myAuction.num}"> <input
			type="submit" value="발송완료">
	</form>

</body>
</html>
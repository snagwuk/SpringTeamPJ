<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>나의 낙찰상품</title>
</head>
<body>
	<img
		src="<%=request.getContextPath()%>/uploadfile/${myAuction.filename}"
		width="200" height="200">
	<br /> 상품명: ${myAuction.pname}
	<br /> 분류: ${myAuction.category}
	<br /> 낙찰가 : ${myAuction.beginsprice}
	<br /> 낙찰일시 : ${myAuction.enddate}
	<br /> 현재상태 : ${myAuction.pstatus}
	<br />
	<br />
	<br />번호 : 
	<br />
	<br /> 내 캐시 : ${cash}
	<br />
	<a
		href="${pageContext.request.contextPath}/charge?winid=${myAuction.winid}">캐시충전</a>
	<br /> 총 결제 금액 : ${myAuction.beginsprice}
	<br /> 결제 후 내 캐시 : ${myBalance}
	<form action="${pageContext.request.contextPath}/pay" method="POST">
		<input type="hidden" name="num" value="${myAuction.num}"> <input
			type="submit" value="결제하기">
	</form>

</body>
</html>
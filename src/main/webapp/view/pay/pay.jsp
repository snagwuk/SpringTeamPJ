<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>나의 낙찰상품</title>
</head>
<body>
	<img
		src="<%=request.getContextPath()%>/uploadFile/${myBidCompleteAuction.filename}"
		width="200" height="200">
	<br /> 상품명: ${myBidCompleteAuction.pname}
	<br /> 분류: ${myBidCompleteAuction.category}
	<br /> 낙찰가 : ${myBidCompleteAuction.beginsprice}
	<br /> 낙찰일시 : ${myBidCompleteAuction.enddate}
	<br /> 현재상태 : ${myBidCompleteAuction.pstatus}
	<br />
	<br />
	<br /> 내 캐시 : ${cash}
	<br />
	<a
		href="${pageContext.request.contextPath}/charge?winid=${myBidCompleteAuction.winid}">캐시충전</a>
	<br /> 총 결제 금액 : ${myBidCompleteAuction.beginsprice}
	<br /> 결제 후 내 캐시 : ${myBalance}

	<form action="${pageContext.request.contextPath}/pay" method="POST">

		<c:if test="${myBidCompleteAuction.pstatus eq '입금전'}">
			<input type="hidden" name="num" value="${myBidCompleteAuction.num}">
			<input type="submit" value="결제하기">
		</c:if>
	</form>

	<form action="${pageContext.request.contextPath}/confirmShipping" method="POST">
		<c:if test="${myBidCompleteAuction.pstatus eq '배송중'}">
			<input type="hidden" name="num" value="${myBidCompleteAuction.num}">
			<input type="submit" value="수취확인">
		</c:if>
	</form>


</body>
</html>
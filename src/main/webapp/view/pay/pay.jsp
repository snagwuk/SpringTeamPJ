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
	<br /> 분류: ${myBidCompleteAuction.category}<br />
	<c:choose>

		<c:when test="${myBidCompleteAuction.pstatus eq '입찰중'}"> 
즉시구매가 : ${myBidCompleteAuction.immediateprice}</c:when>
		<c:otherwise>낙찰가 : ${myBidCompleteAuction.beginsprice}</c:otherwise>

	</c:choose>



	<br /> 낙찰일시 : ${myBidCompleteAuction.enddate}
	<br /> 현재상태 : ${myBidCompleteAuction.pstatus}
	<br />
	<br />
	<br /> 내 캐시 : ${cash}
	<br />
	<a
		href="${pageContext.request.contextPath}/charge?winid=${myBidCompleteAuction.winid}">캐시충전</a>
	
	<br /> 결제 후 내 캐시 : ${myBalance}

	<form action="${pageContext.request.contextPath}/pay" method="POST">

		<c:if test="${myBidCompleteAuction.pstatus eq ('입금전' or '입찰중')}">
			<input type="hidden" name="num" value="${myBidCompleteAuction.num}">
			<input type="submit" value="결제하기">
		</c:if>
	</form>




</body>
</html>
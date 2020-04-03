<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>나의 경매상품 목록</title>
</head>
<body>
<br /><br /><br /><br /><h1>나의 판매목록:</h1><br /><br /><br /><br /><br /><br /><br />
    
    
    <div>
    <a href="${pageContext.request.contextPath}/statusBidList"><input type="button" value="입찰${statusBidCount}건"></a><br>
    <a href="${pageContext.request.contextPath}/statusDealing"><input type="button" value="낙찰(거래 중)${statusDealingCount}건"></a><br>
    <a href="${pageContext.request.contextPath}/statusComplete"><input type="button" value="낙찰(거래 완료)${statusCompleteCount}건"></a><br>

	</div>
	
	
	
	<c:if test="${count==0}">
		<h4>등록된 물품이 없음</h4>
	</c:if>
	<c:if test="${count!=0}">
		<c:forEach var="MyAuctionList" items="${MyAuctionList}">
			<div>
				<img
					src="<%=request.getContextPath()%>/uploadFile/${MyAuctionList.filename}"
					width="200" height="200">
				<div>
					상품명: <a
						href="${pageContext.request.contextPath}/myContent?num=${MyAuctionList.num}">${MyAuctionList.pname}</a><br />
					현재 가격 : ${MyAuctionList.beginsprice}<br /> 상태 :
					${MyAuctionList.pstatus}<br />
					<c:if test="${MyAuctionList.pstatus eq '입금완료'}">
						<form action="${pageContext.request.contextPath}/shippingInfo"
							method="POST">
							<input type="hidden" name="winid" value="${MyAuctionList.winid}">
							<input type="hidden" name="num" value="${MyAuctionList.num}">
							<input type="submit" value="배송정보보기">
						</form>

					</c:if>
					낙찰자ID: ${MyAuctionList.winid}<br />
					낙찰일시 : <br />
				</div>
			</div>
		</c:forEach>
	</c:if>





</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>나의 경매상품 목록</title>
</head>
<body>

	<h1>나의 판매목록:</h1>
	
	
	<c:if test="${count==0}">
		<h4>등록된 물품이 없음</h4>
	</c:if>
	<c:if test="${count!=0}">
		<c:forEach var="myAuctionList" items="${myAuctionList}">
			<div>
				<img
					src="<%=request.getContextPath()%>/uploadFile/${myAuctionList.filename}"
					width="200" height="200">
				<div>
					상품명: <a
						href="${pageContext.request.contextPath}/myContent?num=${myAuctionList.num}">${myAuctionList.pname}</a><br />
					현재 가격 : ${myAuctionList.beginsprice}<br /> 상태 :
					${myAuctionList.pstatus}<br />
					<c:if test="${myAuctionList.pstatus eq '입금완료'}">
						<form action="${pageContext.request.contextPath}/shippingInfo"
							method="POST">
							<input type="hidden" name="winid" value="${myAuctionList.winid}">
							<input type="hidden" name="num" value="${myAuctionList.num}">
							<input type="submit" value="배송정보보기">
						</form>

					</c:if>
					낙찰일시 : <br />
				</div>
			</div>
		</c:forEach>
	</c:if>





	<h1>나의 구매목록:</h1>


	<%-- <c:if test="${count==0}">
		<h4>등록된 물품이 없음</h4>
	</c:if>
	<c:if test="${count!=0}">
		<c:forEach var="myAuctionList" items="${myAuctionList}">
			<div class="col-lg-4 col-sm-6">
				<div>
					<img
						src="<%=request.getContextPath()%>/uploadFile/${myAuctionList.filename}"
						width="200" height="200">
					<div>
						상품명: <a
							href="${pageContext.request.contextPath}/myContent?num=${myAuctionList.num}">${myAuctionList.pname}</a><br />
						현재 가격 : ${myAuctionList.beginsprice}<br /> 상태 :
						${myAuctionList.pstatus}<br />
						<c:if test="${myAuctionList.pstatus eq '입금완료'}">
							<form action="${pageContext.request.contextPath}/shippingInfo"
								method="POST">
								<input type="hidden" name="winid" value="${myAuctionList.winid}">
								<input type="hidden" name="num" value="${myAuctionList.num}">
								<input type="submit" value="배송정보보기">
							</form>

						</c:if>


						낙찰일시 : <br />
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if> --%>
</body>
</html>
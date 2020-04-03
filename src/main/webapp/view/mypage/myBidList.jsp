<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>나의 경매상품 목록</title>
</head>
<body>





	<div>
		<div id="purchaseHead">구매내역</div>
		<ul class="tabHead">
			<li><span data-type="auctionBid"
				class="purchaseTabList tabChoice">입찰</span></li>
			<li><span data-type="dealProgress" class="purchaseTabList">낙찰(거래
					중)</span></li>
			<li><span data-type="dealComplete" class="purchaseTabList">낙찰(거래
					완료)</span></li>
			<li><span data-type="dealCancle" class="purchaseTabList">신고/취소
					거래</span></li>
		</ul>
		<div id="purchaseAjax">
			<div class="emptyBox">구매한 내역이 없습니다.</div>
			<div class="pagination">
				<div></div>
			</div>
		</div>
	</div>



















	<h1>나의 구매목록:</h1>


	<c:if test="${count==0}">
		<h4>등록된 물품이 없음</h4>
	</c:if>
	<c:if test="${count!=0}">
		<c:forEach var="MyBidList" items="${MyBidList}">
			<div>
				<img
					src="<%=request.getContextPath()%>/uploadFile/${MyBidList.filename}"
					width="200" height="200">
				<div>
					상품명: <a
						href="${pageContext.request.contextPath}/myContent?num=${MyBidList.num}">${MyBidList.pname}</a><br />
					낙찰가 : ${MyBidList.beginsprice}<br /> 상태 : ${MyBidList.pstatus}<br />
					<c:if test="${MyBidList.pstatus eq '입금완료'}">
						<form action="${pageContext.request.contextPath}/shippingInfo"
							method="POST">
							<input type="hidden" name="winid" value="${MyBidList.winid}">
							<input type="hidden" name="num" value="${MyBidList.num}">
							<input type="submit" value="배송정보보기">
						</form>

					</c:if>
					낙찰일시 : <br />
				</div>
			</div>
		</c:forEach>
	</c:if>





</body>
</html>
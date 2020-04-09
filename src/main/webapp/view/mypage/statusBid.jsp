<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 입찰중인 상품 목록</title>
</head>
<body>
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
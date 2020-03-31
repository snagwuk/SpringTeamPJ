<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>나의 경매상품 목록</title>
</head>
<body>
	<c:if test="${count==0}">
		<h4>등록된 물품이 없음</h4>
	</c:if>
	<c:if test="${count!=0}">
		<c:forEach var="myAuctionList" items="${myAuctionList}">
			<div class="col-lg-4 col-sm-6">
				<div class="single_product_item">
					<img
						src="<%=request.getContextPath()%>/uploadfile/${myAuctionList.filename}"
						width="200" height="200">
					<div class="single_product_text">
						상품명: <a
							href="${pageContext.request.contextPath}/myContent?num=${myAuctionList.num}">${myAuctionList.pname}</a><br /> 
						현재 가격 : ${myAuctionList.beginsprice}<br />						 
						상태 : ${myAuctionList.pstatus}<br />
						
						낙찰일시 : ${여기 모르겠어 -진희-}<br />

					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>
</body>
</html>
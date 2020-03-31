<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>나의 낙찰목록</title>
</head>
<body>
	<c:if test="${count==0}">
		<h4>등록된 물품이 없음</h4>
	</c:if>
	<c:if test="${count!=0}">
		<c:forEach var="myBidList" items="${myBidList}">
			<div class="col-lg-4 col-sm-6">
				<div class="single_product_item">
					<img
						src="<%=request.getContextPath()%>/uploadfile/${myBidList.filename}"
						width="200" height="200">
					<div class="single_product_text">
						상품명: ${myBidList.pname}<br /> 
						낙찰가 : ${myBidList.beginsprice}<br />
						낙찰일시 : ${myBidList.enddate}<br /> 
						상태 : ${myBidList.pstatus} <a
							href="${pageContext.request.contextPath}/myContent?num=${myBidList.num}">자세히
							보기</a>

					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>
</body>
</html>
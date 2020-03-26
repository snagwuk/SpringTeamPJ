<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>나의 낙찰상품</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/pay" enctype="multipart/form-data" method="POST">
    
					
	
	<img src="<%=request.getContextPath()%>/uploadfile/${myBidList.filename}"
		width="200" height="200"> <br />
		상품명: ${myBidList.pname}<br />
		분류: ${myBidList.category}<br />
		낙찰가 : ${myBidList.beginsprice}	<br />
		낙찰일시 : ${myBidList.enddate}	<br />
		<br /><br /><br /><br />
		
		내 캐시 : ${WinnerMemberInfo.cash}<br />
		<a href="${pageContext.request.contextPath}/cashRecharge?id=${WinnerMemberInfo.id}">캐시충전</a>
		<br />
		총 결제 금액 : ${myBidList.beginsprice}	<br />
		
		
		<input type="submit" name="pay" value="확인">
</form>	

</body>
</html>
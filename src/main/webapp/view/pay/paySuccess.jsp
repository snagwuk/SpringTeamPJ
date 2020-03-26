<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>결제 성공</title>
</head>
<body>
결제가 성공되었습니다.

내 캐시 : ${WinnerMemberInfo.cash}<br/><br/>

<a href="${pageContext.request.contextPath}/myBidContent?num=${myBidList.num}">내 낙찰상품 보기</a>
</body>
</html>
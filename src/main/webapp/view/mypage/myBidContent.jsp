<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>나의 낙찰상품</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/pay" enctype="multipart/form-data" method="POST">
    <input type="hidden" name="myBidList" value="myBidList">
	<input type="hidden" name="WinnerMemberInfo" value="WinnerMemberInfo">
					
					
	상태 : ${myBidList.pstatus}<br />
	<img
		src="<%=request.getContextPath()%>/uploadfile/${myBidList.filename}"
		width="200" height="200"> <br />
		상품명: ${myBidList.pname}<br />
		분류: ${myBidList.category}<br />
		상품설명: ${myBidList.pdetail}<br />
		낙찰가 : ${myBidList.beginsprice}	<br />
		낙찰일시 : ${myBidList.enddate}	<br />
		<br /><br /><br /><br />
		
		판매자ID : ${myBidList.seller}<br />
		<br /><br /><br /><br />
		
		낙찰자ID : ${myBidList.winid}<br />
		낙찰자 주소 : ${WinnerMemberInfo.address}<br />
		낙찰자 연락처 : ${WinnerMemberInfo.phone}<br />
		낙찰자 이름 : ${WinnerMemberInfo.name}<br />
		<br /><br /><br /><br />
		
		<input type="submit" name="pay" value="입금하기">
</form>	

</body>
</html>
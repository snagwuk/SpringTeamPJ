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
		경매시작일시 : ${myAuctionList.startdate}<br />
		경매종료일시 : ${myAuctionList.enddate}<br /><br /><br />
		<br /><br /><br /><br />
		
		판매자ID : ${myBidList.seller}<br />
		<br /><br /><br /><br />
		
		낙찰자ID : ${WinnerMemberInfo.id}<br />
		낙찰자 주소 : ${WinnerMemberInfo.address}<br />
		낙찰자 연락처 : ${WinnerMemberInfo.phone}<br />
		낙찰자 이름 : ${WinnerMemberInfo.name}<br />
		<br /><br /><br /><br />
		
		
		
		<!-- 이거 구/판매자 둘이 같이 보는 페이지라서 아래 버튼은
		
		판매자입장에서: 예를들어 상품상태 보고 입금되어있으면 "배송하기"로 보인다든지...if 더 걸어줘야하구
		구매자입장에서: 상품상태 보고 입금전이면 "입금하기"로 보이게.. 해야해요
		
		일단 구매자입장에서 먼저 코딩해논거라 여기서 멈추겠읍니다.. -진흐ㅣ- -->
		
		<c:if test="${myBidList.pstatus eq '입금전'}">
		<input type="submit" name="pay" value="입금하기">
		</c:if>
		
		
</form>	

</body>
</html>
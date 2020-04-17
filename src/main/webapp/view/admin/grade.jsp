<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}
.col-lg-8 {flex:0 0 66.6666667%; margin:0 auto; max-width:80%;}
.col-md-8 {margin-top:60px;}
</style>
</head>
<body>
<div class="section-top-border">
   <div class="row">
      <div class="col-lg-8 col-md-8">
         <h3 class="mb-30">등급 관리</h3>
<table>
  <tr>
    <th>아이디</th>
    <th>이름</th>
    <th>가입날짜</th>
    <th>핸드폰</th>
    <th>주소</th>
    <th>은행</th>
    <th>계좌</th>
    <th>등급</th>
    <th>상태</th>
    <th>승인/거절</th>
  </tr>
<c:forEach   var="member"  items="${memberList}">
  <tr>
    <td>${member.id}</td>
    <td>${member.name}</td>
    <td>${member.registdate}</td>
    <td>${member.phone}</td>
    <td>${member.address}</td>
    <td>${member.bank}</td>
    <td>${member.account}</td>
<c:if test="${member.position==0 }">
    <td>관리자</td>
</c:if>
<c:if test="${member.position==1 }">
    <td>판매자</td>
</c:if>
<c:if test="${member.position==2 }">
    <td>구매자</td>
</c:if>
<c:if test="${member.position==3 }">
    <td>판매자로신청</td>
</c:if>
<c:if test="${member.position==4 }">
    <td>거절</td>
</c:if>


<c:if test="${member.status==0 }">
    <td>가능</td>
</c:if>
<c:if test="${member.status==1 }">
    <td>불가</td>
</c:if>
    <td> 
    	<button type="button" onclick="location.href='${pageContext.request.contextPath}/upgrade?id=${member.id }'">승인</button>
        <button type="button" onclick="location.href='${pageContext.request.contextPath}/downgrade?id=${member.id }'">거절</button>
    </td>
  </tr>
</c:forEach>
</table>
</div></div></div>
</body>
</html>

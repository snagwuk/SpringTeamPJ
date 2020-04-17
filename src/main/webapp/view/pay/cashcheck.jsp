<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<h3 class="mb-30">캐쉬 관리</h3>
				<br>
<table>
					<tr>
						<th>날짜</th>
						<th>ID</th>
						<th>변동 금액</th>
						<th>변동 사유</th>
						<th>승인/거절</th>
					</tr>
					<c:forEach var="cash" items="${cashchecklist}">
						<tr>
							<td>${fn:replace(cash.cashdate, 'T', ' ')}</td>
							<td>${cash.id}</td>
							<td>${cash.cash}</td>
							<td>${cash.reason}</td>
							<td>
							<button type="button" onclick="location.href='${pageContext.request.contextPath}/cashcheck?cnum=${cash.cnum}&cstatus=1'">승인</button>
       						<button type="button" onclick="location.href='${pageContext.request.contextPath}/cashcheck?cnum=${cash.cnum}&cstatus=2'">거절</button>
								
							</td>
							</form>
						</tr>
					</c:forEach>

				</table>
			</div>
		</div>
	</div>


</body>
</html>
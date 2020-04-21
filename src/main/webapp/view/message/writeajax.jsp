<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




 <c:if test="${!category.isEmpty()}">
      <select name="category" required>
      	<option value="default">중분류</option>
          <c:forEach var="category" items="${category}">
		
      <option name="num" value="${category.num}">${category.name}</option>
  
          </c:forEach>
          </select>
          </c:if>
<%-- ${list.size() }

<c:forEach  var = "c"  items="${list}">
${c.num}:${c.sender }
</c:forEach> --%>


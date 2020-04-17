<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




 <c:if test="${!list.isEmpty()}">
          <c:forEach var="messages" items="${list}">
          <div  id = "chat" >
          <div class="chat_list" >

              <div class="chat_people" >
                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
               <a href="mslist?num=${messages.num}" onclick="msgajax();">
                <div class="chat_ib" >
                <c:if test="${messages.sender==id}">
                  <h5>${messages.receiver}</h5>
                  </c:if>
                  <c:if test="${messages.sender!=id}">
                  <h5>${messages.sender}</h5>
                  </c:if>
                  <span class="chat_date">
                  <fmt:formatDate value="${messages.sendtime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                  <c:if test="${messages.unreadcount!=0}">
                  <span class="step">${messages.unreadcount}</span>
                   </c:if></h5>
                  <p>${messages.content}</p>

                </div>
                </a>
              </div>
            </div>
            </div>
          </c:forEach>
          </c:if>
<%-- ${list.size() }

<c:forEach  var = "c"  items="${list}">
${c.num}:${c.sender }
</c:forEach> --%>


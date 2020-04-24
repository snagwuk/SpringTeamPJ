<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page isErrorPage="true" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center" style = "margin-top : 10%;">
<img src="http://www.hhiarts.co.kr/images/common/img_error.png">
<br>
<c:set var="msg" value="${msg}"/>
<h1>${msg}</h1>
<h2><span id = "output">3</span>초후 메인페이지로 이동합니다.</h2>

<meta http-equiv ="Refresh" content = "3;url=<%=request.getContextPath()%>/main">


<script type="text/javascript"  src="http://code.jquery.com/jquery-1.9.0.min.js" ></script>
<script>
        // 예제01: 1초에 한 번씩 변수 값을 1씩 증가시키고 이 값을 #output 영역에 출력해 주세요.
        $(document).ready(function () {
 
            var $output = $("#output");
            var count = 4;
 
            // 여기에 풀이를 입력해주세요.
            // 함수 생성
            function addCount() {
                // 값 증가
                count--;
                // 값을 출력
                $output.text(count);
            }
 
            addCount();
            setInterval(addCount, 1000);
 
        })
 
    </script>



</div>
</body>
</html>
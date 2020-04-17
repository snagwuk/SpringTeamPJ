<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/style.css" />
<script>
var img = document.querySelector('img');
var url = "ws://211.63.89.94:8081/SpringTeamPJ/wsServer";

var socket = new WebSocket(url);
var img = document.querySelector('img');

socket.onopen=onOpen;
socket.onmessage=onMessage;
function onOpen(event){
	alert("ok");
}
function onMessage(event){
	img = document.getElementById("img");
	img.src=window.URL.createObjectURL(event.data);
}

</script>
<head>
<meta charset="utf-8">
<title>webcam streaming</title>
<link rel="stylesheet" href="css/style.css" />
</head>
<body>
 <div class="wrapper">
  
  <div>
   <h1> Video from Server</h1>
  <img alt="" id="img"/>
  </div>
 </div>
 
</body>
</html>
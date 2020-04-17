<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>webcam streaming</title>

<style type="text/css">
.wrapper{
	display: grid;
	grid-template-columns:repeat(3,1fr);
	grid-gap:5px;
}

video, canvas, img{
	width: 400px;
	height: 400px;
	background-color: #000;
}
</style>
</head>
<body>
 <div class="wrapper">
  <div>
  <h1>Video from webCam</h1>
  <video ></video>
  </div>
  <div>
  <h1>Video on Canvas</h1>
  <canvas></canvas>
  </div>
  
  <div>
   <h1> Video from Server</h1>
  <img alt="" id="img"/>
  </div>
 </div>
 <script>
 /**
  * 
  */
 (function(){
 	var video = document.querySelector('video');
 	var canvas = document.querySelector('canvas');
 	var img = document.querySelector('img');
 	var context=canvas.getContext('2d');
 	/*var url = "ws://localhost:8080/WScams/wsServer";*/
 	var url = "ws://211.63.89.94:8081/SpringTeamPJ/wsServer";

 	var socket = new WebSocket(url);
 	
 	socket.onopen=onOpen;
 	function onOpen(event){
 		alert("ok");
 	}

 	var constraints={
 			video:true,
 			audio:false
 	};
 	
 	navigator.mediaDevices.getUserMedia(constraints).then(function(stream){
 		video.srcObject=stream;
 		video.play();
 	}).catch(function(err){
 		
 	});

 	 setInterval(main ,300);
 	
 	
     function main(){
     	drawCanvas();
     	readCanvas();
     }
 	
 	function drawCanvas(){
 		
 		context.drawImage(video,0,0,canvas.width, canvas.height);
 		
 	}
 	
 	 console.log(canvas.toDataURL('image/jpeg',1));
 	
 	function readCanvas(){
 		var canvasData = canvas.toDataURL('image/jpeg',1);
 		var decodeAstring = atob(canvasData.split(',')[1]);
 		
 		var charArray =[];
 		
 		for(var i=0; i<decodeAstring.length;i++){
 			
 			charArray.push(decodeAstring.charCodeAt(i));
 		}
 		
        socket.send( new Blob([new Uint8Array(charArray)],{
     	   type:'image/jpeg'
        }));		
 	
         socket.addEventListener('message',function(event){
         	img.src=window.URL.createObjectURL(event.data);
         });
 		
 	}
 	
 		
 		
 	
 	

 	

   
      
 	
 	
 	
 })();
 
 
 </script>
</body>
</html>
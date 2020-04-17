<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>webcam streaming</title>
<style>
.notbold {
	font-weight: normal
}

.col-lg-8 {
	flex: 0 0 66.6666667%;
	margin: 0 auto;
	max-width: 80%;
}

.col-md-8 {
	margin-top: 60px;
}
​
</style>
<script>
//Time
//Set the date we're counting down to
var countDownDate = new Date("${auction.enddate}").getTime();

//Update the count down every 1 second
var x = setInterval(function() {

	// Get today's date and time
	var now = new Date().getTime();

	// Find the distance between now and the count down date
	var distance = countDownDate - now;

	// Time calculations for days, hours, minutes and seconds
	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
	var hours = Math.floor((distance % (1000 * 60 * 60 * 24))
			/ (1000 * 60 * 60));
	var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
	var seconds = Math.floor((distance % (1000 * 60)) / 1000);

	// Output the result in an element with id="demo"
	document.getElementById("demo").innerHTML = days + "일 " + hours + ": "
			+ minutes + ": " + seconds + " ";

	// If the count down is over, write some text
	if (distance < 0) {
		clearInterval(x);
		document.getElementById("demo").innerHTML = "EXPIRED";
	}
}, 1000);
</script>
</head>
<body>
	<div class="section-top-border">
		<div class="row">
			<div class="col-lg-8 col-md-8">
				<br />
				<br />
				<br />
				<div class="wrapper"
					style="display: grid; grid-template-columns: repeat(3, 1fr); grid-gap: 5px;">
					<div>
						<h1>
							<span class='notbold'>My Camera&nbsp&nbsp&nbsp</span>
						</h1>
						<video
							style="width: 400px; height: 300px; background-color: #000;"></video>
						<br />
						<br />
						<br />
						<br /> <img
							src="<%=request.getContextPath()%>/uploadFile/${auction.filename}"
							width="400" height="300">
					</div>
					<div>

						<h1>
							<span class='notbold'>Send Pictures&nbsp&nbsp&nbsp</span>
						</h1>
						<canvas
							style="width: 400px; height: 300px; background-color: #000;"></canvas>
						<br />
						<br />
						<br />
						<br />
						<div class="s_product_text">
							<h3>
								<a class="active" href="#"> <span>남은시간 </span><span
									id="demo"></span></a>
							</h3>
							<p style="color: gray;">
							<h3>${auction.pname}(${auction.category})</h3>

							<c:choose>
								<c:when test="${auction.pstatus eq '입찰중'}">
									<h2>현재 최고가 : ${hprice} 원</h2>

								</c:when>
							</c:choose>
							<p style="color: gray;">
						</div>
					</div>

					<div>
						<h1 style="color: #FB0A07">ON AIR&nbsp&nbsp&nbsp</h1>
						<img alt="" id="img"
							style="width: 400px; height: 300px; background-color: #000;" /><br />
						<br />
						<br />
						<br /> <a href="${pageContext.request.contextPath}/endlive"
							class="btn_3 modi"> 방송종료 </a>

					</div>

				</div>


			</div>
		</div>
	</div>
	<script>

 (function(){
 	var video = document.querySelector('video');
 	var canvas = document.querySelector('canvas');
 	/* var img = document.querySelector('img'); */
 	var img = document.getElementById('img');
 	var context=canvas.getContext('2d');
 	/*var url = "ws://localhost:8081/WScams/wsServer";*/
 	var url = "ws://211.63.89.86:9080/SpringTeamPJ/wsServer";

 	var socket = new WebSocket(url);

 	socket.onopen=onOpen;
 	function onOpen(event){
 		/* alert("ok"); */
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

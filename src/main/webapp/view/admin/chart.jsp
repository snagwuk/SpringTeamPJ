<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.col-lg-8 {flex:0 0 66.6666667%; margin:0 auto; max-width:80%;}
.col-md-8 {margin-top:60px;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
<div class="section-top-border">
   <div class="row">
      <div class="col-lg-8 col-md-8">
         <h3 class="mb-30">회원 통계</h3>
         	<div class="container">
         	<div class="row">
         		<div class="col-6 chart">
         			<canvas id="myChart" width="500" height="400"></canvas>
         		</div>
         		<div class="col-6 chart">
         			<canvas id="myChart2" width="500" height="400"></canvas>
         		</div>
         	</div>
         	<div class="row">
         		<div class="col-6 chart">
         			<canvas id="myChart3" width="500" height="400"></canvas>
         		</div>
         	</div>
         	</div>
		</div>
	</div>
</div>
         	<script>
         	let labels1 = ['여성', '남성'];
         	let data1=[${persentfe},${persentma}];
         	let colors1=['#49A9EA','#36CAAB']
         	let myChart1 = document.getElementById("myChart").getContext('2d');
         	let chart1 = new Chart(myChart1,{
         		type: 'doughnut',
         		data: {
         			labels:labels1,
         			datasets:[{
         				data: data1,
         				backgroundColor: colors1
         			}]
         		},
         		options : {
         			title:{
         				text: "회원들의 성별 (단위:%)",
         				display: true		
         			}
         		}

         	});
         	//두번째 chart
         	let labels2 = ['0시', '1시', '2시','3시','4시','5시', '6시','7시','8시','9시','10시','11시', 
         		'12시','13시','14시','15시','16시','17시', '18시','19시','20시','21시', '22시','23시'];
         	let data2=[${persentfe},${persentma}];
         	let myChart2 = document.getElementById("myChart2").getContext('2d');
         	let chart2 = new Chart(myChart2,{
         		type: 'line',
         		data: data = {
         			labels:labels2,
         			datasets:[{
						label : "회원가입 시간",
						fill: false,
         				lineTension: 0.1,
         				backgroundColor: "rgba(25,192,192,0.4)",
         				borderColor: "rgba(75,192,192,1)",
         				borderCapStype: 'butt',
         				borderDash: [],
         				borderDashOffset:0.0,
         				borderJoinStyle: 'miter',
         				pointBorderColor: "rgba(75,192,192,1)",
         				pointBackgroundColor:"#fff",
         				pointBorderWidth:1,
         				pointHoverRadius:5,
         				pointHoverBackgroundColor:"rgba(75,192,192,1)",
         				pointHoverBorderColor:"rgba(220,220,220,1)",
         				pointHoverBorderWidth: 2,
         				pointRadius: 1,
         				pointHitRadius:10,
         				data:[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24],
         				
         				
         				
         			}]
         		}

         	});
         	//세번째 chart
         	let labels3 = ['SNS','친구추천','카페','이메일광고','기타'];
         	let myChart3 = document.getElementById("myChart3").getContext('2d');
         	let chart3 = new Chart(myChart3,{
         		type: 'radar',
         		data: {
         			labels:labels3,
         			datasets:[
         				{
         				label: '여성',
         				fill: true,
         				backgroundColor: "rgba(179,181,198,0.2)",
         				borderColor: "rgba(179,181,198,1)",
         				pointBorderColor: "#fff",
         				pointBackgroundColor: "rgba(179,181,198,1)",
         				data: [50, 12, 55, 7, 29]
         				},
         				{
             				label: '남성',
             				fill: true,
             				backgroundColor: "rgba(225,99,132,0.2)",
             				borderColor: "rgba(225,99,132,1)",
             				pointBorderColor: "#fff",
             				pointBackgroundColor: "rgba(225,99,132,1)",
             				data: [51, 10, 32, 20, 44]
             				}
         			]
         		},
         		options : {
         			title:{
         				text: "가입 경로",
         				display: true		
         			}
         		}

         	});
         	
         	</script>
         
</body>
</html>
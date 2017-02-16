<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%
	
	String userID=null;
	boolean ready=false;
	
	if(session.getAttribute("USERID") != null){
		userID = (String)session.getAttribute("USERID");
	}
	if(request.getAttribute("ready") != null){
		ready = (boolean)request.getAttribute("ready");	
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<script src="js/Chart.js"></script>
	</head>
	
	<body>
		<div id="wrapper">
			<div class="container">
				login.jsp here!
				<br>
				userID:<%=userID %>
				<br>
				db_ready:<%=ready %>
			</div>
			
			
			<div class="container">
			
				<div class="rank_container">
					<canvas id="myChart0" class="myChart"></canvas>
					<script>
						var ctx = document.getElementById("myChart0");
						var myChart = new Chart(ctx, {
						    type: 'pie',
						    data: {
						        labels: ["10代男", "10代女", "20代男", "20代女", "30代男", "30代女"],
						        datasets: [{
						            data: [12, 19, 3, 5, 2, 3],
						            backgroundColor: [
						            	'rgba(54, 162, 235, 0.3)',
						            	'rgba(255, 99, 132, 0.3)',
						                'rgba(255, 206, 86, 0.3)',
						                'rgba(75, 192, 192, 0.3)',
						                'rgba(153, 102, 255, 0.3)',
						                'rgba(255, 159, 64, 0.3)'
						            ],
						            hoverBackgroundColor: [
						            	'rgba(54, 162, 235, 1)',
						            	'rgba(255,99,132,1)',
						                'rgba(255, 206, 86, 1)',
						                'rgba(75, 192, 192, 1)',
						                'rgba(153, 102, 255, 1)',
						                'rgba(255, 159, 64, 1)'
						            ]
						        }]
						    },
						    options: null
						});
					</script>
				</div>
				
				<div class="rank_container">
					<canvas id ="myChart1" class="myChart"></canvas>
					<script>
						var ctx = document.getElementById("myChart1");
						var myChart = new Chart(ctx, {
						    type: 'bar',
						    data: {
						        labels: ["男性", "女性"],
						        datasets: [{
						            label: "性別",
						            data: [12, 19],
						            backgroundColor: [
						                'rgba(54, 162, 235, 0.3)',
						                'rgba(255, 99, 132, 0.3)',
						            ],
						            borderColor: [
						                'rgba(54, 162, 235, 1)',
						                'rgba(255, 99, 132, 1)',
						            ],
						            borderWidth: 1
						        }]
						    },
						    options: {
						        scales: {
						            yAxes: [{
						                ticks: {
						                    beginAtZero:true
						                }
						            }]
						        }
						    }
						});
					</script>
				</div>
			</div>
			
			<footer>
				<form method="post" action="LogoutController">
					<input type="submit" class="btn" name="LOGOUT" value="ログアウト">			
				</form>
			</footer>
			
		</div>
	</body>
</html>
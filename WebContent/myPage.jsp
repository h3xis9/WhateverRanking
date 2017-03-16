<%@page import="com.ranking.dao.DAOFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.ranking.model.RankingBean"%>
<%
	
	String userID=null;

	//for checking DB status
	//boolean ready = false;
			
	int answerY = 0;
	int answerN = 0;
	
	int genderTotal[] = new int[2];
	int ageTotal[] = new int[5];
			
	int howManyRankExist = -1;
	ArrayList<RankingBean> rankList = null;
	
	if(session.getAttribute("USERID") != null){
		userID = (String)session.getAttribute("USERID");
	}
	
	if(session.getAttribute("rankList") != null){
		rankList = (ArrayList<RankingBean>) session.getAttribute("rankList");
		howManyRankExist = rankList.size();
		
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
				howManyRankExist:<%=howManyRankExist %>
				<br>
				<br>
				rankList:
			</div>
			
			<%
			if(howManyRankExist != -1){
				for(int i=0; i < howManyRankExist; i++){
					RankingBean rank = (RankingBean) rankList.get(i);
					out.println(rank.getRankingNo());
					out.println(rank.getRankingQuestion());
					out.println(rank.getCreatorId());
					out.println(rank.getPostDate());
					out.println(rank.getRankingReward());
					out.println("<br>");
					
					int howManyAnswerExist = -1;
					genderTotal = new int[2];
					ageTotal = new int[5];
					if(rank.getAnswerList() != null && rank.getAnswerList().size() != 0){
						howManyAnswerExist = rank.getAnswerList().size();
						rank.initAnswerVar();
						out.print("<br>");
						for(int j=0; j < howManyAnswerExist; j++){
							//out.println(rank.getAnswerList().get(j).getNickName()+"/");
							//out.println(rank.getAnswerList().get(j).getAnswer()+"<br>");
							
							
							//Counting Yes or No
							if(rank.getAnswerList().get(j).getAnswer() == true) rank.increaseYes();
							else rank.increaseNo();
							
							
							genderTotal[rank.getAnswerList().get(j).getGender()]++;
							ageTotal[ ((rank.getAnswerList().get(j).getAge())-1) ]++;
							
							
							out.print(rank.getAnswerList().get(j).getNickName()+" / ");
							out.print(rank.getAnswerList().get(j).getAge()+" / ");
							out.print(rank.getAnswerList().get(j).getGender()+"<br>");
							
						}
					}
					answerY = rank.getAnswerYes();
					answerN = rank.getAnswerNo();
					%>
					<script>
						var gender0 = <%= genderTotal[0]%>;
						var gender1 = <%= genderTotal[1]%>;
						
						var age0 = <%= ageTotal[0]%>;
						var age1 = <%= ageTotal[1]%>;
						var age2 = <%= ageTotal[2]%>;
						var age3 = <%= ageTotal[3]%>;
						var age4 = <%= ageTotal[4]%>;
						
						//document.write(age0+"/");
						//document.write(age1+"/");
						//document.write(age2+"/");
						//document.write(age3+"/");
						//document.write(age4);
						
					
						var answerYes = <%=answerY%>;
						var answerNo = <%=answerN%>;
					</script>
					
					<div class="rank_container">
					<canvas id ="myChart<%=i%>" class="myChart"></canvas>
					<script>
						var ctx = document.getElementById("myChart<%=i%>");
						var myChart = new Chart(ctx, {
						    type: 'bar',
						    data: {
						        labels: ["Yes", "No"],
						        datasets: [{
						            label: "Yes!",
						            data: [answerYes, answerNo],
						            backgroundColor: [
						                'rgba(54, 162, 235, 0.3)',
						                'lightgrey',
						            ],
						            borderColor: [
						                'rgba(54, 162, 235, 1)',
						                'grey',
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
					<canvas id ="myChart<%=i%>_age" class="myChart"></canvas>
					<script>
						var ctx = document.getElementById("myChart<%=i%>_age");
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
					<!------------------------------------------------------------>
					
					<% 
					out.print("<br>");
					//out.println("yes>>"+rank.getAnswerYes()+"/no>>"+rank.getAnswerNo()+"<br>");
				}
			}
			
			%>
			<!-- 
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
				
			  -->
			 <!-- 
				<div class="rank_container">
					<canvas id ="myChart1" class="myChart"></canvas>
					<script>
						var ctx = document.getElementById("myChart1");
						var myChart = new Chart(ctx, {
						    type: 'bar',
						    data: {
						        labels: ["Yes", "No"],
						        datasets: [{
						            label: "性別",
						            data: [answerYes, answerNo],
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
				 -->
			</div>
			
			<footer>
				<form method="post" action="LogoutController">
					<input type="submit" class="btn" name="LOGOUT" value="ログアウト">			
				</form>
			</footer>
			
		</div>
	</body>
</html>
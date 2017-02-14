<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
	<%
		String err = "";
		if(request.getAttribute("err") != null){
			err = (String)request.getAttribute("err");	
		};
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>index page</title>
		
		<link rel="stylesheet" type="text/css" href="css/style.css">
		
	</head>
	<body>
	
		<form method="post" action="LoginController">
			
			<div class="box_container">
				<label for="inp_id">ＩＤ</label>
				<input type="text" id="inp_id" name="inp_id">
				
				<br>
				
				<label for="inp_pw">ＰＷ</label>
				<input type="password" id="inp_pw" name="inp_pw">
				
				<br>
				<div class="btn">
					<input type="submit" class="btn" value="ログイン">
				</div>
			</div>
			
			<div>
				<br><p class="err"> <%=err %> </p><br>
			</div>
			
			<div class="box_container">
				<label for="reg">IDを持ってない方はこちら！<br>１分で簡単登録！</label>
				<br>
				<div class="btn">
					<input type="submit" id="reg" value="新規登録" name="reg">
				</div>
			</div>
			
		</form>
	
	</body>
</html>
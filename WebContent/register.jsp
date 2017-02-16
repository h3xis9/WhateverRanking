<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="css/style_reg.css">
		<script type="text/javascript" src="js/form_check.js"></script>
	
	</head>
	
	<body>
		<div class="form_style">
			<form name="Form1" method="post" action="register.jsp" onSubmit="return formCheck()">
			    <h1>会員登録</h1>
			    <p id="outp"></p>
			    <div class="form_upper">
				    <dl>
				      <dt>メールアドレス<span class="bullet">※</span></dt>
				      <dd>
				        <small id="notice-input-text-1" style="display: none; color: #ea5506;"> 【メールアドレスを入力して下さい】</small>
				        <input type="text" size="40" placeholder="メールアドレスを入力" id="InputText1" name="email" />
				      </dd>
				    </dl>
				    
				    <dl>
				      <dt>パスワード<span class="bullet">※</span></dt>
				      <dd>
				        <small id="notice-input-text-2" style="display: none; color: #ea5506;"> 【パスワードを入力して下さい】</small>
				        <input type="password" size="40" placeholder="パスワードを入力" id="InputText2" name=pw />
				      </dd>
				    </dl>
				    
				    <dl>
				      <dt>パスワードの確認<span class="bullet">※</span></dt>
				      <dd>
				        <small id="notice-input-text-3" style="display: none; color: #ea5506;"> 【パスワードをもう一度入力して下さい】</small>
				        <input type="password" size="40" placeholder="パスワードを再入力" id="InputText3" />
				      </dd>
				    </dl>
			    </div>
			    
			    <div class="form_bottom">
				    <dl>
				      <dt>ニックネーム<span class="bullet">※</span></dt>
				      <dd>
				        <small id="notice-input-text-4" style="display: none; color: #ea5506;"> 【ニックネームを入力して下さい】</small>
				        <input type="text" size="40" placeholder="ニックネームを入力" id="InputText4" />
				      </dd>
				    </dl>
				    <dl>
				      <dt>性別<span class="bullet">※</span></dt>
				      <dd>
				        <input type="radio" name="gender" id="man" value="0" checked>
				        <label for="man">男</label>
				        <input type="radio" name="gender" id="woman" value="1">
				        <label for="woman">女</label>
				      </dd>
				    </dl>
				    <dl>
				      <dt>年齢<span class="bullet">※</span></dt>
				      <dd>
				      <small id="warning_age" style="display: none; color: #ea5506;"> 【年齢を入力して下さい】</small>
						<select name="age" id="select_age">
							<option value="0">--</option>
							<option value="1">10代</option>
							<option value="2">20代</option>
							<option value="3">30代</option>
							<option value="4">40代</option>
							<option value="5">50代以上</option>
						</select>
						<br>
				      </dd>
				    </dl>
			    </div>

			    <div class="btn">
			      <input type="submit" name="act" value="送信する">
			    </div>
			</form>
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<style>
			
			
			
			.form_style{
				width: 90%;
				padding: 12px;
				margin: 0 auto;
			}
			
			
			.form_upper{
				padding-left: 3%;
				
			}
			.form_bottom{
				padding-left: 3%;
				margin-bottom: 3%;
			}
			
			
			dl {
				border-bottom: 1px solid #eee;
				padding: 2% 0;
				margin: 0;
			}
			
			
			/*　※マーク処理　*/
			.bullet{
				color: dodgerblue;
				font-size: 1em;
				font-weight: bold;
			}
			
			
			/*送信ボタン*/
			.btn{
				margin-top: 5%;
			}
						
			input[type="submit"] {
				background: rgba(31, 144, 255, 0.65);
				border: none;
				color: #fff;
				font-weight: bold;
				height: 5em;
				line-height: 5em;
				width: 50%;
				display: block;/*ブロック要素として表示する*/
				margin: 0 auto;/*センターに表示*/
				text-align: center;
				border-radius : 10px;
				cursor: pointer;/*カーソルの変更*/
				outline:none;/*クリック時の枠線を消す*/
			}
			
			input[type="submit"]:hover {
				background: dodgerblue;
			}
		</style>
		<script type="text/javascript">
				
			function formCheck(){
			    
			    //var flag = 0;
			    
	
			    var flag = 0;
			    
			    var i = 0;
			    
			    while(i<4){
				    var strIndex = (i+1) + "";
				    if( document.getElementById("InputText" + strIndex).value == "" ){
					    flag = 1;
					    document.getElementById("notice-input-text-" + strIndex).style.display = "block";
					}else{
						document.getElementById("notice-input-text-" + strIndex).style.display = "none";
					}
				    i++;
			    }
			    
			    if( flag ){
			        window . alert( '必須項目は全て入力して下さい。' );
			        return false;
			    }else{
			        return true;
			    }
			    
			    
			    /*
			    if( document . Form1 . InputText1 . value == "" ){
				    
			        flag = 1;
			        document . getElementById( 'notice-input-text-1' ) . style . display = "block";
			        
			    }else if( document.Form1.InputText2.value == "" ){
				    
				    flag = 1;
			        document . getElementById( 'notice-input-text-2' ) . style . display = "block";
			        
				}else if( document.Form1.InputText3.value == "" ){
				    
				    flag = 1;
			        document . getElementById( 'notice-input-text-3' ) . style . display = "block";
			        
				}else if( document.Form1.InputText4.value == "" ){
				    
				    flag = 1;
			        document . getElementById( 'notice-input-text-4' ) . style . display = "block";
			        
				}else{
			        
			        document . getElementById( 'notice-input-text-1' ) . style . display = "none";
			        document . getElementById( 'notice-input-text-2' ) . style . display = "none";
			        document . getElementById( 'notice-input-text-3' ) . style . display = "none";
			        document . getElementById( 'notice-input-text-4' ) . style . display = "none";
			        
			        
			    }
			   
			    if( flag ){
			        window . alert( '必須項目は全て入力して下さい。' );
			        return false;
			    }else{
			        return true;
			    }
			    
			    */
			}
				
		</script>
	
	</head>
	
	<body>
		<div class="form_style">
			<form name="Form1" method="post" action="#" onSubmit="return formCheck()">
			    <h1>会員登録</h1>
			    <p id="outp"></p>
			    <div class="form_upper">
				    <dl>
				      <!--<dl>はDefinition Listの略で、<dl>～</dl>の範囲が定義リスト-->
				      <dt>メールアドレス<span class="bullet">※</span></dt>
				      <dd>
				        <small id="notice-input-text-1" style="display: none; color: #ea5506;"> 【メールアドレスを入力して下さい】</small>
				        <input type="text" size="40" placeholder="メールアドレスを入力" id="InputText1" />
				      </dd>
				    </dl>
				    
				    <dl>
				      <!--<dl>はDefinition Listの略で、<dl>～</dl>の範囲が定義リスト-->
				      <dt>パスワード<span class="bullet">※</span></dt>
				      <dd>
				        <small id="notice-input-text-2" style="display: none; color: #ea5506;"> 【パスワードを入力して下さい】</small>
				        <input type="text" size="40" placeholder="パスワードを入力" id="InputText2" />
				      </dd>
				    </dl>
				    
				    <dl>
				      <!--<dl>はDefinition Listの略で、<dl>～</dl>の範囲が定義リスト-->
				      <dt>パスワードの確認<span class="bullet">※</span></dt>
				      <dd>
				        <small id="notice-input-text-3" style="display: none; color: #ea5506;"> 【パスワードをもう一度入力して下さい】</small>
				        <input type="text" size="40" placeholder="パスワードを再入力" id="InputText3" />
				      </dd>
				    </dl>
			    </div>
			    
			    <div class="form_bottom">
				    <dl>
				      <!--<dl>はDefinition Listの略で、<dl>～</dl>の範囲が定義リスト-->
				      <dt>名前<span class="bullet">※</span></dt>
				      <dd>
				        <small id="notice-input-text-4" style="display: none; color: #ea5506;"> 【名前を入力して下さい】</small>
				        <input type="text" size="40" placeholder="名前を入力" id="InputText4" />
				      </dd>
				    </dl>
				    <dl>
				      <dt>性別<span class="bullet">※</span></dt>
				      <dd>
				        <input type="radio" name="sex" id="man" value="1" checked>
				        <label for="man">男</label>
				        <input type="radio" name="sex" id="woman" value="2">
				        <label for="woman">女</label>
				      </dd>
				    </dl>
				    <dl>
				      <dt>生年月日</dt>
				      <dd>
						<select name="select">
						<option value="">--</option>
							<option value="1900">1900</option>
							<option value="1901">1901</option>
							<option value="1902">1902</option>
							<option value="1903">1903</option>
							<option value="1904">1904</option>
							<option value="1905">1905</option>
							<option value="1906">1906</option>
							<option value="1907">1907</option>
							<option value="1908">1908</option>
							<option value="1909">1909</option>
							<option value="1910">1910</option>
							<option value="1911">1911</option>
							<option value="1912">1912</option>
							<option value="1913">1913</option>
							<option value="1914">1914</option>
							<option value="1915">1915</option>
							<option value="1916">1916</option>
							<option value="1917">1917</option>
							<option value="1918">1918</option>
							<option value="1919">1919</option>
							<option value="1920">1920</option>
							<option value="1921">1921</option>
							<option value="1922">1922</option>
							<option value="1923">1923</option>
							<option value="1924">1924</option>
							<option value="1925">1925</option>
							<option value="1926">1926</option>
							<option value="1927">1927</option>
							<option value="1928">1928</option>
							<option value="1929">1929</option>
							<option value="1930">1930</option>
							<option value="1931">1931</option>
							<option value="1932">1932</option>
							<option value="1933">1933</option>
							<option value="1934">1934</option>
							<option value="1935">1935</option>
							<option value="1936">1936</option>
							<option value="1937">1937</option>
							<option value="1938">1938</option>
							<option value="1939">1939</option>
							<option value="1940">1940</option>
							<option value="1941">1941</option>
							<option value="1942">1942</option>
							<option value="1943">1943</option>
							<option value="1944">1944</option>
							<option value="1945">1945</option>
							<option value="1946">1946</option>
							<option value="1947">1947</option>
							<option value="1948">1948</option>
							<option value="1949">1949</option>
							<option value="1950">1950</option>
							<option value="1951">1951</option>
							<option value="1952">1952</option>
							<option value="1953">1953</option>
							<option value="1954">1954</option>
							<option value="1955">1955</option>
							<option value="1956">1956</option>
							<option value="1957">1957</option>
							<option value="1958">1958</option>
							<option value="1959">1959</option>
							<option value="1960">1960</option>
							<option value="1961">1961</option>
							<option value="1962">1962</option>
							<option value="1963">1963</option>
							<option value="1964">1964</option>
							<option value="1965">1965</option>
							<option value="1966">1966</option>
							<option value="1967">1967</option>
							<option value="1968">1968</option>
							<option value="1969">1969</option>
							<option value="1970">1970</option>
							<option value="1971">1971</option>
							<option value="1972">1972</option>
							<option value="1973">1973</option>
							<option value="1974">1974</option>
							<option value="1975">1975</option>
							<option value="1976">1976</option>
							<option value="1977">1977</option>
							<option value="1978">1978</option>
							<option value="1979">1979</option>
							<option value="1980">1980</option>
							<option value="1981">1981</option>
							<option value="1982">1982</option>
							<option value="1983">1983</option>
							<option value="1984">1984</option>
							<option value="1985">1985</option>
							<option value="1986">1986</option>
							<option value="1987">1987</option>
							<option value="1988">1988</option>
							<option value="1989">1989</option>
							<option value="1990">1990</option>
							<option value="1991">1991</option>
							<option value="1992">1992</option>
							<option value="1993">1993</option>
							<option value="1994">1994</option>
							<option value="1995">1995</option>
							<option value="1996">1996</option>
							<option value="1997">1997</option>
							<option value="1998">1998</option>
							<option value="1999">1999</option>
							<option value="2000">2000</option>
							<option value="2001">2001</option>
							<option value="2002">2002</option>
							<option value="2003">2003</option>
							<option value="2004">2004</option>
							<option value="2005">2005</option>
							<option value="2006">2006</option>
							<option value="2007">2007</option>
							<option value="2008">2008</option>
							<option value="2009">2009</option>
							<option value="2010">2010</option>
							<option value="2011">2011</option>
							<option value="2012">2012</option>
							<option value="2013">2013</option>
							<option value="2014">2014</option>
							<option value="2015">2015</option>
							<option value="2016">2016</option>
						</select>
						年 
						<SELECT name="month">
						<option value="">--</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</SELECT>
						月 
						<SELECT name="day">
							<option value="">--</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
						</select>
						日 <br>
						<br>
				      </dd>
				    </dl>

				    <dl>
				      <dt>住所</dt>
				      <dd>
				        <select name="都道府県">
				          <option value="">都道府県を選択してください。</option>
				          <optgroup label="北海道・東北">
				          <option value="北海道">北海道</option>
				          <option value="青森県">青森県</option>
				          <option value="秋田県">秋田県</option>
				          <option value="岩手県">岩手県</option>
				          <option value="山形県">山形県</option>
				          <option value="宮城県">宮城県</option>
				          <option value="福島県">福島県</option>
				          </optgroup>
				          <optgroup label="甲信越・北陸">
				          <option value="山梨県">山梨県</option>
				          <option value="長野県">長野県</option>
				          <option value="新潟県">新潟県</option>
				          <option value="富山県">富山県</option>
				          <option value="石川県">石川県</option>
				          <option value="福井県">福井県</option>
				          </optgroup>
				          <optgroup label="関東">
				          <option value="茨城県">茨城県</option>
				          <option value="栃木県">栃木県</option>
				          <option value="群馬県">群馬県</option>
				          <option value="埼玉県">埼玉県</option>
				          <option value="千葉県">千葉県</option>
				          <option value="東京都">東京都</option>
				          <option value="神奈川県">神奈川県</option>
				          </optgroup>
				          <optgroup label="東海">
				          <option value="愛知県">愛知県</option>
				          <option value="静岡県">静岡県</option>
				          <option value="岐阜県">岐阜県</option>
				          <option value="三重県">三重県</option>
				          </optgroup>
				          <optgroup label="関西">
				          <option value="大阪府">大阪府</option>
				          <option value="兵庫県">兵庫県</option>
				          <option value="京都府">京都府</option>
				          <option value="滋賀県">滋賀県</option>
				          <option value="奈良県">奈良県</option>
				          <option value="和歌山県">和歌山県</option>
				          </optgroup>
				          <optgroup label="中国">
				          <option value="岡山県">岡山県</option>
				          <option value="広島県">広島県</option>
				          <option value="鳥取県">鳥取県</option>
				          <option value="島根県">島根県</option>
				          <option value="山口県">山口県</option>
				          </optgroup>
				          <optgroup label="四国">
				          <option value="徳島県">徳島県</option>
				          <option value="香川県">香川県</option>
				          <option value="愛媛県">愛媛県</option>
				          <option value="高知県">高知県</option>
				          </optgroup>
				          <optgroup label="九州・沖縄">
				          <option value="福岡県">福岡県</option>
				          <option value="佐賀県">佐賀県</option>
				          <option value="長崎県">長崎県</option>
				          <option value="熊本県">熊本県</option>
				          <option value="大分県">大分県</option>
				          <option value="宮崎県">宮崎県</option>
				          <option value="鹿児島県">鹿児島県</option>
				          <option value="沖縄県">沖縄県</option>
				          </optgroup>
				        </select>
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
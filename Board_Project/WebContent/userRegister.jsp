<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<style>
			* {
				box-sizing: border-box;
			  	font-family: Arial, Helvetica, sans-serif;
			}
			body { margin: 0; font-family: Arial, Helvetica, sans-serif; background-image: url('img/bg_1.jpg');	}
			.topnav { overflow: hidden;	background-color: rgba(255,255,255,0); font-size: 18px;}
			.topnav a {
				float: right;
			  	display: block;
			  	color: black;
			  	text-align: center;
			  	padding: 14px 16px;
			  	text-decoration: none;
			}
			.dropdown { float: right; display: inline-block; }
			.dropdown-content {
				display: none;
				position: absolute;
				background-color: #f9f9f9;
				box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
				z-index: 1;
			}
			.dropdown-content a {
				color: black;
				padding: 14px 16px;
				text-decoration: none;
				display: block;
			}
			.dropdown-content a:hover {background-color: #f1f1f1}
			.dropdown:hover .dropdown-content { display: block; }
			.dropbtn {
				background-color: rgba(255,255,255,0);
			  	color: black;
			  	padding: 14px 16px;
			  	font-size: 18px;
			  	border: none;
			  	cursor: pointer;
			}
			.content {
			  	padding: 10px;
			  	height: 400px;
			  	text-align: center;
			  	margin-top: 100px;
			  	font-size: 18px;
			}
		</style>
	</head>
	
	<body>
		<div class="topnav">
			<div class="dropdown">
				<button class="dropbtn">접속하기</button>
				<div class="dropdown-content">
					<a href="login.jsp">로그인</a>
					<a href="userRegister.jsp">회원가입</a>
				</div>
			</div>
			<a href="main.jsp" style="float:left; font-weight:700;">PlayData</a></li>
			<a href="map.jsp">지도</a>
			<a href="board.jsp">게시판</a>
			<a href="main.jsp">메인</a>
		</div>
		
		<div class="content">
			<form action="UserRegisterServlet" method="post">
				<h2><b>회원가입</b></h2>
				<div class="form-group">
					<label>ID : </label>
					<input type="text" placeholder="아이디" name="id" maxlength="30">
					<a href="checkIdServlet"></a>
				</div>
				<br>
				<div class="form-group">
					<label>비밀번호 : </label>
					<input type="password" id="userPassword" placeholder="숫자 4~12자리" name="userPassword" minlength="4" maxlength="12">
				</div>
				<br>
				<div class="form-group">
					<label>비밀번호 확인 : </label>
					<input type="password" id="checkPassword" placeholder="비밀번호 확인" name="checkPassword" maxlength="12">
					<input type="button" value="확인" onclick="check()">
				</div>
				<div id ="my"></div>
				<br>
				<div class="form-group">
					<label>이름 : </label>
					<input type="text" placeholder="이름" name="name" maxlength="20">
				</div>
				<br>
				<div class="form-group">
					<label>이메일 : </label>
					<input type="email" placeholder="이메일" name="email" maxlength="50">
				</div>
				<br>
				<div data=toggle="buttons">
					<label>
						<input type="radio" name="gender" autocomplete="off" value="남자" checked>남자
					</label>
					<label>
						<input type="radio" name="gender" autocomplete="off" value="여자">여자
					</label>
				</div>
				<br>
				<input type="submit" class="btn btn-primary form-control" style="width: 180pt; height: 20pt;" value="회원가입">
			</form>
		</div>
		
		<script type= "text/javascript">
			const userPassword  = document.getElementById("userPassword");
			const checkPassword = document.getElementById("checkPassword");
			
			const check = () => {
				if (userPassword.value.length < 4 | userPassword.value.length > 12) {
					document.getElementById("my").innerHTML="<font color='red'>4~12자리의 숫자를 입력해주세요.</font>";
					checkPassword.value = "";
					userPassword.value = "";
				}else if(userPassword.value === checkPassword.value) {
					document.getElementById("my").innerHTML="<font color='blue'>비밀번호가 일치합니다.</font>";
				}else{
					document.getElementById("my").innerHTML="<font color='red'>비밀번호가 일치하지 않습니다.</font>";
					checkPassword.value = "";
				}
			}
		</script>
	</body>
</html>
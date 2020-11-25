<%@page import="encore.board.vo.UserVO"%>
<%@page import="encore.board.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보수정</title>
		<style type="text/css">
			body {
				margin: 0px;
				background-image: url('img/bg_1.jpg')
			}
			#nav-bar {
				list-style-type: none;
				margin: 0;
				padding: 0;
				overflow: hidden;
				background-color: rgba(255,255,255,0);
			}
			li { float: right; list-style-type: none; }
			li a {
				display: block;
				color: black;
				text-align: center;
				padding: 14px 16px;
				text-decoration: none;
				font-size: 18px;
			}
			.dropdown { float: right; display: inline-block; }
			.dropdown-content {
				display: none;
				position: absolute;
				background-color: #f9f9f9;
				min-width: 160px;
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
		</style>
	</head>
	
	<body>
		<%
			String userID = null;
			if(session.getAttribute("id") != null){
				userID = (String)session.getAttribute("id");
			}
		%>
		
		<div class="nav-bar">
			<div class="dropdown">
				<button class="dropbtn">회원관리</button>
				<div class="dropdown-content">
					<a href="logout.jsp">로그아웃</a>
					<a href="userUpdate.jsp">정보수정</a>
					<a href="userDelete.jsp">회원탈퇴</a>
				</div>
			</div>

			<ul>
				<li style="float:left; font-weight:700;"><a href="main.jsp">PlayData</a></li>
				<li><a href="map.jsp">지도</a></li>
				<li><a href="board.jsp">게시판</a></li>
				<li><a href="main.jsp">메인</a></li>
			</ul>
		</div>
		
		<div class="container">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div class="jumbotron" style="padding-top: 20px;">
					<form method="post" action="UserUpdateServlet">
						<h3 style="text-align:center;">회원정보 수정</h3><br>
						<%
							UserDAO dao = new UserDAO();
							UserVO user = dao.getUserInfo((String) session.getAttribute("id"));
						%>
						ID : <div class="form-group">
							<input type="text" class="form-control" name="id" maxlength="20" value="<%=user.getUserID()%>" readonly>
						</div>
						비밀번호 : <div class="form-group">
							<input type="password" class="form-control" id="userPassword" name="userPassword" maxlength="20" value="<%=user.getUserPassword()%>">
						</div>
						비밀번호 확인 : <div class="form-group">
							<input type="password" class="form-control" id="checkPassword"  name="checkPassword" maxlength="20" value="<%=user.getUserPassword()%>">
							<div id ="my"></div><br>
							<input type="button" style="width:40pt;height:25pt;" class="btn btn-primary form-control" value="확인" onclick="check()">
						</div>
							
							
						이름 : <div class="form-group">
							<input type="text" class="form-control" name="name" maxlength="20" value="<%=user.getUserName()%>">
						</div>
						이메일 : <div class="form-group">
							<input type="email" class="form-control" name="email" maxlength="50" value="<%=user.getUserEmail()%>">
						</div>
						<div class="form-group" style="text-align:center;">
							<%if (user.getUserGender() == "남자") {%>
							<div class="btn-group" data=toggle="buttons">
								<label class="btn btn-primary activate">
									<input type="radio" name="gender" autocomplete="off" value="남자" checked>남자
								</label>
								<label class="btn btn-primary activate">
									<input type="radio" name="gender" autocomplete="off" value="여자">여자
								</label>
							</div>
							<%} else {%>
							<div class="btn-group" data=toggle="buttons">
								<label class="btn btn-primary activate">
									<input type="radio" name="gender" autocomplete="off" value="남자">남자
								</label>
								<label class="btn btn-primary activate">
									<input type="radio" name="gender" autocomplete="off" value="여자" checked>여자
								</label>
							</div>
							<%} %>
						</div>
						<table>
						<td><input type="submit" style="width:70pt;height:25pt;" class="btn btn-primary form-control" value="수정"></td>
						<td><div class="col-lg-4"></td>
						<td><input align="right" style="width:70pt;height:25pt;" type="button" class="btn btn-primary form-control" value="취소" onclick="history.back();"><td>
 						</table>
 					</form>
				</div>
			</div>
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
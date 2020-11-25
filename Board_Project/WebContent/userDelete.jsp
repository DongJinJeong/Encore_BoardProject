<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="encore.board.vo.UserVO"%>
<%@page import="encore.board.dao.UserDAO"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원탈퇴</title>
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
		<script type="text/javascript">
	        function checkValue(){
	        	var userPassword = document.getElementById("userPassword");
	            if(userPassword.value === ""){
	                alert("비밀번호를 입력하지 않았습니다.");
	                location.href="userDelete.jsp"
	            }
	        }
    	</script>
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
					<form method="post" action="UserDeleteServlet" onsubmit="checkValue()">
						<h3 style="text-align:center;">회원 탈퇴</h3><br>
						<h4 style="text-align:center;">비밀번호를 입력하시오.</h4><br>
						<%
							UserDAO dao = new UserDAO();
							UserVO user = dao.getUserInfo((String) session.getAttribute("id"));
						%>
						
						ID : <div class="form-group">
							<input type="text" class="form-control" name="id" maxlength="20" value="<%=user.getUserID()%>" readonly>
						</div>
						비밀번호 : <div class="form-group">
							<input type="password" class="form-control" id="userPassword" name="userPassword" maxlength="20">
						</div>
						
						<table>
							<td><input type="submit" style="width:70pt;height:25pt;" class="btn btn-primary form-control" value="탈퇴"></td>
							<td><div class="col-lg-4"></td>
							<td><input align="right" style="width:70pt;height:25pt;" type="button" class="btn btn-primary form-control" value="취소" onclick="history.back();"><td>
 						</table>
 					</form>
				</div>
			</div>
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="encore.board.dao.BoardDAO"%>
<%@page import="encore.board.vo.BoardVO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>글쓰기 수정</title>
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
			
			int board_no = 0;
			if(request.getParameter("board_no") != null){
				board_no = Integer.parseInt(request.getParameter("board_no"));
			}
			if(board_no == 0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글입니다.')");
				script.println("location.href='boardForm.jsp'");
				script.println("</script>");
			}
			
			BoardVO boardVO = new BoardDAO().getBoard(board_no);
		%>
		
		<div class="nav-bar">
			<%
				// 로그인이 되어 있지 않다면
				if(userID == null){
			%>
					<div class="dropdown">
						<button class="dropbtn">접속하기</button>
						<div class="dropdown-content">
							<a href="login.jsp">로그인</a>
							<a href="userRegister.jsp">회원가입</a>
						</div>
					</div>
			<%
				} else {
			%>
					<div class="dropdown">
						<button class="dropbtn">회원관리</button>
						<div class="dropdown-content">
							<a href="logout.jsp">로그아웃</a>
							<a href="userUpdate.jsp">정보수정</a>
							<a href="userDelete.jsp">회원탈퇴</a>
						</div>
					</div>
			<%
				}
			%>
			<ul>
				<li style="float:left; font-weight:700;"><a href="main.jsp">PlayData</a></li>
				<li><a href="map.jsp">지도</a></li>
				<li><a href="board.jsp">게시판</a></li>
				<li><a href="main.jsp">메인</a></li>
			</ul>
		</div>
		
		<div class="container">
			<div class="row">
				<form method="post" action="boardUpdate.jsp?board_no=<%=board_no %>">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 수정 양식</th>
							</tr>		
						</thead>
						<tbody>
							<tr>
								<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50" value=<%=boardVO.getTitle() %>></td>
							</tr>
							<tr>
								<td><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="height: 350px;"><%=boardVO.getContent() %></textarea></td>
							</tr>
						</tbody>
					</table>
					<input type="submit" class="btn btn-primary pull-right" value="글 수정">
				</form>
			</div>
		</div>
	</body>
</html>
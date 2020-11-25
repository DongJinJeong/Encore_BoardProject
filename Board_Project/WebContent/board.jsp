<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="encore.board.vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="encore.board.dao.BoardDAO"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판</title>
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
			  	margin-top: 150px;
			}
		</style>
	</head>
	
	<body>
		<%
			String userID = null;
			if(session.getAttribute("id") != null){
				userID = (String)session.getAttribute("id");
			}
			
			int pageNumber = 1;
			if(request.getParameter("pageNumber") != null){
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			}
		%>
		<div class="topnav">
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
			<a href="main.jsp" style="float:left; font-weight:700;">PlayData</a></li>
			<a href="map.jsp">지도</a>
			<a href="board.jsp">게시판</a>
			<a href="main.jsp">메인</a>
		</div>
		
		<div class="content">
			<table style="width:800px; margin: auto;">
				<thead>
					<tr heigh="30">
						<td style="background-color: #337ab7; color: #fff;">글번호</td>
						<td style="background-color: #337ab7; color: #fff;">작성자</td>
						<td style="background-color: #337ab7; color: #fff;">제목</td>
						<td style="background-color: #337ab7; color: #fff;">작성일</td>
						<td style="background-color: #337ab7; color: #fff;">조회수</td>
						<td style="background-color: #337ab7; color: #fff;">추천수</td>
					</tr>    
				</thead>
				<tbody>
					<%
						BoardDAO boardDAO = new BoardDAO();
						ArrayList<BoardVO> list = boardDAO.getList(pageNumber);
						for(int i = 0; i < list.size(); i++){
					%>
							<tr>
								<td><%=list.get(i).getBoard_no() %></td>
								<td><%=list.get(i).getUserID() %></td>
								<td><a href="BoardDetailServlet?boardNo=<%=list.get(i).getBoard_no() %>"><%=list.get(i).getTitle() %></a></td>
								<td><%=list.get(i).getReg_date() %></td>
								<td><%=list.get(i).getViews() %></td>
								<td><%=list.get(i).getLikes() %></td>
							</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<p>
			<a href="boardWriteForm.jsp"><button style="width: 500pt; height: 20pt; font-size: 18px;">글쓰기</button></a>
			<p>
			<%
				if(pageNumber != 1){
			%>
					<a href="board.jsp?pageNumber=<%=pageNumber - 1 %>"><button>이전</button></a>
			<%
				}if(boardDAO.nextPage(pageNumber + 1)){
			%>
					<a href="board.jsp?pageNumber=<%=pageNumber + 1 %>"><button>다음</button></a>
			<%
				}
			%>
	    <br>
	    <div id="searchForm">
	        <form>
	            <select name="opt">
	                <option value="0">제목</option>
	                <option value="1">내용</option>
	                <option value="2">제목+내용</option>
	                <option value="3">글쓴이</option>
	            </select>
	            <input type="text" size="20" name="condition"/>
	            <input type="submit" value="검색"/>
	        </form>    
	    </div>
		</div>
	</body>
</html>
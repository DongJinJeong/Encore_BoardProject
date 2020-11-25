<%@page import="encore.board.dao.BoardDAO"%>
<%@page import="encore.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 삭제</title>
	</head>
		
	<body>
		<%
			// 세션
			String userID = null;
			if(session.getAttribute("id") != null){
				userID = (String)session.getAttribute("id");
			}
			if(userID == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인을 하세요.')");
				script.println("location.href='login.jsp'");
				script.println("</script>");
			} 
			// 글 번호를 받아와 int 타입으로 바꿈
			int board_no = 0;
			if(request.getParameter("board_no") != null){
				board_no = Integer.parseInt(request.getParameter("board_no"));
			}
			// 글 번호 못받았을 때
			if(board_no == 0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글입니다.')");
				script.println("location.href='board.jsp'");
				script.println("</script>");
			}
			BoardVO boardVO = new BoardDAO().getBoard(board_no);
			if(!userID.equals(boardVO.getUserID())){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('권한이 없습니다.')");
				script.println("location.href='board.jsp'");
				script.println("</script>");
			}else{
					BoardDAO boardDAO = new BoardDAO();
					int result = boardDAO.delete(board_no);
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글 삭제에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}else{
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href='board.jsp'");
						script.println("</script>");
					}
				}
		%>
	</body>
</html>
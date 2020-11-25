<%@page import="encore.board.dao.BoardDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
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
	request.setCharacterEncoding("UTF-8");
	int board_no = 0;
	if(request.getParameter("board_no") != null){
		board_no = Integer.parseInt(request.getParameter("board_no"));
	}
	BoardDAO boardDAO = new BoardDAO();
	int result = boardDAO.getLikes(board_no);
	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('추천이 완료되었습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
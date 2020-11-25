<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾은 비밀번호</title>
</head>
<body>
	<%
		String password = (String) request.getAttribute("password");
		if (password != null) {
	%>
			<label>귀하의 패스워드는 <%=password%>입니다.</label>
	<%
		} else {
	%>
			<script>
				alert('가입되어있는 ID가 아닙니다.');
				history.back();
			</script>
	<%
		}
	%>
	<a href="login.jsp">
		<button>로그인하러가기</button>
</body>
</html>
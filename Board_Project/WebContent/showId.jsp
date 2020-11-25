<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾은 아이디</title>
</head>
<body>
	<%
		String id = (String) request.getAttribute("id");
		if (id != null) {
	%>
			<label>귀하의 ID는 <%=id%> 입니다. </label>
	<%
		} else {
	%>
			<script>
				alert('가입되어있지 않은 이메일 입니다.');
				history.back();
			</script>
	<%
		}
	%>
 	<a href="login.jsp">
		<button>로그인하러가기</button>

</body>
</html>
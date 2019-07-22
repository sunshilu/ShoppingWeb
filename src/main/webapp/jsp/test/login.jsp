<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/jsp/header.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/test/login.do"
		method="post">
		<input type="text" name="code" /> <input type="submit" value="登录" />
	</form>

</body>
</html>
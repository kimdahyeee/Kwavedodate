<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/main.css"/>">
	<title>Home</title>
</head>
<body>
<p> <a href="<c:url value="/user/logout"/>">Logout</a> </p>

<p> <c:out value="${auth }"></c:out> </p>

<p> <c:out value="${vo }"></c:out> </p>

</body>
</html>
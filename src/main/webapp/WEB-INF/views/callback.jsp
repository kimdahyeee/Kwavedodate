<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%> 
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<c:set var="pInfo" value="${facebookProfile}"></c:set>
	 
	 
	    <title>facebook 로그인 하기 Sample</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script type="text/javascript">
	$(opener.document).find("#LoginForm").submit();
	self.close();
	</script>



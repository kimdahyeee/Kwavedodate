<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%> 
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<c:set var="pInfo" value="${facebookInfo}"></c:set>
	 
 myEmail: ${pInfo.myEmail}
myName: ${pInfo.myName}




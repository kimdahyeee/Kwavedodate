	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
	<section class="main-container jumbotron light-gray-bg text-center margin-clear">
		<div class="container">
			<div class="row">
				<div class="main col-md-6 col-md-offset-3 pv-40">
					<h1 class="page-title"><span class="text-default"><c:out value='${errCode}'/></span></h1>
					<h2>Ooops! <c:out value='${errSubejct}'/></h2>
					<p><c:out value='${msg}'/></p>
					
					<a href="<c:url value='/'/>" class="btn btn-default btn-animated btn-lg">Return Home <i class="fa fa-home"></i></a>
				</div>
				<!-- main end -->

			</div>
		</div>
	</section>
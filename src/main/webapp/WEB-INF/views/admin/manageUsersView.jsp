<%@ page language="java" contentType="text/htmll; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<section class="main-container">
		<div class="container">
			<div class="row">	
				<div class="table-responsive" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
					<table class="table table-colored text-center">
						<thead>
							<tr>
								<th>User Email</th>
								<th>User Name</th>
								<th>Reg Date</th>
								<th>Is SNS</th>
								<th>Detail</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${fn:length(allUsersList) > 0}">
								<c:forEach items="${allUsersList}" varStatus="status">
								<tr>
									<td>${allUsersList[status.index].userEmail }</td>
									<td>${allUsersList[status.index].userName }</td>
									<td>${allUsersList[status.index].userRegDate }</td>
									<td>${allUsersList[status.index].isSns }</td>
									<td><a href='<c:url value="/admin/userDetail?userEmail=${allUsersList[status.index].userEmail}"/>'>보기</a></td>
								</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
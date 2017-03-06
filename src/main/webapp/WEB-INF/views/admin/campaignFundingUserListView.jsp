	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
	<section class="main-container">
		<div class="container">
			<div class="row">	
				<div class="table-responsive" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
					<h3>${campaignName}에 후원한 회원 리스트</h3>
					<table class="table table-colored text-center">
						<thead>
							<tr>
								<th>User Email</th>
								<th>Reward</th>
								<th>Funding Amount</th>
								<th>Paid At</th>
								<th>Detail</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${fn:length(fundingUserList) > 0}">
								<c:forEach items="${fundingUserList}" varStatus="status">
									<tr>
										<td><strong>${fundingUserList[status.index].userEmail}</strong></td>
										<td>
											<strong><c:if test="${not empty fundingUserList[status.index].rewardSubject}">${fundingUserList[status.index].rewardSubject}</c:if></strong>
										</td>
										<td>$${fundingUserList[status.index].totalAmount}</td>
										<td>${fundingUserList[status.index].paid_at}</td>
										<td><a href="<c:url value='/admin/paymentDetail?impUid=${fundingUserList[status.index].imp_uid}&userEmail=${fundingUserList[status.index].userEmail}'/>">보기</a></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
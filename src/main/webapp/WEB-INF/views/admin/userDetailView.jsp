


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
								<th colspan="4">User Detail</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>User Email</th>
								<td>${userDetail.userEmail}</td>
								<th>Zip Code</th>
								<td>${userDetail.zipCode}</td>
							</tr>
							<tr>
								<th>User Name</th>
								<td>${userDetail.userName}</td>
								<th>Address</th>
								<td>${userDetail.address1}</td>
							</tr>
							<tr>
								<th>Is SNS</th>
								<td>${userDetail.isSns}</td>
								<th>Address Detail</th>
								<td>${userDetail.address2}</td>
							</tr>
							<tr>
								<th>Phone Number</th>
								<td>${userDetail.phone}</td>
								<th>City</th>
								<td>${userDetail.city}</td>
							</tr>
							<tr>
								<th>Register Date</th>
								<td>${userDetail.userRegDate}</td>
								<th>Country</th>
								<td>${userDetail.country}</td>
							</tr>
							<tr>
								<th>Nation(Lang)</th>
								<td>${userDetail.userNation}</td>
								<th>Region</th>
								<td>${userDetail.region}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">	
				<div class="table-responsive" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
					<table class="table table-colored text-center">
						<thead>
							<tr>
								<th>Pledge number</th>
								<th>Reward</th>
								<th>Donate Amount</th>
								<th>Donate Date</th>
								<th>Detail</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${fn:length(donateList) >0 }">
								<c:forEach items="${donateList}" varStatus="status">
									<tr>
										<td><a href="${donateList[status.index].receipt_url }"><strong>${donateList[status.index].imp_Uid }</strong></a></td>
										<td>
											<div class="table-header">
												<img src="${donateList[status.index].campaignImg }">
											</div>
											<div class="table-footer"><strong>${donateList[status.index].campaignSubject }<br>${donateList[status.index].rewardSubject }</strong></div>
										</td>
										<td>$${donateList[status.index].totalAmount }</td>
										<td>${donateList[status.index].paid_At }</td>
										<td><a href="paymentDetail?impUid=${donateList[status.index].imp_Uid }&userEmail=${userDetail.userEmail}">보기</a></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
		</div>
	</div>
	</section>
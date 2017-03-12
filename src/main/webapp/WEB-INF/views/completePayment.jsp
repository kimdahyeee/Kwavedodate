			<%@ page language="java" contentType="text/htmll; charset=UTF-8" pageEncoding="UTF-8"%>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
			<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<section class="main-container">
				<div class="container">
					<div class="row">
						<div class="col-md-10 col-md-offset-1">
							<div class="main object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
								<div class="table-responsive" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
									<h1 class="text-center"><spring:message code="thankYouForYourDonation"/></h1>
									<label></label>
									<table class="table table-colored text-center">
										<thead>
											<tr>
												<th><spring:message code="pledgeNumber"/></th>
												<th><spring:message code="campaigns"/></th>
												<th><spring:message code="amount"/></th>
												<th><spring:message code="date"/></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<!-- 영수증 조회 페이지로 href -->
												<td>
													<c:choose>
				                           				<c:when test="${not empty completePaymentInfo.receipt_url}"><a href="${completePaymentInfo.receipt_url}" onclick="window.open(this.href, 'popup', 'popup');return false;" target="_blank"><strong>${completePaymentInfo.imp_uid}</strong></a></c:when>
						                           		<c:otherwise><strong>${completePaymentInfo.imp_uid}</strong></c:otherwise>
						                           	</c:choose>
												</td>
												<td>
													<div class="table-header">
														<img src="${completePaymentInfo.campaignImg }">
													</div>
													<div class="table-footer">
														${completePaymentInfo.campaignSubject }<br/>
														${completePaymentInfo.rewardSubject }
													</div>
												</td>
												<td>$${completePaymentInfo.totalAmount }</td>
												<td>${completePaymentInfo.paid_at }</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="col-md-10 col-md-offset-1 text-center">
							<a href="/kwaveweb/" type="submit" class="btn square btn-danger"><spring:message code="home"/> </a>
							<label></label>
							<a href="/myAccount" type="submit" class="btn square btn-danger"><spring:message code="history"/> </a>
						</div>
					</div>
				</div>
			</section>
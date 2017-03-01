<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
	<section class="main-container">
		<div class="container">
			<div class="row manageCampaigns">	
				<div class="table-responsive" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
					<ul class="nav nav-pills nav-justified" role="tablist">
						<li class="active"><a href="#pill-1" role="tab" data-toggle="tab">진행 전</a></li>
						<li><a href="#pill-2" role="tab" data-toggle="tab"> 진행 중</a></li>
						<li><a href="#pill-3" role="tab" data-toggle="tab"> 종료</a></li>
					</ul>
					<div class="tab-content clear-style">
						<!-- 진행 전 시작 -->
						<!-- ====== -->
						<div class="tab-pane active" id="pill-1">
							<div class="campaignsList">
								<table class="table table-colored text-center">
									<thead>
										<tr>
											<th>Campaign Name</th>
											<th>Campaign Subject</th>
											<th>FundingUser Count</th>
											<th>Gather Amount</th>
											<th>Register</th>
											<th>Reg Date</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${fn:length(beforeCamapaignsList) > 0}">
											<c:forEach items="${beforeCamapaignsList}" varStatus="status">
												<tr>
													<td><a href="<c:url value='/admin/campaignDetail/${beforeCamapaignsList[status.index].campaignName}'/>">${beforeCamapaignsList[status.index].campaignName}</a></td>
													<td>${beforeCamapaignsList[status.index].campaignSubject}</td>
													<td>${beforeCamapaignsList[status.index].fundingUserCnt}</td>
													<td>$${beforeCamapaignsList[status.index].gatherAmount}</td>
													<td>${beforeCamapaignsList[status.index].campaignRegister}</td>
													<td>${beforeCamapaignsList[status.index].campaignRegDate}</td>
													<td><a href="/admin/deleteCampaigns?campaignName=${currentCampaignsList[status.index].campaignName}" onclick="return confirm('정말 삭제하시겠습니까?') ? true : false;">삭제</a></td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 진행 전 끝 -->
						<!-- ====== -->
						
						<!-- 진행 중 시작 -->
						<!-- ====== -->
						<div class="tab-pane" id="pill-2">
							<div class="campaignsList">
								<table class="table table-colored text-center">
									<thead>
										<tr>
											<th>Campaign Name</th>
											<th>Campaign Subject</th>
											<th>FundingUser Count</th>
											<th>Gather Amount</th>
											<th>Register</th>
											<th>Reg Date</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${fn:length(currentCampaignsList) > 0}">
											<c:forEach items="${currentCampaignsList}" varStatus="status">
												<tr>
													<td><a id="campaignName" href="<c:url value='/admin/campaignDetail/${currentCampaignsList[status.index].campaignName}'/>">${currentCampaignsList[status.index].campaignName}</a></td>
													<td>${currentCampaignsList[status.index].campaignSubject}</td>
													<td>${currentCampaignsList[status.index].fundingUserCnt}</td>
													<td>$${currentCampaignsList[status.index].gatherAmount}</td>
													<td>${currentCampaignsList[status.index].campaignRegister}</td>
													<td>${currentCampaignsList[status.index].campaignRegDate}</td>
													<td><a href="/admin/deleteCampaigns?campaignName=${currentCampaignsList[status.index].campaignName}" onclick="return confirm('정말 삭제하시겠습니까?') ? true : false;">삭제</a></td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 진행 중 끝 -->
						<!-- ====== -->
						
						<!-- 종료 시작 -->
						<!-- ====== -->
						<div class="tab-pane" id="pill-3">
							<div class="campaignsList">
								<table class="table table-colored text-center">
									<thead>
										<tr>
											<th>Campaign Name</th>
											<th>Campaign Subject</th>
											<th>FundingUser Count</th>
											<th>Gather Amount</th>
											<th>Register</th>
											<th>Reg Date</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${fn:length(closedCamapaignsList) > 0}">
											<c:forEach items="${closedCamapaignsList}" varStatus="status">
												<tr>
													<td><a href="<c:url value='/admin/campaignDetail/${closedCamapaignsList[status.index].campaignName}'/>">${closedCamapaignsList[status.index].campaignName}</a></td>
													<td>${closedCamapaignsList[status.index].campaignSubject}</td>
													<td>${closedCamapaignsList[status.index].fundingUserCnt}</td>
													<td>$${closedCamapaignsList[status.index].gatherAmount}</td>
													<td>${closedCamapaignsList[status.index].campaignRegister}</td>
													<td>${closedCamapaignsList[status.index].campaignRegDate}</td>
													<td><a href="/admin/deleteCampaigns?campaignName=${closedCamapaignsList[status.index].campaignName}" onclick="return confirm('정말 삭제하시겠습니까?') ? true : false;">삭제</a></td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 종료 끝 -->
						<!-- ====== -->
					</div>
					
					<a href="<c:url value='/admin/campaignAdd' />" class="btn square btn-danger pull-right">추가</a>
				</div>
			</div>
		</div>
	</section>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
										<c:if test="${fn:length(beforeCamapaignList) > 0}">
											<c:forEach items="${beforeCamapaignList}" varStatus="status">
												<tr>
													<td><a href="<c:url value='/admin/campaignDetail/${beforeCamapaignList[status.index].campaignName}'/>">${beforeCamapaignList[status.index].campaignName}</a></td>
													<td>${beforeCamapaignList[status.index].campaignSubject}</td>
													<td>${beforeCamapaignList[status.index].fundingUserCnt}</td>
													<td>$${beforeCamapaignList[status.index].gatherAmount}</td>
													<td>${beforeCamapaignList[status.index].campaignRegister}</td>
													<td>${beforeCamapaignList[status.index].campaignRegDate}</td>
													<td><a href="deleteCampaign?campaignName=${beforeCamapaignList[status.index].campaignName}" onclick="return confirm('정말 삭제하시겠습니까?\n캠페인과 관련된 모든 항목이 삭제됩니다.') ? true : false;">삭제</a></td>
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
										<c:if test="${fn:length(currentCampaignList) > 0}">
											<c:forEach items="${currentCampaignList}" varStatus="status">
												<tr>
													<td><a id="campaignName" href="<c:url value='/admin/campaignDetail/${currentCampaignList[status.index].campaignName}'/>">${currentCampaignList[status.index].campaignName}</a></td>
													<td>${currentCampaignList[status.index].campaignSubject}</td>
													<td>${currentCampaignList[status.index].fundingUserCnt}</td>
													<td>$${currentCampaignList[status.index].gatherAmount}</td>
													<td>${currentCampaignList[status.index].campaignRegister}</td>
													<td>${currentCampaignList[status.index].campaignRegDate}</td>
													<td>	
														<a href="deleteCampaign?campaignName=${currentCampaignList[status.index].campaignName}" onclick="return confirm('정말 삭제하시겠습니까?\n캠페인과 관련된 모든 항목이 삭제됩니다.') ? true : false;">삭제</a>
													</td>
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
										<c:if test="${fn:length(closedCamapaignList) > 0}">
											<c:forEach items="${closedCamapaignList}" varStatus="status">
												<tr>
													<td><a href="<c:url value='/admin/campaignDetail/${closedCamapaignList[status.index].campaignName}'/>">${closedCamapaignList[status.index].campaignName}</a></td>
													<td>${closedCamapaignList[status.index].campaignSubject}</td>
													<td>${closedCamapaignList[status.index].fundingUserCnt}</td>
													<td>$${closedCamapaignList[status.index].gatherAmount}</td>
													<td>${closedCamapaignList[status.index].campaignRegister}</td>
													<td>${closedCamapaignList[status.index].campaignRegDate}</td>
													<td><a href="deleteCampaign?campaignName=${closedCamapaignList[status.index].campaignName}" onclick="return confirm('정말 삭제하시겠습니까?\n삭제 시 reward와 payment등 campaign과 관련된 데이터가 모두 삭제됩니다.') ? true : false;">삭제</a></td>
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
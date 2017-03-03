	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<section class="main-container">
		<div class="container">
			<div class="row">	
				<div class="table-responsive" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
					<!-- Tab panes -->
					<div class="tab-content clear-style">
						<!-- 공통부분 part -->
						<!-- ======= -->
						<h4>Gather Amount: $${campaignDetail.gatherAmount}</h4>
						<h4><a href="<c:url value='/admin/campaignFundingUserList'/>">Funding User Count: ${campaignDetail.fundingUserCnt}</a></h4>
						
						<a href="<c:url value='campaignCommonUpdate'/>" class="btn square btn-danger">공통부분 수정</a>
						<table class="table table-colored">
							<tbody>
								<tr>
									<th>Campaign Name</th>
									<td>${campaignDetail.campaignName}</td>
									<th>Left Days</th>
									<td>${leftDays}</td>
									<th>Register</th>
									<td>${campaignDetail.campaignRegister}</td>
								</tr>
								<tr>
									<th>Launch Date</th>
									<td>${campaignDetail.launchDate}</td>
									<th>Due Date</th>
									<td>${campaignDetail.dueDate}</td>
									<th>Youtube Code</th>
									<td>${campaignDetail.youtubeCode}</td>
								</tr>
								<tr>
									<th>Campaign Img</th>
									<td colspan="2">
										<img src="${campaignDetail.campaignImg}">
									<th>Youtube Img</th>
									<td colspan="2">
										<img src="${campaignDetail.youtubeImg}">
									</td>
								</tr>
							</tbody>
						</table>
						<!-- 공통부분 part 끝-->
						<!-- ======== -->
						<ul class="nav nav-pills" role="tablist">
							<li class="active"><a href="#pill-1" role="tab" data-toggle="tab">Korean</a></li>
							<li><a href="#pill-2" role="tab" data-toggle="tab">English</a></li>
							<li><a href="#pill-3" role="tab" data-toggle="tab">Chinese</a></li>
						</ul>
						<!-- 한국어 Part -->
						<!-- ======= -->
						<div class="tab-pane active" id="pill-1">
							<a href="<c:url value='campaignKoUpdate'/>" class="btn square btn-danger">수정(한국어)</a>
							<table class="table table-colored">
								<tbody>
									<tr>
										<th>Campaign Subject</th>
										<td>
											<!-- #Campaign Subject 내용 -->
											${campaignDetail.koCampaignSubject}
										</td>
									</tr>
									<tr>
										<th>Campaign Summary</th>
										<td>
											<!-- #Campaign Summary 내용 -->
											${campaignDetail.koCampaignSummary}
										</td>
									</tr>
									
									<tr>
										<th>Campaign Contents</th>
										<td>
											<!-- #Campaign Contents 내용 -->
											${campaignDetail.koCampaignContents}
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 한국어 Part 끝 -->
						<!-- ======= -->
						
						<!-- 영어 Part -->
						<!-- ====== -->
						<div class="tab-pane" id="pill-2">
							<a href="<c:url value='campaignEnUpdate'/>" class="btn square btn-danger">수정(영어)</a>
							<table class="table table-colored">
								<tbody>
									<tr>
										<th>Campaign Subject</th>
										<td>
											<!-- #Campaign Subject 내용 -->
											${campaignDetail.enCmpaignSubject}
										</td>
									</tr>
									<tr>
										<th>Campaign Summary</th>
										<td>
											<!-- #Campaign Summary 내용 -->
											${campaignDetail.enCmpaignSummary}
										</td>
									</tr>
									
									<tr>
										<th>Campaign Contents</th>
										<td>
											<!-- #Campaign Contents 내용 -->
											${campaignDetail.enCmpaignContents}
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 영어 Part 끝 -->
						<!-- ======= -->
						
						
						<!-- 중국어 Part -->
						<!-- ====== -->
						<div class="tab-pane" id="pill-3">
							<a href="<c:url value='campaignChUpdate'/>" class="btn square btn-danger">수정(중국어)</a>
							<table class="table table-colored">
								<tbody>
									<tr>
										<th>Campaign Subject</th>
										<td>
											<!-- #Campaign Subject 내용 -->
											${campaignDetail.chCampaignSubject}
										</td>
									</tr>
									<tr>
										<th>Campaign Summary</th>
										<td>
											<!-- #Campaign Summary 내용 -->
											${campaignDetail.chCampaignSummary}
										</td>
									</tr>
									
									<tr>
										<th>Campaign Contents</th>
										<td>
											<!-- #Campaign Contents 내용 -->
											${campaignDetail.chCampaignContents}
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 중국어 Part 끝 -->
						<!-- ======= -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<section class="main-container">
		<div class="container">
			<div class="row">	
				<div class="table-responsive" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
					<ul class="nav nav-pills" role="tablist">
						<li class="active"><a href="#pill-1" role="tab" data-toggle="tab">Korean</a></li>
						<li><a href="#pill-2" role="tab" data-toggle="tab">English</a></li>
						<li><a href="#pill-3" role="tab" data-toggle="tab">Chinese</a></li>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content clear-style">
						<!-- 공통부분 part -->
						<!-- ======= -->
						<h4>Gather Amount: $200</h4>
						<h4><a href="<c:url value='/admin/campaignFundingUserList'/>">Funding User Count: 3</a></h4>
						
						<a href="<c:url value='campaignCommonUpdate'/>" class="btn square btn-danger">공통부분 수정</a>
						<table class="table table-colored">
							<tbody>
								<tr>
									<th>Campaign Name</th>
									<td>IU_Campaign</td>
									<th>Left Days</th>
									<td>30</td>
									<th>Register</th>
									<td>vvshinevv@naver.com</td>
								</tr>
								<tr>
									<th>Launch Date</th>
									<td>2017.02.25 09:56</td>
									<th>Due Date</th>
									<td>2017.03.25 09:56</td>
									<th>Youtube Code</th>
									<td>MhQKe-aERsU</td>
								</tr>
								<tr>
									<th>Campaign Img</th>
									<td colspan="2">
										<img src="<c:url value='/resources/images/kim-go-eun-campaign.jpg'/>">
									<th>Youtube Img</th>
									<td colspan="2">
										<img src="<c:url value='/resources/images/oh-yeon-campaign.jpg'/>">
									</td>
								</tr>
							</tbody>
						</table>
						<!-- 공통부분 part 끝-->
						<!-- ======== -->
						
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
										</td>
									</tr>
									<tr>
										<th>Campaign Summary</th>
										<td>
											<!-- #Campaign Summary 내용 -->
										</td>
									</tr>
									
									<tr>
										<th>Campaign Contents</th>
										<td>
											<!-- #Campaign Contents 내용 -->
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
										</td>
									</tr>
									<tr>
										<th>Campaign Summary</th>
										<td>
											<!-- #Campaign Summary 내용 -->
										</td>
									</tr>
									
									<tr>
										<th>Campaign Contents</th>
										<td>
											<!-- #Campaign Contents 내용 -->
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
										</td>
									</tr>
									<tr>
										<th>Campaign Summary</th>
										<td>
											<!-- #Campaign Summary 내용 -->
										</td>
									</tr>
									
									<tr>
										<th>Campaign Contents</th>
										<td>
											<!-- #Campaign Contents 내용 -->
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
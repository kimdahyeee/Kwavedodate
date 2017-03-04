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
				</div>
				<div class="tab-content clear-style">
					<!-- 공통부분 part -->
					<!-- ======= -->
					<a href="<c:url value='rewardCommonUpdate'/>" class="btn square btn-danger">공통부분 수정</a>
					<table class="table table-colored">
						<tbody>
							<tr>
								<th>Campaign Name</th>
								<td><c:url value='${reward.campaignName }'/></td>
								<th rowspan="4">Reward Img</th>
								<td rowspan="4"> 
									<img width="250px" src="<c:url value='${reward.rewardImg }'/>">
								</td>
							</tr>
							<tr>
								<th>Reward Amount</th>
								<td>${reward.rewardAmount }</td>
							</tr>
							<tr>
								<th>Reward Current Count</th>
								<td>${reward.rewardCurrentCnt }</td>
							</tr>
							<tr>
								<th>Reward Total Count</th>
								<td>${reward.rewardTotalCnt }</td>
							</tr>
						</tbody>
					</table>
					<!-- 공통부분 part 끝-->
					<!-- ======== -->
					
					<!-- 한국어 Part -->
					<!-- ======= -->
					<div class="tab-pane active" id="pill-1">
						<a href="<c:url value='rewardKoUpdate'/>" class="btn square btn-danger">수정(한국어)</a>
						<table class="table table-colored">
							<tbody>
								<tr>
									<th>Reward Subject</th>
									<td>${reward.koRewardSubject }</td>
								</tr>
								<tr>
									<th>Reward Contents</th>
									<td>${reward.koRewardContents }</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 한국어 Part 끝 -->
					<!-- ======= -->
					
					<!-- 영어 Part -->
					<!-- ====== -->
					<div class="tab-pane" id="pill-2">
						<a href="<c:url value='rewardEnUpdate'/>" class="btn square btn-danger">수정(영어)</a>
						<table class="table table-colored">
							<tbody>
								<tr>
									<th>Reward Subject</th>
									<td>${reward.enRewardSubject }</td>
								</tr>
								<tr>
									<th>Reward Contents</th>
									<td>${reward.enRewardContents }</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 영어 Part 끝 -->
					<!-- ======= -->
					
					
					<!-- 중국어 Part -->
					<!-- ====== -->
					<div class="tab-pane" id="pill-3">
						<a href="<c:url value='rewardChUpdate'/>" class="btn square btn-danger">수정(중국어)</a>
						<table class="table table-colored">
							<tbody>
								<tr>
									<th>Reward Subject</th>
									<td>${reward.chRewardSubject }</td>
								</tr>
								<tr>
									<th>Reward Contents</th>
									<td>${reward.chRewardContents }</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 중국어 Part 끝 -->
					<!-- ======= -->
				</div>
			
			</div>
		</div>
	</section>
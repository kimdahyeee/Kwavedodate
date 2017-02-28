	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<section class="main-container">
		<div class="container">
			<div class="row">	
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
										<tr>
											<td><a href="<c:url value='/admin/campaignDetail'/>">IU_Campaign</a></td>
											<td>IU Play With You</td>
											<td>3</td>
											<td>$100</td>
											<td>vvshinevv</td>
											<td>2017.02.25 18:20</td>
											<td><a href="#">삭제</a></td>
										</tr>
										<tr>
											<td><a href="<c:url value='/admin/campaignDetail'/>">IU_Campaign</a></td>
											<td>IU Play With You</td>
											<td>3</td>
											<td>$100</td>
											<td>vvshinevv</td>
											<td>2017.02.25 18:20</td>
											<td><a href="#">삭제</a></td>
										</tr>
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
										<tr>
											<td><a href="<c:url value='/admin/campaignDetail'/>">GongYou_Campaign</a></td>
											<td>IU Play With You</td>
											<td>5</td>
											<td>$200</td>
											<td>vvshinevv</td>
											<td>2017.02.25 18:20</td>
											<td><a href="#">삭제</a></td>
										</tr>
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
											<tr>
												<td><a href="<c:url value='/admin/campaignDetail'/>">IU_Campaign</a></td>
												<td>IU Play With You</td>
												<td>3</td>
												<td>$100</td>
												<td>vvshinevv</td>
												<td>2017.02.25 18:20</td>
												<td><a href="#">삭제</a></td>
											</tr>
											<tr>
												<td><a href="<c:url value='/admin/campaignDetail'/>">GongYou_Campaign</a></td>
												<td>IU Play With You</td>
												<td>5</td>
												<td>$200</td>
												<td>vvshinevv</td>
												<td>2017.02.25 18:20</td>
												<td><a href="#">삭제</a></td>
											</tr>
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
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	<section class="main-container">
		<div class="container">
			<div class="row">
				<table class="table table-colored text-center">
					<thead>
						<tr>
							<th>Campaign Name</th>
							<th>Reward Subject</th>
							<th>Reward Amount</th>
							<th>Reward Total Count</th>
							<th>Reward Current Count</th>
							<th>Detail</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${rewards}" var="rewards">
							<tr>
								<td>${rewards.campaignName }</td>
								<td>${rewards.rewardSubject }</td>
								<td>${rewards.rewardAmount }</td>
								<td>${rewards.rewardTotalCnt }</td>
								<td>${rewards.rewardCurrentCnt }</td>
								<td><a href="<c:url value='/admin/${rewards.campaignName}/manageRewards/${rewards.rewardNum}'/>">보기</a></td>
								<td><a href="#">삭제</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<a href="<c:url value='/admin/rewardAdd'/>" class="btn square btn-danger pull-right">추가</a>
			</div>
		</div>
	</section>
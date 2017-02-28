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
						<tr>
							<td>IU_Campaign</td>
							<td>reward1</td>
							<td>$20</td>
							<td>150</td>
							<td>130</td>
							<td><a href="<c:url value='/admin/rewardDetail'/>">보기</a></td>
							<td><a href="">삭제</a></td>
						</tr>
						<tr>
							<td>IU_Campaign</td>
							<td>reward2</td>
							<td>$50</td>
							<td>100</td>
							<td>70</td>
							<td><a href="<c:url value='/admin/rewardDetail'/>">보기</a></td>
							<td><a href="">삭제</a></td>
						</tr>
					</tbody>
				</table>
				<a href="<c:url value='/admin/rewardAdd'/>" class="btn square btn-danger pull-right">추가</a>
			</div>
		</div>
	</section>
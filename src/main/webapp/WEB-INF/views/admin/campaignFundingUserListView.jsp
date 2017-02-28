	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<section class="main-container">
		<div class="container">
			<div class="row">	
				<div class="table-responsive" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
					<h3>{캠페인 이름}에 후원한 회원 리스트</h3>
					<table class="table table-colored text-center">
						<thead>
							<tr>
								<th>User Email</th>
								<th>Reward</th>
								<th>Funding Amount</th>
								<th>Paid At</th>
								<th>Detail</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><strong>vvshinevv@naver.com</strong></td>
								<td>
									<strong>reward2</strong>
								</td>
								<td>$30</td>
								<td>2017.02.25 17:46</td>
								<td><a href="<c:url value='/admin/paymentDetail'/>">보기</a></td>
							</tr>
							<tr>
								<td><strong>vvshinevv@naver.com</strong></td>
								<td>
									<strong>reward1</strong>
								</td>
								<td>$100</td>
								<td>2017.01.25 17:46</td>
								<td><a href="<c:url value='/admin/paymentDetail'/>">보기</a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
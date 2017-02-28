	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<section class="main-container">
		<div class="container">
			<div class="row">	
				<div class="table-responsive" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
					<table class="table table-colored text-center">
						<thead>
							<tr>
								<th>User Email</th>
								<th>User Name</th>
								<th>Reg Date</th>
								<th>Is SNS</th>
								<th>Detail</th>
							</tr>
						</thead>
						<tbody>
								<tr>
									<td>vvshinevv@naver.com</td>
									<td>최홍희</td>
									<td>2017.02.25 17:46</td>
									<td>Yes</td>
									<td><a href="<c:url value='userDetail'/>">보기</a></td>
								</tr>
								<tr>
									<td>vvshinevv@naver.com</td>
									<td>소사냥</td>
									<td>2017.02.25 17:46</td>
									<td>No</td>
									<td><a href="<c:url value='userDetail'/>">보기</a></td>
								</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
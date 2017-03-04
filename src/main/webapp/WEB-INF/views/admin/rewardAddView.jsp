	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<section class="main-container">
		<div class="container">
			<div class="row">
				<div class="main object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
					<form class="form-horizontal" id="validateRewardAdd" method="post" enctype="multipart/form-data">
						<h3>공통 부분</h3>
						<table class="table table-colored">
							<tbody>
								<tr>
									<th>Campaign Name</th>
									<td colspan="5">
										<div class="form-group has-feedback">
											<div class="col-sm-12">
												<!-- disabled 속성일 때 값이 NULL 값으로 넘어가는 현상 발견 -->
												<input type="text" class="form-control" id="campaignName" name="campaignName" value="Gongyou_Campaign" disabled required>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th>Reward Amount</th>
									<td>
										<div class="form-group has-feedback">
											<div class="col-sm-12">
												<input type="text" class="form-control" id="rewardAmount" name="rewardAmount" placeholder="Reward Amount" required>
											</div>
										</div>
									</td>
									<th>Reward Count</th>
									<td>
										<div class="form-group has-feedback">
											<div class="col-sm-12">
												<input type="text" class="form-control" id="rewardTotalCnt" name=rewardTotalCnt placeholder="Reward Count"  required>
											</div>
										</div>
									</td>
									<th>Reward  Img</th>
									<td colspan="4">
										<input type="file" id="rewardImg" name="rewardImg" />
									</td>
								</tr>
								
							</tbody>
						</table>
						<label></label>
						
						<h3>한국어</h3>
						<table class="table table-colored">
							<tbody>
								<tr>
									<th>Reward Subject</th>
									<td>
										<div class="form-group has-feedback">
											<div class="col-sm-12">
												<input type="text" class="form-control" id="rewardKoSubject" name="rewardKoSubject" placeholder="Reward Subject" required>
											</div>	
										</div>
									</td>
								</tr>
								<tr>
									<th>Reward Contents</th>
									<td>
										<textarea id="rewardKoContents_editor" name="rewardKoContents_editor"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
						<label></label>
						
						<h3>영어</h3>
						<table class="table table-colored">
							<tbody>
								<tr>
									<th>Reward Subject</th>
									<td>
										<div class="form-group has-feedback">
											<div class="col-sm-12">
												<input type="text" class="form-control" id="rewardEnSubject" name="rewardEnSubject" placeholder="Reward Subject" required>
											</div>	
										</div>									
									</td>
								</tr>
								<tr>
									<th>Reward Contents</th>
									<td>
										<textarea id="rewardEnContents_editor" name="rewardEnContents_editor"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
						<label></label>
						
						<h3>중국어</h3>
						<table class="table table-colored">
							<tbody>
								<tr>
									<th>Reward Subject</th>
									<td>
										<div class="form-group has-feedback">
											<div class="col-sm-12">
												<input type="text" class="form-control" id="rewardChSubject" name="rewardChSubject" placeholder="Reward Subject" required>
											</div>	
										</div>		
									</td>
								</tr>
								<tr>
									<th>Reward Contents</th>
									<td>
										<textarea id="rewardChContents_editor" name="rewardChContents_editor"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
						<input type="submit" class="btn square btn-danger pull-right" value="리워드 추가">
					</form>
				</div>
			</div>
		</div>
	</section>
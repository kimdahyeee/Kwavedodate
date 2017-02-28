	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<section class="main-container">
		<div class="container">
			<div class="row">
				<div class="main object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
					<form class="form-horizontal" id="validateCampaignKoUpdate" method="post">
						<h3>한국어 부분 수정</h3>
						<table class="table table-colored">
							<tbody>
								<tr>
									<th>Campaign Name</th>
									<td>
										<div class="form-group has-feedback">
											<div class="col-sm-12">
												<!-- input type이 disabled이면 ajax에서 값을 못넘기는 현상 발생 -> hidden 값으로 넘겨줄 것-->
												<input type="text" class="form-control" id="campaignName" name="campaignName" value="" disabled required>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th>Campaign Subject</th>
									<td>
										<div class="form-group has-feedback">
											<div class="col-sm-12">
												<input type="text" class="form-control" id="campaignKoSubject" name="campaignKoSubject" placeholder="campaignSubject" value="" required>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th>Campaign Summary</th>
									<td>
										<textarea id="campaginKoSummary_editor" name="campaginKoSummary_editor"></textarea>
									</td>
								</tr>
								<tr>
									<th>Campaign Contents</th>
									<td>
										<textarea id="campaginKoContents_editor" name="campaginKoContents_editor"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
						<button type="submit" class="btn square btn-danger pull-right">수정 완료</button>
					</form>
				</div>
			</div>
		</div>
	</section>
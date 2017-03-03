	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<section class="main-container">
		<div class="container">
			<div class="row">
				<div class="main object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
					<form class="form-horizontal" id="validateCampaignAdd">
						<h3>공통 부분</h3>
						<table class="table table-colored">
							<tbody>
								<tr>
									<th>Campaign Name</th>
									<td colspan="5">
										<div class="form-group has-feedback">
											<div class="col-sm-12">
												<input type="text" class="form-control" id="campaignName" name="campaignName" placeholder="Campaign Name" required>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th>Launch Date</th>
									<td>
										<div class="form-group has-feedback">
											<div class="col-sm-12">
												<input type="date" class="form-control" id="launchDate" name="launchDate" required>
											</div>
										</div>
									</td>
									<th>Due Date</th>
									<td>
										<div class="form-group has-feedback">
											<div class="col-sm-12">
												<input type="date" class="form-control" id="dueDate" name="dueDate" required>
											</div>
										</div>
									</td>
									<th>Youtube Code</th>
									<td>
										<div class="form-group has-feedback">
											<div class="col-sm-12">
												<input type="text" class="form-control" id="youtubeCode" name="youtubeCode" placeholder="Youtube Code" required>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th>Campaign Img</th>
									<td colspan="5">
										<input type="file" id="campaignImg" name="campaignImg"/>
									</td>
								</tr>
								<tr>
									<th>Youtube Img</th>
									<td colspan="5">
										<input type="file" type="file" id="youtubeImg" name="youtubeImg"/>
									</td>
								</tr>
							</tbody>
						</table>
						<label></label>
						
						<h3>한국어</h3>
						<table class="table table-colored">
							<tbody>
								<tr>
									<th>Campaign Subject</th>
									<td>
										<div class="form-group has-feedback">
											<div class="col-sm-12">
												<input type="text" class="form-control" id="campaignKoSubject" name="campaignKoSubject" placeholder="campaignSubject" required>
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
						<label></label>
						
						<h3>영어</h3>
						<table class="table table-colored">
							<tbody>
								<tr>
									<th>Campaign Subject</th>
									<td>
										<div class="form-group has-feedback">
											<div class="col-sm-12">
												<input type="text" class="form-control" id="campaignEnSubject" name="campaignEnSubject" placeholder="campaignSubject" required>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th>Campaign Summary</th>
									<td>
										<textarea id="campaginEnSummary_editor" name="campaginEnSummary_editor"></textarea>
									</td>
								</tr>
								<tr>
									<th>Campaign Contents</th>
									<td>
										<textarea id="campaginEnContents_editor" name="campaginEnContents_editor"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
						<label></label>
						
						<h3>중국어</h3>
						<table class="table table-colored">
							<tbody>
								<tr>
									<th>Campaign Subject</th>
									<td>
										<div class="form-group has-feedback">
											<div class="col-sm-12">
												<input type="text" class="form-control" id="campaignChSubject" name="campaignChSubject" placeholder="campaignSubject" required>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th>Campaign Summary</th>
									<td>
										<textarea id="campaginChSummary_editor" name="campaginChSummary_editor"></textarea>
									</td>
								</tr>
								<tr>
									<th>Campaign Contents</th>
									<td>
										<textarea id="campaginChContents_editor" name="campaginChContents_editor"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
						<input type="submit" class="btn square btn-danger pull-right" value="캠페인 추가">
					</form>
				</div>	
			</div>
		</div>
	</section>
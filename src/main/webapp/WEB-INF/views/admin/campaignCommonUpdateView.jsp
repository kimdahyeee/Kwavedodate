		<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<section class="main-container">
			<div class="container">
				<div class="row">	
					<div class="main object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
						<form class="form-horizontal" id="validateCampaignCommonUpdate" method="post">
							<h3>공통 부분 수정</h3>
							<table class="table table-colored">
								<tbody>
									<tr>
										<th>Campaign Name</th>
										<td>
											<div class="form-group has-feedback">
												<div class="col-sm-12">
													<input type="text" class="form-control" id="campaignName" name="campaignName" placeholder="Campaign Name" value="${campaignCommaonDetail.campaignName}" disabled>
												</div>
											</div>
										</td>
									</tr>
									
									<tr>
										<th>Register</th>
										<td>
											<div class="form-group has-feedback">
												<div class="col-sm-12">
													<input type="text" class="form-control" id="campaignRegister" name="campaignRegister"  value="${campaignCommaonDetail.campaignRegister}" disabled>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th>Launch Date</th>
										<td>
											<div class="form-group has-feedback">
												<div class="col-sm-12">
													<input type="date" class="form-control" id="launchDate" name="launchDate" value="${campaignCommaonDetail.launchDate}" required>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th>Due Date</th>
										<td>
											<div class="form-group has-feedback">
												<div class="col-sm-12">
													<input type="date" class="form-control" id="dueDate" name="dueDate" value="${campaignCommaonDetail.dueDate}" required>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th>Youtube Code</th>
										<td>
											<div class="form-group has-feedback">
												<div class="col-sm-12">
													<input type="text" class="form-control" id="youtubeCode" name="youtubeCode" placeholder="youtubeCode" value="${campaignCommaonDetail.youtubeCode}" required>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th>
											<div class="campaignImgArea">
												Campaign Img<br>
												<label class="btn btn-primary">
									             	사진 변경 <input type="file" id="campaignImgFile" name="campaignImgFile" style="display: none;"/>
									            </label>
									            <div id="uploadImgState"></div>	
											</div>
										</th>
										<td rowspan="3"> 
											<img id="campaignImgLoaded" width="300px" src="${campaignCommaonDetail.campaignImg}">
											<input type="hidden" id="campaignImg" name="campaignImg" value="${campaignCommaonDetail.campaignImg}"/>
											<div id="previewCampaignImg"></div>
										</td>
										<th>
											<div class="youtubeImgArea">
												Youtube Img<br>
												<label class="btn btn-primary">
									             	사진 변경 <input type="file" id="youtubeImgFile" name="youtubeImgFile" style="display: none;"/>
									            </label>
											</div>
										</th>
										<td rowspan="3"> 
											<img id="youtubeImgLoaded" width="300px" src="${campaignCommaonDetail.youtubeImg}">
											<input type="hidden" id="youtubeImg" name="youtubeImg" value="${campaignCommaonDetail.youtubeImg}"/>
											<div id="previewYoutubeImg"></div>
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
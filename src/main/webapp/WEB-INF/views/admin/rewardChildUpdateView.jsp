	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<section class="main-container">
		<div class="container">
			<div class="row">
				<div class="main object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
					<form class="form-horizontal" id="validateRewardChildUpdate" method="post">
						<input type="hidden" id="campaignName" name="campaignName" value="${campaignName }"/>
						<input type="hidden" id="rewardNum" name="rewardNum" value="${rewardChildDetail.rewardNum }"/>
						<input type="hidden" id="locale" name="locale" value="${locale }"/>
						<h3>리워드 
							<c:choose>
								<c:when test="${locale eq 'ko'}">한국어</c:when>
								<c:when test="${locale eq 'en'}">영어</c:when>
								<c:when test="${locale eq 'ch'}">중국어</c:when>
							</c:choose> 
						부분 수정</h3>
						<table class="table table-colored">
							<tbody>
								<tr>
									<th>Reward Subject</th>
									<td>
										<div class="form-group has-feedback">
											<div class="col-sm-12">
												<input type="text" class="form-control" id="rewardSubject" name="rewardSubject" value="${rewardChildDetail.rewardSubject }" required>
											</div>	
										</div>
									</td>
								</tr>
								<tr>
									<th>Reward Contents</th>
									<td>
										<textarea id="rewardContents_editor" name="rewardContents_editor">${rewardChildDetail.rewardContents }</textarea>
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
			<section class="main-container campaign-perks">
				<div class="container">
					<div class="row">
						<div class="main col-md-10 col-md-offset-1">

							<!-- page-title start -->
							<!-- ================ -->
							<h1 class="page-title text-center">Good Things are coming...</h1>
							<label></label>
							
							<div class="isotope-container-fitrows row grid-space-10">
								<div class="col-xs-12 col-sm-6 col-md-8 col-lg-8 isotope-item">
									<p>Your donation gives you entries to win! Donating more gives you additional entries and unlocks exclusive merchandise. Choose the amount below!</p>
								</div>
								<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 isotope-item">
									<div class="image-box style-2 mb-20 bordered text-center">
									<c:set value="${rewards[0].campaignName}" var="campaignName"></c:set>
										<a href="<c:url value='/payments/${campaignName}' />" class="btn btn-lg btn-danger" style="width: 90%"><strong> donate <spring:message code="notation"/>${defaultMoney} </strong></a>
									</div>
								</div>
								<c:forEach items="${rewards}" var="rewards">
									<div class="col-sm-6 col-md-4 col-lg-4 isotope-item">
										<div class="image-box style-2 mb-20 bordered">
											<div class="overlay-container overlay-visible">
												<span class="campaign-badge"><i>${rewards.rewardCurrentCnt }/${rewards.rewardTotalCnt }</i></span>
												<img src="${rewards.rewardImg }" alt="">
												<div class="overlay-link"></div>										
											</div>
											<div class="body">
												<h3 class="text-center">${rewards.rewardSubject}</h3>
												<div class="separator"></div>
												<p class="small mb-10"><i class="icon-calendar"></i> Feb, 2015 <i class="pl-10 icon-tag-1"></i> App development</p>
												<p class="text-muted ellipsis">${rewards.rewardContents }</p>
												<c:set var="current" value="${rewards.rewardCurrentCnt}"/>
												<c:choose>
													<c:when test="${current == 0}">
														<button class="btn btn-lg btn-danger" style="width: 100%" disabled><strong> Sold Out </strong></button>
													</c:when>
													<c:otherwise>
														<a href="<c:url value='/payments/${rewards.campaignName}/reward/${rewards.rewardNum}' />" class="btn btn-lg btn-danger" style="width: 100%"><strong> donate <spring:message code="notation"/>${rewards.rewardAmount } </strong></a>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<!-- main end -->
					</div>
				</div>
			</section>
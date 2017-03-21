			<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
			<div class="banner campaigns-banner pv-40 dark-translucent-bg">
				<div class="container">
					<div class="row">
						<div class="col-md-8 text-center col-md-offset-2 pv-20">
							<h1 class="title object-non-visible" data-animation-effect="fadeIn" data-effect-delay="100"><spring:message code="campaignsText1"/></h1>
						</div>
					</div>
				</div>
			</div>

			<section class="main-container">
				<div class="container">
					<div class="row">
						<div class="main col-md-8 col-md-offset-2 text-center">
							<ul class="nav nav-pills nav-justified" role="tablist">
								<li class="active"><a href="#currentCampaigns" role="tab" data-toggle="tab"><h4><strong><spring:message code="currentCampaign"/></strong></h4></a></li>
								<li><a href="#recentlyClosed" role="tab" data-toggle="tab"><h4><strong><spring:message code="recentlyClosed"/></strong></h4></a></li>
							</ul>
							<div class="tab-content clear-style text-left">
								<!-- #CURRENT CAMPAIGNS -->
								<div class="tab-pane active fade in" id="currentCampaigns">
									<div class="container">
										<div class="row">
										<c:if test="${fn:length(currentList) > 0}">
										<c:forEach items="${currentList}" var="currentLists" begin="0" end="${fn:length(currentList)}" step="1" varStatus="status">
											<div class="col-sm-6">
												<div class="image-box style-2 mb-20 bordered light-gray-bg">
													<div class="overlay-container overlay-visible">
														<span class="campaign-badge"><i>${currentList[status.index].campaignDueDate}</i></span>
														<img src="${currentList[status.index].campaignImg}" />
														<a class="overlay-link" href="<c:url value='/campaigns/${currentList[status.index].campaignName}' />"></a>
													</div>
													<div class="body">
														<p class="small mb-10 text-muted"> <i class="pl-10 icon-tag-1"></i> Web Design</p>
														<h4 class="ellipsis"><strong>${currentList[status.index].campaignSubject}</strong></h4>
														<label></label>
														<div class="btn-learn-more">
															<a class="text-info btn-md-link" href="<c:url value='/campaigns/${currentList[status.index].campaignName}' />">Learn More <i class="fa fa-angle-right" aria-hidden="true"></i></a>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										</c:if>
										</div>
									</div>
								</div>

								<!-- #RECENTLY CLOSED -->
								<div class="tab-pane fade" id="recentlyClosed">	
									<c:if test="${fn:length(recentlyList) > 0}">
									<c:forEach items="${recentlyList}" var="recentlyLists" begin="0" end="${fn:length(recentlyList)}" step="1" varStatus="status">
									<div class="col-sm-6">
										<div class="image-box style-2 mb-20 bordered light-gray-bg">
											<div class="overlay-container overlay-visible">
												<img src="${recentlyList[status.index].campaignImg}"/>
												<a class="overlay-link" href="<c:url value='/campaigns/${recentlyList[status.index].campaignName}' />"></a>
											</div>
											<div class="body">
												<p class="small mb-10 text-muted"><i class="icon-calendar"></i> 2017 <i class="pl-10 icon-tag-1"></i> Web Design</p>
												<h4 class="ellipsis"><strong>${recentlyList[status.index].campaignSubject}</strong></h4>
												<label></label>
												<div class="btn-learn-more">
													<a class="text-info btn-md-link" href="<c:url value='/campaigns/${recentlyList[status.index].campaignName}' />">Learn More <i class="fa fa-angle-right" aria-hidden="true"></i></a>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
									</c:if>
								</div>
							</div>
						</div>

					</div>
				</div>
			</section>
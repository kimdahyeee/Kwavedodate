			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<section id="campaignDetailView" class="main-container">
				<div class="container">
				<input type="hidden" value="${details.youtubeCode}" id="youtube_code"/>
				<input type="hidden" value="${details.dueDate}" id="dueDate" />
					<div class="row">
						<div class="col-md-8 col-lg-8">
							<article class="campaign-img-border">
								<div class="overlay-container">
									<img src="${details.youtubeImg}" id="play_img">
									<c:choose>
										<c:when test="${details.duedateToSysdate != 'end'}">
											<div class="embed-container"><div id="player"></div></div>
											<span class="campaign-badge"><i>${details.duedateToSysdate }</i></span>
											<a class="overlay-link" id="play_vid"> <i class="fa fa-play" aria-hidden="true"></i></a>
										</c:when>
										<c:when test="${details.duedateToSysdate == 'end'}">
											<span class="campaign-badge-closed center"><i>Sorry! This campaign is finished!</i></span>
										</c:when>
									</c:choose>
								</div>
							</article>
							<div class="separator"></div>
						</div>

						<!-- Webì(991px~ë¬´í)ìì right-aside ê³ ì  ë©ë´ -->
						<!-- ========================================= -->
						<div class="campaignEnterNow-web">
							<aside class="col-md-4 col-lg-4 campaignEnterNow-web">
								<div class="sidebar">
									<div class="block clearfix">
										<!-- campaignSubject -->
										<!-- =============== -->
										<div class="campaignSubject">
											<h1>${details.campaignSubject }</h1>
										</div>
										<!-- =============== -->

										<label></label>

										<!-- campaignSummary -->
										<!-- ===========  -->
										<div class="campaignSummary">
											${details.campaignSummary }
										</div>
										<!-- =========== -->

										<c:choose>
											<c:when test="${details.duedateToSysdate != 'end'}">
												<div class="countdown clearfix"></div>
												<label></label>
												<div class="text-center">
													<a href="<c:url value='/payments/${details.campaignName}/rewards'/>" class="btn btn-lg btn-danger" style="width: 60%"> Enter Now </a>
												</div>
											</c:when>
											<c:otherwise>
												<div class="text-center">
													<button class="btn btn-lg btn-danger campaign-enter-btn" style="width: 80%" disabled> finished campaign! </button>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</aside>
						</div>
						<!-- Webì(991px~ë¬´í)ìì right-aside ê³ ì  ë©ë´ ë -->
						<!-- =========================== -->


						<!-- Mobileì(991px~ë¬´í)ìì campaign ì¤ëª ë²í¼ì ìëìª½ì ê³ ì  ë¨ -->
						<!-- =================================== -->
						<div class="campaignEnterNow-mobile">
							<div class="col-md-4 col-lg-4">
								<div class="sidebar">
									<div class="block clearfix">
										<!-- campaignSubject -->
										<!-- =============== -->
										<div class="campaignSubject">
											<h1>${details.campaignSubject }</h1>
										</div>
										<!-- =============== -->
										<label></label>
										<!-- campaignSummary -->
										<!-- =============== -->
										<div class="campaignSummary">
											${details.campaignSummary }
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Mobileì(991px~ë¬´í)ìì campaign ì¤ëª ë²í¼ì ìëìª½ì ê³ ì  ë¨ ë -->
						<!-- ===================================== -->
					</div>
				</div>

				<div class="space-top"></div>
				<div class="container campaignContents">
					<div class="row">
						<div class="col-md-8 col-lg-8">
							<!-- ì¬ê¸°ë¶í°ë ê´ë¦¬ì ë¨ìì ìë ¥í campaign ë´ì©ì´ Fetchëì´ì ë¤ì´ ê° -->
							<!-- ë¨ì§ ë³´ì´ë viewë¥¼ ìí´ ë´ì©ì ì´ ê² ë¿ì -->
							<!-- ==================================== -->
							${details.campaignContents}
							<!-- campaignContents -->
							<!-- =========== -->
						</div>
					</div>
				</div>
			</section>
			<!-- campaign detail ê´ë ¨ë ë -->		
			<!-- ============== -->

			<!-- mobile width(0~991px)ì¼ë ìëì ê³ ì  div -->
			<!-- ======================== -->
			<c:if test="${details.duedateToSysdate != 'end'}">
			<div class="campaignEnterNow-mobile-fixed">
				<div class="countdown"></div>
				<div class="text-center">
					<a href="#" class="btn btn-lg btn-danger campaign-enter-btn" style="width: 80%"> Enter Now </a>
				</div>
			</div>
			</c:if>
			<div class="campaign-perks"></div>
			<!-- ======================== -->
			<c:if test="${details.duedateToSysdate != 'end'}">
				<c:import url="/campaigns/${details.campaignName}/reward" />
			</c:if>
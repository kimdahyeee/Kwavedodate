<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<section class="main-container">
				<div class="container">
				<input type="hidden" value="${details.youtubeCode}" id="youtube_code"/>
				<input type="hidden" value="${details.dueDate}" id="dueDate" />
					<div class="row">
						<div class="col-md-8 col-lg-8">
							<article class="campaign-img-border">
								<div class="overlay-container">
								<div class="embed-container"><div id="player"></div></div>
									<span class="campaign-badge"><i>${details.duedateToSysdate }</i></span>
									<img src="${details.youtubeImg}" id="play_img">
									<a class="overlay-link" id="play_vid"> <i class="fa fa-play" aria-hidden="true"></i></a>
								</div>
							</article>
							<div class="separator"></div>
						</div>

						<!-- Web상(991px~무한)에서 right-aside 고정 메뉴 -->
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
										<!-- =============== -->
										<div class="campaignSummary">
											${details.campaignSummary }
										</div>
										<!-- =============== -->

										<!-- -->
										<div class="countdown clearfix"></div>
										<label></label>

										<div class="text-center">
											<a href="<c:url value='/campaigns/${details.campaignName}/rewards'/>" class="btn btn-lg btn-danger" style="width: 60%"> Enter Now </a>
										</div>
									</div>
								</div>
							</aside>
						</div>
						
					
						
						<!-- Web상(991px~무한)에서 right-aside 고정 메뉴 끝 -->
						<!-- ============================================ -->


						<!-- Mobile상(991px~무한)에서 campaign 설명 버튼은 아래쪽에 고정 됨 -->
						<!-- =========================================================== -->
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
						<!-- Mobile상(991px~무한)에서 campaign 설명 버튼은 아래쪽에 고정 됨 끝 -->
						<!-- ============================================================== -->
					</div>
				</div>

				<div class="space-top"></div>
				<div class="container campaignContents">
					<div class="row">
						<div class="col-md-8 col-lg-8">
							<!-- 여기부터는 관리자 단에서 입력한 campaign 내용이 Fetch되어서 들어 감 -->
							<!-- 단지 보이는 view를 위해 내용을 쓴 것 뿐임 -->
							<!-- ====================================== -->
							${details.campaignContents}
							<!-- campaignContents -->
							<!-- ====================================== -->
						</div>
					</div>

			</section>
			<!-- campaign detail 관련된 끝 -->		
			<!-- ======================== -->

			<!-- mobile width(0~991px)일때 아래에 고정 div -->
			<!-- ======================================== -->
			<div class="campaignEnterNow-mobile-fixed">
				<div class="countdown"></div>
				<div class="text-center">
					<a href="#" class="btn btn-lg btn-danger campaign-enter-btn" style="width: 80%"> Enter Now </a>
				</div>
			</div>
			<!-- ======================================== -->
			<c:import url="/campaigns/${details.campaignName}/reward" />
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
											<a href="rewards" class="btn btn-lg btn-danger" style="width: 60%"> Enter Now </a>
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

			<section class="main-container campaign-perks">
				<div class="container">
					<div class="row">
						<div class="main col-md-10 col-md-offset-1">

							<!-- page-title start -->
							<!-- ================ -->
							<h1 class="page-title text-center">Campaign Perks</h1>
							<label></label>
							
							<div class="isotope-container-fitrows row grid-space-10">
								<div class="col-xs-12 col-sm-6 col-md-8 col-lg-8 isotope-item">
									<p>Your donation gives you entries to win! Donating more gives you additional entries and unlocks exclusive merchandise. Choose the amount below!</p>
								</div>
								<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 isotope-item">
									<div class="image-box style-2 mb-20 bordered text-center">
										<a href="#" class="btn btn-lg btn-danger" style="width: 90%"><strong> donate $10 </strong></a>
									</div>
								</div>

								<div class="col-sm-6 col-md-4 col-lg-4 isotope-item">
									<div class="image-box style-2 mb-20 bordered">
										<div class="overlay-container overlay-visible">
											<span class="campaign-badge"><i>200/350</i></span>
											<img src="<c:url value='/resources/images/perks-1.jpg' />" alt="">
											<div class="overlay-link"></div>										
										</div>
										<div class="body">
											<h3 class="text-center">Reward Type</h3>
											<div class="separator"></div>
											<p class="small mb-10"><i class="icon-calendar"></i> Feb, 2015 <i class="pl-10 icon-tag-1"></i> App development</p>
											<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
											<a href="#" class="btn btn-lg btn-danger" style="width: 100%"><strong> donate $25 </strong></a>
										</div>
									</div>
								</div>

								<div class="col-sm-6 col-md-4 col-lg-4 isotope-item">
									<div class="image-box style-2 mb-20 bordered">
										<div class="overlay-container overlay-visible">
											<span class="campaign-badge"><i>90/100</i></span>
											<img src="<c:url value='/resources/images/perks-2.jpg' />" alt="">
											<div class="overlay-link"></div>									
										</div>
										<div class="body">
											<h3 class="text-center">Reward Type</h3>
											<div class="separator"></div>
											<p class="small mb-10"><i class="icon-calendar"></i> Feb, 2015 <i class="pl-10 icon-tag-1"></i> App development</p>
											<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
											<a href="#" class="btn btn-lg btn-danger" style="width: 100%"><strong> donate $50 </strong></a>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-4 col-lg-4 isotope-item">
									<div class="image-box style-2 mb-20 bordered">
										<div class="overlay-container overlay-visible">
											<span class="campaign-badge"><i>19/50</i></span>
											<img src="<c:url value='/resources/images/perks-3.jpg' />" alt="">
											<div class="overlay-link"></div>										
										</div>
										<div class="body">
											<h3 class="text-center">Reward Type</h3>
											<div class="separator"></div>
											<p class="small mb-10"><i class="icon-calendar"></i> Feb, 2015 <i class="pl-10 icon-tag-1"></i> Web Design</p>
											<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
											<a href="#" class="btn btn-lg btn-danger" style="width: 100%"><strong> donate $100 </strong></a>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-4 col-lg-4 isotope-item">
									<div class="image-box style-2 mb-20 bordered">
										<div class="overlay-container overlay-visible">
											<span class="campaign-badge"><i>9/20</i></span>
											<img src="<c:url value='/resources/images/perks-4.jpg' />" alt="">
											<div class="overlay-link"></div>										
										</div>
										<div class="body">
											<h3 class="text-center">Reward Type</h3>
											<div class="separator"></div>
											<p class="small mb-10"><i class="icon-calendar"></i> Feb, 2015 <i class="pl-10 icon-tag-1"></i> Site Building</p>
											<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
											<a href="#" class="btn btn-lg btn-danger" style="width: 100%"><strong> donate $400 </strong></a>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-4 col-lg-4 isotope-item">
									<div class="image-box style-2 mb-20 bordered">
										<div class="overlay-container overlay-visible">
											<span class="campaign-badge"><i>3/10</i></span>
											<img src="<c:url value='/resources/images/perks-5.jpg' />" alt="">
											<div class="overlay-link"></div>										
										</div>
										<div class="body">
											<h3 class="text-center">Reward Type</h3>
											<div class="separator"></div>
											<p class="small mb-10"><i class="icon-calendar"></i> Feb, 2015 <i class="pl-10 icon-tag-1"></i> App development</p>
											<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
											<a href="#" class="btn btn-lg btn-danger" style="width: 100%"><strong> donate $800 </strong></a>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-4 col-lg-4 isotope-item">
									<div class="image-box style-2 mb-20 bordered">
										<div class="overlay-container overlay-visible">
											<span class="campaign-badge"><i>0/5</i></span>
											<img src="<c:url value='/resources/images/perks-6.jpg' />" alt="">
											<div class="overlay-link"></div>										
										</div>
										<div class="body">
											<h3 class="text-center">Reward Type</h3>
											<div class="separator"></div>
											<p class="small mb-10"><i class="icon-calendar"></i> Feb, 2015 <i class="pl-10 icon-tag-1"></i> Site Building</p>
											<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
											<a class="btn btn-lg btn-danger" style="width: 100%" disabled><strong> Sold Out </strong></a>
										</div>
									</div>
								</div>
								<div class="col-sm-6 col-md-4 col-lg-4 isotope-item">
									<div class="image-box style-2 mb-20 bordered">
										<div class="overlay-container overlay-visible">
											<span class="campaign-badge"><i>0/2</i></span>
											<img src="<c:url value='/resources/images/perks-7.jpg' />" alt="">
											<div class="overlay-link"></div>									
										</div>
										<div class="body">
											<h3 class="text-center">Reward Type</h3>
											<div class="separator"></div>
											<p class="small mb-10"><i class="icon-calendar"></i> Feb, 2015 <i class="pl-10 icon-tag-1"></i> App development</p>
											<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
											<a class="btn btn-lg btn-danger" style="width: 100%" disabled><strong> Sold Out </strong></a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- main end -->
					</div>
				</div>
			</section>
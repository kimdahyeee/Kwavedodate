	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<section class="main-container">
		<div class="container">
			<div class="main object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
				<div class="row text-center">	
					<ul class="nav nav-pills nav-justified" role="tablist">
						<li class="active"><a href="#pill-1" role="tab" data-toggle="tab">진행 전</a></li>
						<li><a href="#pill-2" role="tab" data-toggle="tab"> 진행 중</a></li>
						<li><a href="#pill-3" role="tab" data-toggle="tab"> 종료</a></li>
					</ul>
					<h2 class="title text-center"><strong>Campaign을 선택하세요</strong></h2>
					<div class="form-block center-block p-30">
						<div class="tab-content clear-style">
							<!-- 진행 전 시작 -->
							<!-- ====== -->
							<div class="tab-pane active" id="pill-1">
								<div class="campaignsList">
									<ul class="nav nav-pills nav-stacked">
										<li><a href="<c:url value='/admin/manageRewards'/>">IU_Campaign</a></li>
										<li><a href="<c:url value='/admin/manageRewards'/>">Gong_You_Campaign</a></li>
										<li><a href="<c:url value='/admin/manageRewards'/>">Kim_Go_eun_Campaign</a></li>
									</ul>
								</div>
							</div>
							<!-- 진행 전 끝 -->
							<!-- ====== -->
							
							<!-- 진행 중 시작 -->
							<!-- ====== -->
							<div class="tab-pane" id="pill-2">
								<div class="campaignsList">
									<ul class="nav nav-pills nav-stacked">
										<li><a href="<c:url value='/admin/manageRewards'/>">IU_Campaign</a></li>
									</ul>
								</div>
							</div>
							<!-- 진행 중 끝 -->
							<!-- ====== -->
							
							<!-- 종료 시작 -->
							<!-- ====== -->
							<div class="tab-pane" id="pill-3">
								<div class="campaignsList">
									<ul class="nav nav-pills nav-stacked">
										<li><a href="<c:url value='/admin/manageRewards'/>">IU_CampaignEnd</a></li>
										<li><a href="<c:url value='/admin/manageRewards'/>">Kim_Go_eun_CampaignEnd</a></li>
									</ul>
								</div>
							</div>
							<!-- 종료 끝 -->
							<!-- ====== -->
						</div>	
					</div>
				</div>		
			</div>
		</div>
	</section>
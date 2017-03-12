			<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
			<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
			<div class="banner video-background-banner pv-40 dark-translucent-bg hovered">
				<div class="container">
					<div class="row">
						<div class="col-md-8 text-center col-md-offset-2 pv-20">
							<h1 class="title object-non-visible" data-animation-effect="fadeIn" data-effect-delay="100"><spring:message code="mainTitle1"/></h1>
							<p class="text-center object-non-visible" data-animation-effect="fadeIn" data-effect-delay="100">
								<spring:message code="mainTitle2"/>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div id="page-start"></div>
			<section class="light-gray-bg pv-30 clearfix">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<h2 class="text-center"><spring:message code="mainTitle3"/><strong> <spring:message code="mainTitle4"/></strong></h2>
						</div>
					</div>
					<div class="row">
						<div class="col-md-10 col-md-offset-1">
							<c:forEach items="${campaignsList}" var="campaignsLists" begin="0" end="${fn:length(campaignsList)}" step="1" varStatus="status">
								<div class="col-sm-6">
									<div class="image-box style-2 mb-20 bordered light-gray-bg">
										<div class="overlay-container overlay-visible">
											<span class="campaign-badge">
												<i>${campaignsList[status.index].campaignDueDate}</i>
											</span>
											<img src="${campaignsList[status.index].campaignImg}" />
											<a class="overlay-link" href="<c:url value='/campaigns/${campaignsList[status.index].campaignName}' />"></a>
										</div>
										<div class="body">
											<p class="small mb-10 text-muted"><i class="icon-calendar"></i> Feb, 2015 <i class="pl-10 icon-tag-1"></i> Web Design</p>
											<h4 class="ellipsis"><strong><c:out value="${campaignsList[status.index].campaignSubject }"/></strong></h4>
											<label></label>
											<div class="btn-learn-more">
												<a class="text-info btn-md-link" href="<c:url value='/campaigns/${campaignsList[status.index].campaignName}' />">Learn more <i class="fa fa-angle-right" aria-hidden="true"></i></a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<label></label>
							<c:if test="${fn:length(campaignsList) == '4'}">
								<div class="text-center">
									<a href="campaigns" class="btn btn-lg btn-danger"><spring:message code="mainTitle8"/></a>
								</div>
							</c:if>
						</div>
					</div>
				</div>	
			</section>
			
			<section class="dark-translucent-bg" style="background-color: black;">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h2 class="text-center"><spring:message code="mainTitle5"/><strong><spring:message code="mainTitle6"/></strong></h2>
					</div>
				</div>
				<div class="swiper-container">
			        <div class="swiper-wrapper">
			            <div class="swiper-slide">
			            	<img class="swiper-img" src="resources/images/mission_continues-01.jpg">			
			            </div>
			            <div class="swiper-slide">
							<img class="swiper-img" src="resources/images/mission_continues-02.jpg">			
			            </div>
			            <div class="swiper-slide">
			            	<img class="swiper-img" src="resources/images/mission_continues-03.jpg">
			            </div>
			            <div class="swiper-slide">
			            	<img class="swiper-img" src="resources/images/mission_continues-04.jpg">			
			            </div>
			            <div class="swiper-slide">
			            	<img class="swiper-img" src="resources/images/mission_continues-05.jpg">			
			            </div>
			        </div>
			        <!-- pagination -->
			        <div class="swiper-pagination"></div>
			       
			       	<!-- arrow button -->
			        <div class="swiper-button-next"><img src="resources/images/arrow-right.png"></div>
			        <div class="swiper-button-prev"><img src="resources/images/arrow-left.png"></div>
			    </div>
			</section>
			<div class="clearfix"></div>

			<div class="section">
				<div class="container text-center">
					<h2><strong><spring:message code="mainTitle7"/></strong></h2>
					<div class="clients-container">
						<div class="clients">
							<div class="client-image object-non-visible" data-animation-effect="fadeIn" data-effect-delay="100">
								<a href="#"><img src="resources/images/client-1.png" alt=""></a>
							</div>
							<div class="client-image object-non-visible" data-animation-effect="fadeIn" data-effect-delay="200">
								<a href="#"><img src="resources/images/client-2.png" alt=""></a>
							</div>
							<div class="client-image object-non-visible" data-animation-effect="fadeIn" data-effect-delay="300">
								<a href="#"><img src="resources/images/client-3.png" alt=""></a>
							</div>
							<div class="client-image object-non-visible" data-animation-effect="fadeIn" data-effect-delay="400">
								<a href="#"><img src="resources/images/client-4.png" alt=""></a>
							</div>
							<div class="client-image object-non-visible" data-animation-effect="fadeIn" data-effect-delay="500">
								<a href="#"><img src="resources/images/client-5.png" alt=""></a>
							</div>
							<div class="client-image object-non-visible" data-animation-effect="fadeIn" data-effect-delay="600">
								<a href="#"><img src="resources/images/client-6.png" alt=""></a>
							</div>
							<div class="client-image object-non-visible" data-animation-effect="fadeIn" data-effect-delay="700">
								<a href="#"><img src="resources/images/client-7.png" alt=""></a>
							</div>
							<div class="client-image object-non-visible" data-animation-effect="fadeIn" data-effect-delay="800">
								<a href="#"><img src="resources/images/client-8.png" alt=""></a>
							</div>
						</div>
					</div>
					<!-- clients end -->
				</div>
			</div>

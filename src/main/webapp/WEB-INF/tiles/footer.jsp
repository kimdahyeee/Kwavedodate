	<%@ page language="java" contentType="text/htmll; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<footer id="footer" class="clearfix dark">				
		<div class="subfooter">
			<div class="container">
				<div class="subfooter-inner">
					<div class="row">
						<div class="col-md-12 text-center">

							<h3 class="title"><spring:message code="followUsOn"/></h3>
							<ul class="social-links circle animated-effect-1">
								<li class="facebook"><a target="_blank" href="https://www.facebook.com/kwavedonation/"><i class="fa fa-facebook"></i></a></li>
								<li class="twitter"><a target="_blank" href="http://www.twitter.com"><i class="fa fa-twitter"></i></a></li>
								<li class="googleplus"><a target="_blank" href="http://plus.google.com"><i class="fa fa-google-plus"></i></a></li>
								<li class="linkedin"><a target="_blank" href="http://www.linkedin.com"><i class="fa fa-linkedin"></i></a></li>
								<li class="xing"><a target="_blank" href="http://www.xing.com"><i class="fa fa-xing"></i></a></li>
							</ul>

							<div class="footer-category">
								<div class="row text-center">
									<div class="form-inline" data-animation-effect="fadeIn">
										<a class="btn square btn-gray-transparent btn-lg foot-cate" href="<c:url value='/aboutUs' />"><spring:message code="aboutUs"/></a>
										<a class="btn square btn-gray-transparent btn-lg foot-cate" href="<c:url value='/privacyPolicy' />"><spring:message code="partnership"/></a>
										<a class="btn square btn-gray-transparent btn-lg foot-cate" href="#"><spring:message code="privacyPolicy"/></a>
										<a class="btn square btn-gray-transparent btn-lg foot-cate" href="<c:url value='/termsOfUse' />"><spring:message code="termsOfUse"/></a>
									</div>
								</div>
							</div>

							<label></label>
							<p class="text-center">Copyright &#9400; 2016 KWAVE D. All Rights Reserved</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<%@include file="/WEB-INF/views/language.jsp"%>
	<!-- page-wrapper end -->
	<script type="text/javascript" src="<c:url value='/resources/plugins/jquery.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/bootstrap/js/bootstrap.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/plugins/modernizr.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/plugins/rs-plugin/js/jquery.themepunch.tools.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/plugins/rs-plugin/js/jquery.themepunch.revolution.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/plugins/isotope/isotope.pkgd.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/plugins/magnific-popup/jquery.magnific-popup.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/plugins/waypoints/jquery.waypoints.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/plugins/jquery.countTo.js' />"></script>
	<script type="text/javascript" src="//tbctour.com/script/jquery-scrolltofixed.js" ></script>
	<script type="text/javascript" src="<c:url value='/resources/plugins/jquery.parallax-1.1.3.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/plugins/jquery.validate.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/plugins/vide/jquery.vide.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/plugins/owl-carousel/owl.carousel.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/plugins/jquery.browser.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/plugins/SmoothScroll.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/plugins/swiper/swiper.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/plugins/jquery.countdown/jquery.plugin.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/plugins/jquery.countdown/jquery.countdown.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/coming.soon.config.js' />"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/template.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/socialLogin.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/customs.js' />"></script>
	</body>
</html>
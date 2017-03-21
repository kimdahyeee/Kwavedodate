<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>

<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>KWAVE D</title>
		<meta name="description" content="Kwave Donate cor">
		<meta name="author" content="Choi Hong Hee">

		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="<c:url value='/resources/images/favicon.png' />">

		<link href='https://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,500italic,700,700italic' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Raleway:700,400,300' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=PT+Serif' rel='stylesheet' type='text/css'>


		<link href="<c:url value='/resources/bootstrap/css/bootstrap.css' />" rel="stylesheet">
		<link href="<c:url value='/resources/fonts/font-awesome/css/font-awesome.css' />" rel="stylesheet">
		<link href="<c:url value='/resources/fonts/fontello/css/fontello.css' />" rel="stylesheet">

		<link href="<c:url value='/resources/plugins/magnific-popup/magnific-popup.css' />" rel="stylesheet">
		<link href="<c:url value='/resources/plugins/rs-plugin/css/settings.css' />" rel="stylesheet">
		<link href="<c:url value='/resources/css/animations.css' />" rel="stylesheet">
		<link href="<c:url value='/resources/plugins/owl-carousel/owl.carousel.css' />" rel="stylesheet">
		<link href="<c:url value='/resources/plugins/owl-carousel/owl.transitions.css' />" rel="stylesheet">
		<link href="<c:url value='/resources/plugins/swiper/swiper.min.css' />" rel="stylesheet" type="text/css" >
		<link href="<c:url value='/resources/plugins/hover/hover-min.css' />" rel="stylesheet">		
		
		<link href="<c:url value='/resources/css/styles.css' />" rel="stylesheet" >
		<link href="<c:url value='/resources/css/skins/light_blue.css' />" rel="stylesheet">

		<link href="<c:url value='/resources/css/customs.css' />" rel="stylesheet">

	</head>

	<body class="no-trans transparent-header">	
		<div class="scrollToTop circle"><i class="icon-up-open-big"></i></div>
		<input id="locale" type="hidden" value="<spring:message code='locale'/>"/>

			<div class="header-container">
				<header class="header fixed clearfix dark">
					<div class="container">
						<div class="row">
						<!-- 핸드폰일때 -->
							<div class="col-md-3">
								<div class="header-left clearfix">
									<div class="header-dropdown-buttons text-center hidden-lg hidden-md hidden-sm circle small">
										<div class="btn-group dropdown">
											<button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
												<i class="fa fa-bars" aria-hidden="true"></i>
											</button>
											
											<ul class="dropdown-menu dropdown-menu-right dropdown-animation">
												<li>
													<a href="<c:url value='/campaigns'/>"><strong><spring:message code="campaigns"/></strong></a>
												</li>
												<li>
													<a href="<c:url value='/aboutUs'/>"><strong><spring:message code="aboutUs"/></strong></a>
												</li>
												<sec:authorize access="isAnonymous()">
													<li>
														<a href="<c:url value='/login'/>"><strong><spring:message code="login"/></strong></a>
													</li>
												</sec:authorize>
										
												<sec:authorize access="isAuthenticated()">
													<li>
														<a href="<c:url value='/myAccount'/>"><strong><spring:message code="myAccount"/></strong></a>
													</li>
												</sec:authorize>
												<a href="<c:url value='?lang=ko'/>" class="btn btn-default btn-sm">한국어</a>
												<a href="<c:url value='?lang=en'/>" class="btn btn-default btn-sm">English</a>
												<a href="<c:url value='?lang=ch'/>" class="btn btn-default btn-sm">中文</a>
											</ul>
										</div>
									</div>
									<div id="logo" class="logo">
										<a href="<c:url value='/'/>"><img id="logo_img" width="120px" src="<c:url value='/resources/images/logo.png' />" alt="The Project"></a>
									</div>
								</div>
							</div>
							<!-- 넓은 화면일때 -->
							<div class="col-md-9">
								<div class="header-right clearfix">
									<div class="main-navigation animated with-dropdown-buttons"> 
										<nav class="navbar navbar-default hidden-xs" role="navigation">
											<div class="container-fluid">
												<div class="navbar-header">
													<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
														<span class="sr-only">Toggle navigation</span>
														<span class="icon-bar"></span>
														<span class="icon-bar"></span>
														<span class="icon-bar"></span>
													</button>
												</div>
												<div class="collapse navbar-collapse" id="navbar-collapse-1">
													<ul class="nav navbar-nav">
														<li>
															<a href="<c:url value='/campaigns'/>"><spring:message code="campaigns"/></a>
														</li>
														<li>
															<a href="<c:url value='/aboutUs'/>"><spring:message code="aboutUs"/></a>
														</li>
														<sec:authorize access="isAnonymous()">
														<li>
															<a href="<c:url value='/login'/>"><spring:message code="login"/></a>
														</li>
														</sec:authorize>
												
														<sec:authorize access="isAuthenticated()">
															<li>
																<a href="<c:url value='/myAccount'/>"><spring:message code="myAccount"/></a>
															</li>
														</sec:authorize>
														<li class="header-top-dropdown">
															<a href="#" class="dropdown-toggle language" data-toggle="dropdown"><spring:message code="language"/><i class="fa fa-angle-down" aria-hidden="true"></i></a>
															<ul class="dropdown-menu dropdown-menu-right dropdown-animation">
																<li><a href="<c:url value='?lang=ko'/>"><strong>한국어</strong></a></li>
																<li><a href="<c:url value='?lang=en'/>"><strong>English</strong></a></li>
																<li><a href="<c:url value='?lang=ch'/>"><strong>中文</strong></a></li>
															</ul>
														</li>
													</ul>
												</div>
											</div>
										</nav>
									</div>
								</div>
							</div>
						</div>
					</div>
				</header>
			</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>

<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>KWAVE D</title>
		<meta name="description" content="Kwave Donate cor">
		<meta name="author" content="Choi Hong Hee">

		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="<c:url value='/resources/images/favicon.png' />">

		<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,500italic,700,700italic' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Raleway:700,400,300' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=PT+Serif' rel='stylesheet' type='text/css'>

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
												<li id="hCampaigns">
													<a href="">Campaigns</a>
												</li>
												<li id="hAboutUs">
													<a href="<c:url value='/aboutUs'/>">About Us</a>
												</li>
												<sec:authorize access="isAnonymous()">
														<li id="hLogin">
															<a href="<c:url value='/login'/>">Log in</a>
														</li>
												</sec:authorize>
										
												<sec:authorize access="isAuthenticated()">
													<li id="hMyAccount">
														<a href="<c:url value='/myAccount'/>">My account</a>
													</li>
												</sec:authorize>
												<a id="hKorean" href="#" class="btn btn-default btn-sm">Korean</a>
												<a id="hEnlgish" href="#" class="btn btn-default btn-sm">English</a>
												<a id="hChinese" href="<c:url value='?lang=ch'/>" class="btn btn-default btn-sm">Chinese</a>
											</ul>
										</div>
									</div>
									<div id="logo" class="logo">
										<a href="<c:url value='/'/>"><img id="logo_img" src="<c:url value='/resources/images/logo.png' />" alt="The Project"></a>
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
															<a href="<c:url value='/campaigns'/>">Campaigns</a>
														</li>
														<li>
															<a href="<c:url value='/aboutUs'/>">About Us</a>
														</li>
														<sec:authorize access="isAnonymous()">
														<li>
															<a href="<c:url value='/login'/>">Log in</a>
														</li>
														</sec:authorize>
												
														<sec:authorize access="isAuthenticated()">
															<li>
																<a href="<c:url value='/myAccount'/>">My account</a>
															</li>
														</sec:authorize>
														<li class="header-top-dropdown">
															<a href="#" class="dropdown-toggle language" data-toggle="dropdown">Language <i class="fa fa-angle-down" aria-hidden="true"></i></a>
															<ul class="dropdown-menu dropdown-menu-right dropdown-animation">
																<li><a href="<c:url value='?lang=ko'/>">Korean</a></li>
																<li><a href="<c:url value='?lang=en'/>">English</a></li>
																<li><a href="<c:url value='?lang=ch'/>">Chinese</a></li>
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
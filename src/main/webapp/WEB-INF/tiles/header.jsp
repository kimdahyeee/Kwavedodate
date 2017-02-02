<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="com.kwavedonate.kwaveweb.user.vo.UserDetailsVO" %>

<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Object principal = auth.getPrincipal();
	String name="";
	if(principal != null && principal instanceof UserDetailsVO) {
		name = ((UserDetailsVO)principal).getUsername();
	}
%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<title>KWAVE D</title>
		<meta name="description" content="Kwave Donate cor">
		<meta name="author" content="Choi Hong Hee">

		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="resources/images/favicon.png">

		<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,500italic,700,700italic' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Raleway:700,400,300' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=PT+Serif' rel='stylesheet' type='text/css'>

		<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
		<link href="resources/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">
		<link href="resources/fonts/fontello/css/fontello.css" rel="stylesheet">

		<link href="resources/plugins/magnific-popup/magnific-popup.css" rel="stylesheet">
		<link href="resources/plugins/rs-plugin/css/settings.css" rel="stylesheet">
		<link href="resources/css/animations.css" rel="stylesheet">
		<link href="resources/plugins/owl-carousel/owl.carousel.css" rel="stylesheet">
		<link href="resources/plugins/owl-carousel/owl.transitions.css" rel="stylesheet">
		<link href="resources/plugins/swiper/swiper.min.css" rel="stylesheet" type="text/css" >
		<link href="resources/plugins/hover/hover-min.css" rel="stylesheet">		
		
		<link href="resources/css/styles.css" rel="stylesheet" >
		<link href="resources/css/skins/light_blue.css" rel="stylesheet">

		<link href="resources/css/customs.css" rel="stylesheet">

	</head>

	<body class="no-trans transparent-header">	
		<div class="scrollToTop circle"><i class="icon-up-open-big"></i></div>
		
		<div class="page-wrapper">
			<div class="header-container">
				<header class="header fixed clearfix dark">
					<div class="container">
						<div class="row">
							<div class="col-md-3">
								<div class="header-left clearfix">
									<div class="header-dropdown-buttons text-center visible-xs">
										<div class="btn-group dropdown hidden-lg hidden-md hidden-sm circle small">
											<button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
												<i class="fa fa-bars" aria-hidden="true"></i>
											</button>
											<ul class="dropdown-menu dropdown-menu-right dropdown-animation">
												<li>
													<a href="campaigns">Campaigns</a>
												</li>
												<li>
													<a href="aboutUs">About Us</a>
												</li>
												<sec:authorize access="isAnonymous()">
													<li class="">
														<a href="login">Log in</a>
													</li>
												</sec:authorize>
												<sec:authorize access="isAuthenticated()">
													<li class="">
														<a href="myAccount">My account</a>
													</li>
													<li class="">
														<a href="/logout">Log out</a>
													</li>
												</sec:authorize>
												<a href="#" class="btn btn-default btn-sm">Korean</a>
												<a href="#" class="btn btn-default btn-sm">English</a>
												<a href="#" class="btn btn-default btn-sm">Chinese</a>
											</ul>
										</div>
									</div>
									<div id="logo" class="logo">
										<a href="/kwaveweb/"><img id="logo_img" src="resources/images/logo.png" alt="The Project"></a>
									</div>
								</div>
							</div>

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
															<a href="campaigns">Campaigns</a>
														</li>
														<li>
															<a href="aboutUs">About Us</a>
														</li>
														<sec:authorize access="isAnonymous()">
															<li class="">
																<a href="login">Log in</a>
															</li>
														</sec:authorize>
														<sec:authorize access="isAuthenticated()">
															<li class="">
																<a href="myAccount">My account</a>
															</li>
															<li class="">
																<a href="logout">Log out</a>
															</li>
														</sec:authorize>
														<li class="header-top-dropdown">
															<a href="#" class="dropdown-toggle language" data-toggle="dropdown">Language <i class="fa fa-angle-down" aria-hidden="true"></i></a>
															<ul class="dropdown-menu dropdown-menu-right dropdown-animation">
																<li ><a href="#">Korean</a></li>
																<li ><a href="#">English</a></li>
																<li ><a href="#">Chinese</a></li>
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
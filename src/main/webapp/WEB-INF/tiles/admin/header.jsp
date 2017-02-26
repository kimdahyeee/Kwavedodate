<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="UTF-8">
		<title>KWAVE D 관리자</title>
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
<body>
	<div class="header-container">
		<header class="header fixed clearfix">
			<div class="container">
				<h3>KWAVE D Administor page</h3>
								
				<ul class="list-inline">
					<li><a href="<c:url value='/admin/main'/>">Home</a></li>
					<li><a href="<c:url value='/admin/manageUsers'/>">Manage Users</a></li>
					<li><a href="<c:url value='/admin/manageCampaigns'/>">Manage Campaigns</a></li>
					<li><a href="<c:url value='/admin/manageRewards'/>">Manage Rewards</a></li>
				 </ul>
			</div>
		</header>
	</div>
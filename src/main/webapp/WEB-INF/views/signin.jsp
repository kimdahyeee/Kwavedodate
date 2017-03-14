			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
			<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
			<div class="main-container">
				<div class="container">
					<div class="row">
						<div class="main object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
							<div class="form-block center-block p-30">
								<h2 class="title text-center"><strong><spring:message code="signIn"/></strong></h2>
								<form class="form-horizontal" id="validateSignIn">
									<div class="form-group has-feedback">
										<div class="col-sm-12">
											<input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="<spring:message code="email"/>" required>
											<i class="fa fa-envelope-o form-control-feedback"></i>
										</div>
									</div>
									<div class="form-group has-feedback">
										<div class="col-sm-12">
											<input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="<spring:message code="password"/>" required>
											<i class="fa fa-lock form-control-feedback"></i>

										</div>
									</div>
									<div class="form-group has-feedback">
										<div class="col-sm-12">
											<input type="password" class="form-control" id="userPasswordConfirm" name="userPasswordConfirm" placeholder="<spring:message code="passwordConfirm"/>" required>
											<i class="fa fa-lock form-control-feedback"></i>
										</div>
									</div>
									<div class="form-group has-feedback">
										<div class="col-sm-12">
											<input type="text" class="form-control" id="userName" name="userName" placeholder="<spring:message code="userName"/>" required>
											<i class="fa fa-user form-control-feedback"></i>

										</div>
									</div>
									<div class="checkbox">
										<label>
											<input type="checkbox" id="signInAgreement" name="signInAgreement" required><spring:message code="agreement"/> <a href="<c:url value='/privacyPolicy' />" onclick="window.open(this.href, 'popup', 'popup');return false;" target="_blank"> <spring:message code="privacyPolicy"/></a> <spring:message code="and"/> <a href="<c:url value='/termsOfUse' />" onclick="window.open(this.href, 'popup', 'popup');return false;" target="_blank"><spring:message code="termsOfUse"/></a>
										</label>
									</div>	
									<input type="hidden" id="location" value="${location}">
									<div class="form-group">
										<div class="col-sm-12">							
											<button type="submit" class="btn square btn-danger" style="width: 100%;"><spring:message code="signIn"/> <i class="fa fa-user"></i></button>
										</div>
									</div>
								</form>
								
							</div>
						</div>

					</div>
				</div>
			</div>
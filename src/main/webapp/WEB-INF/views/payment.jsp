			<%@page import="org.springframework.context.i18n.LocaleContextHolder"%>
			<%@ page import="java.util.Locale" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
			<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
			<%Locale currentLocale = LocaleContextHolder.getLocale();%>
			
			<section class="main-container campaign-perks">
				<div class="container">
					<div class="row">
						<div class="main col-md-10 col-md-offset-1">
							<h1 class="page-title text-center"><spring:message code="paymentText1"/></h1>
							<label></label>
							<!-- Start Form Tag -->
							<!-- ========= -->
							<form name="paymentForm" class="form-horizontal" id="validatePaymentInfo">
								<div class="isotope-container-fitrows row grid-space-10">
									<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 isotope-item">
										<div class="mb-20 ph-20 bordered text-left">
											<input type="hidden" id="rewardNum" value="${rewardNum }"/>
											<h3><spring:message code="paymentText2"/></h3>
											<label></label>
											<div class="form-group has-feedback text-center">
												<label for="inputUserEmail" class="col-xs-3 col-sm-3"><spring:message code="email"/>: </label>
												<div class="col-xs-9 col-sm-9">
													<input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="<spring:message code="email"/>" value="<sec:authentication property="principal.username"/>" required disabled>
												</div>
											</div>
											<div class="form-group has-feedback text-center">
												<label for="inputUserName" class="col-xs-3 col-sm-3"><spring:message code="userName"/>: </label>
												<div class="col-xs-9 col-sm-9">
													<input type="text" class="form-control" id="userName" name="userName" placeholder="<spring:message code="userName"/>" value="${user.USERNAME}" required>
												</div>
											</div>
											<div class="form-group has-feedback text-center">
												<label for="inputPhone" class="col-xs-3 col-sm-3"><spring:message code="phoneNumber"/>: </label>
												<div class="col-xs-9 col-sm-9">
													<input type="text" class="form-control" id="phone" name="phone" placeholder="<spring:message code="phoneNumber"/>" value="${user.PHONE }" required>
												</div>
											</div>
											
											<label></label>
								
											
											<c:if test="${rewardNum > 0}">
												<h3><spring:message code="paymentText3"/></h3>
												<label></label>
												<div class="form-group has-feedback text-center">
													<label for="inputCountry" class="col-xs-3 col-sm-3"><spring:message code="country"/> : </label>
													<div class="col-xs-9 col-sm-9">
														<input type="hidden" id="countryVal" value="${user.COUNTRY}"/>
														<select class="form-control" id="country" name="country" required> 
			                                                <option value="Brazil">Brazil</option>
			                                                <option value="China"><spring:message code="china"/></option>
			                                                <option value="HongKong">Hong Kong</option>
			                                                <option value="Japan"><spring:message code="japan"/></option>
			                                                <option value="Korea"><spring:message code="korea"/></option>
			                                                <option value="United States"><spring:message code="unitedStates"/></option>
														</select>
													</div>
												</div>
												
												<div class="form-group has-feedback text-center">
													<label for="inputZipCode" class="col-xs-3 col-sm-3"><spring:message code="zipCode"/>: </label>
													<div class="col-xs-9 col-sm-9">
														<input type="text" class="form-control" id="zipCode" name="zipCode" placeholder="<spring:message code="zipCode"/>" value="${user.ZIPCODE}" required>
													</div>
												</div>
												<div class="form-group has-feedback text-center">
													<label for="inputAddress" class="col-xs-3 col-sm-3"><spring:message code="address"/>: </label>
													<div class="col-xs-9 col-sm-9">
														<input type="text" class="form-control" id="address1" name="address1" placeholder="<spring:message code="address"/>" value="${user.ADDRESS1}" required>
														
													</div>
												</div>
												<div class="form-group has-feedback text-center">
													<label for="inputAddressDetail" class="col-xs-3 col-sm-3"><spring:message code="addressDetail"/>: </label>
													<div class="col-xs-9 col-sm-9">
														<input type="text" class="form-control" id="address2" name="address2" placeholder="<spring:message code="addressDetail"/>" value="${user.ADDRESS2}">
													</div>
												</div>
												<div class="appendArea"></div>
												<c:if test="${user.COUNTRY eq 'Korea'}">
													<input type="hidden" id="city" value="">
													<input type="hidden" id="region" value="">
													<input type="hidden" id="shippingMethod" value="국내배송">
												</c:if>
												<c:if test="${user.COUNTRY ne 'Korea'}">
													<div class="form-group has-feedback text-center cityArea">
														<label for="inputCity" class="col-xs-3 col-sm-3"><spring:message code="city"/> : </label>
														<div class="col-xs-9 col-sm-9">
															<input type="text" class="form-control" id="city" name="city" placeholder="<spring:message code="city"/>" value="${user.CITY}" required>
														</div>
													</div>
													<div class="form-group has-feedback text-center regionArea">
														<label for="inputRegion" class="col-xs-3 col-sm-3"><spring:message code="region"/> : </label>
														<div class="col-xs-9 col-sm-9">
															<input type="text" class="form-control" id="region" name="region" placeholder="<spring:message code="region"/>" value="${user.REGION}" required>
														</div>
													</div>
												</c:if>
												<div class="form-group has-feedback text-center">
													<label for="inputShippingMethod" class="col-xs-3 col-sm-3"><spring:message code="shippingMethod"/> : </label>
													<div class="col-xs-9 col-sm-9">
														<input type="hidden" class="form-control shippingMethod" id="shippingMethod" name="shippingMethod" value="EMS" required disabled>
														<input type="text" class="form-control shippingMethod" id="shippingMethodVal" name="shippingMethod" value="EMS" required disabled>
													</div>
												</div>
												<div class="form-group has-feedback text-center">
													<label for="inputNode" class="col-xs-3 col-sm-3"><spring:message code="note"/> : </label>
													<div class="col-xs-9 col-sm-9">
														<textarea id="note"></textarea>
													</div>
												</div>
											</c:if>
										</div>
									</div>
									<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 isotope-item delivery-summary">
										<div class="mb-20 bordered">
											<c:if test="${rewardNum != 0 }">
												<div class="overlay-container overlay-visible">
													<img src="${reward.rewardImg }"/>
													<div class="overlay-link"></div>										
												</div>
											</c:if>
											<div class="body ph-20 text-center">												
												<div class="reward-detail">
													<input type="hidden" id="rewardNum" value="${rewardNum}"/>
													<c:choose>
			                                          <c:when test="${rewardNum != 0 }">
			                                          	  <h5><strong>${reward.rewardSubject}</strong></h5>
			                                          	  <input type="hidden" id="rewardSubject" value="${reward.rewardSubject}">
			                                          	  <div class="separator"></div>
				                                          <span class="text-left"><spring:message code="rewardAmount"/>: </span> 
				                                          <span class="text-right rewardAmountArea"><spring:message code="currency"/>${reward.rewardAmount}</span><br>
				                                          <span class="text-left"><spring:message code="shippingAmount"/>: </span>
				                                          <span class="text-right shippingAmountArea"></span><br>
				                                          <span class="text-left"><spring:message code="totalAmount"/>:</span>
				                                          <span class="text-right totalAmountArea"></span><br>
				                                          <input type="hidden" id="rewardAmount" name="rewardAmount" value="${reward.rewardAmount}"/>
			                                          </c:when>
			                                          <c:otherwise>
				                                          <span class="text-left"><spring:message code="totalAmount"/> : </span>
				                                          <span class="text-right totalAmountArea"><spring:message code="currency"/>${defaultMoney}</span><br>
				                                          <input type="hidden" id="rewardAmount" name="rewardAmount" value="${defaultMoney}"> 
				                                          <input type="hidden" id="zipCode" value="" >
														  <input type="hidden" id="address1" value="" >
														  <input type="hidden" id="address2" value="" >
														  <input type="hidden" id="city" value="" >
														  <input type="hidden" id="country" value="">
														  <input type="hidden" id="region" value="" >
														  <input type="hidden" id="shippingMethod" value="" >
														  <input type="hidden" id="note" value="" >
														  <input type="hidden" id="rewardAmount" value="" >
														  <input type="hidden" id="rewardNum" value="0">
														  <input type="hidden" id="campaignName" value="${campaignName}" >
														  <input type="hidden" id="totalAmount" value="10" >
														  <input type="hidden" id="rewardSubject" value="${reward.rewardSubject}">
														  <input type="hidden" id="shippingAmount" value="0" >
			                                          </c:otherwise>
			                                       </c:choose>
													<input type="hidden" id="totalAmount" name="totalAmount" value="">
													<input type="hidden" id="shippingAmount" name="shippingAmount" value="">
													<input type="hidden" id="campaignName" name="campaignName" value="${campaignName}">
													<label></label>
												</div>
											</div>
										</div>
										<div class="style-2 mb-20 ph-20 bordered paymentMethodArea">
											<div id="paymentMethod">
												<span><input type="radio" name="payment_method" id="payment_method_card" value="card" checked required/></span> <spring:message code="card"/><span class="paymentCardArea"></span><br>
												<span><input type="radio" name="payment_method" id="payment_method_trans" value="trans" required/></span> <spring:message code="trans"/><span class="paymentTransArea"></span><br>
												<span><input type="radio" name="payment_method" id="payment_method_phone" value="phone" required/> </span><spring:message code="phone"/> <span class="paymentPhoneArea"></span><br>
												<span><input type="radio" name="payment_method" id="payment_method_paypal" value="paypal" required></span> <spring:message code="paypal"/><span class="paymentPaypalArea"></span><br/>													
											
											</div>

										</div>
										<input type="hidden" id="currentLocale" value="<%=currentLocale%>">
										<button type="submit" class="btn btn-lg btn-danger" style="width: 100%"><strong><spring:message code="submitPayment"/></strong></button>
									</div>
								</div>
							</form>
							<!-- End Form Tag -->
							<!-- ========= -->
							<label></label>
						</div>
					</div>
				</div>
			</section>
			<label class="space-top"> </label>
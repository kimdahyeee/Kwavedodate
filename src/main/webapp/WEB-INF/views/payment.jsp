			<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
			<section class="main-container campaign-perks">
				<div class="container">
					<div class="row">
						<div class="main col-md-10 col-md-offset-1">
							<h1 class="page-title text-center">Just a few more details...</h1>
							<label></label>
							<!-- Start Form Tag -->
							<!-- ========= -->
							<form name="paymentForm" class="form-horizontal" id="validatePaymentInfo">
								<div class="isotope-container-fitrows row grid-space-10">
									<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 isotope-item">
										<div class="mb-20 ph-20 bordered text-left">
											<input type="hidden" id="rewardNum" value="${rewardNum }"/>
											<h3>Tell us about yourself</h3>
											<label></label>
											<div class="form-group has-feedback text-center">
												<label for="inputUserEmail" class="col-xs-3 col-sm-3">Email : </label>
												<div class="col-xs-9 col-sm-9">
													<input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="Email" value="<sec:authentication property="principal.username"/>" required disabled>
												</div>
											</div>
											<div class="form-group has-feedback text-center">
												<label for="inputUserName" class="col-xs-3 col-sm-3">Name : </label>
												<div class="col-xs-9 col-sm-9">
													<input type="text" class="form-control" id="userName" name="userName" placeholder="Name" value="${user.USERNAME}" required>
												</div>
											</div>
											<div class="form-group has-feedback text-center">
												<label for="inputPhone" class="col-xs-3 col-sm-3">Phone : </label>
												<div class="col-xs-9 col-sm-9">
													<input type="text" class="form-control" id="phone" name="phone" placeholder="Phone" value="${user.PHONE }" required>
												</div>
											</div>
											<label></label>
											
											<c:if test="${rewardNum != 0}">
												<h3>Where should we send your stuff?</h3>
												<label></label>
												<div class="form-group has-feedback text-center">
													<label for="inputCountry" class="col-xs-3 col-sm-3">Country : </label>
													<div class="col-xs-9 col-sm-9">
														<input type="hidden" id="countryVal" value="${user.COUNTRY}"/>
														<select class="form-control" id="country" name="country" required> 
			                                                <option value="BR">Brazil</option>
			                                                <option value="CN">China</option>
			                                                <option value="HK">Hong Kong</option>
			                                                <option value="JP">Japan</option>
			                                                <option value="KR">Korea</option>
			                                                <option value="US">United States</option>
														</select>
													</div>
												</div>
												<div class="form-group has-feedback text-center">
													<label for="inputZipCode" class="col-xs-3 col-sm-3">Zip Code : </label>
													<div class="col-xs-9 col-sm-9">
														<input type="text" class="form-control" id="zipCode" name="zipCode" placeholder="ZipCode" value="${user.ZIPCODE}" required>
													</div>
												</div>
												<div class="form-group has-feedback text-center">
													<label for="inputAddress" class="col-xs-3 col-sm-3">Address : </label>
													<div class="col-xs-9 col-sm-9">
														<input type="text" class="form-control" id="address1" name="address1" placeholder="Address" value="${user.ADDRESS1}" required>
														
													</div>
												</div>
												<div class="form-group has-feedback text-center">
													<label for="inputAddressDetail" class="col-xs-3 col-sm-3">Address detail : </label>
													<div class="col-xs-9 col-sm-9">
														<input type="text" class="form-control" id="address2" name="address2" placeholder="Address Detail" value="${user.ADDRESS2}">
													</div>
												</div>
												<div class="appendArea"></div>
												
												<c:if test="${user.COUNTRY ne 'KR'}">
													<div class="form-group has-feedback text-center cityArea">
														<label for="inputCity" class="col-xs-3 col-sm-3">City : </label>
														<div class="col-xs-9 col-sm-9">
															<input type="text" class="form-control" id="city" name="city" placeholder="City" value="${user.CITY}" required>
														</div>
													</div>
													<div class="form-group has-feedback text-center regionArea">
														<label for="inputRegion" class="col-xs-3 col-sm-3">Region : </label>
														<div class="col-xs-9 col-sm-9">
															<input type="text" class="form-control" id="region" name="region" placeholder="Region" value="${user.REGION}" required>
														</div>
													</div>
												</c:if>
												<div class="form-group has-feedback text-center">
													<label for="inputShippingMethod" class="col-xs-3 col-sm-3">Shipping Method : </label>
													<div class="col-xs-9 col-sm-9">
														<input type="text" class="form-control" id="shippingMethod" name="shippingMethod" placeholder="Shipping Method" value="" required disabled>
													</div>
												</div>
												<div class="form-group has-feedback text-center">
													<label for="inputNode" class="col-xs-3 col-sm-3">Note : </label>
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
			                                          	  <div class="separator"></div>
				                                          <span class="text-left">Reward: </span> 
				                                          <span class="text-right">$${reward.rewardAmount }</span><br>
				                                          <span class="text-left">Shipping: </span>
				                                          <span class="text-right shippingAmountArea"></span><br>
				                                          <span class="text-left">Total:</span>
				                                          <span class="text-right totalAmountArea"></span><br>
				                                          <input type="hidden" id="rewardAmount" name="rewardAmount" value="${reward.rewardAmount}">
			                                          </c:when>
			                                          <c:otherwise>
				                                          <span class="text-left">Reward: </span>
				                                          <span class="text-right">$10</span><br>
				                                          <input type="hidden" id="rewardAmount" name="rewardAmount" value="10"> 
			                                          </c:otherwise>
			                                       </c:choose>
													<input type="hidden" id="totalAmount" name="totalAmount" value="">
													<input type="hidden" id="shippingAmount" name="shippingAmount" value="">
													<input type="hidden" id="campaignName" name="campaignName" value="${campaignName}">
													<label></label>
												</div>
											</div>
										</div>
										<div class="style-2 mb-20 ph-20 bordered text-center paymentMethodArea">
											<div id="paymentMethodKOR">
												<span class="text-left"><input type="radio" name="payment_method" id="payment_method_card" value="card" required checked/> Card</span>
												<span><input type="radio" name="payment_method" id="payment_method_trans" value="trans" required/> Trans</span>
												<span class="text-right"><input type="radio" name="payment_method" id="payment_method_phone" value="phone" required/> Phone</span>
											</div>
											<div id="paymentMethodGlobal">
												<span><input type="radio" name="payment_method" id="payment_method_paypal" value="paypal" checked required> Paypal</span>
											</div>	

										</div>
										<button type="submit" class="btn btn-lg btn-danger" style="width: 100%"><strong>Submit payment</strong></button>
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
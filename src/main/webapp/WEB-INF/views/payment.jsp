<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
			<section class="main-container campaign-perks">
				<div class="container">
					<div class="row">
						<div class="main col-md-10 col-md-offset-1">
							<h1 class="page-title text-center">Just a few more details...</h1>
							<label></label>
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

											<!-- 해외인 경우 -->
											<!-- 한국인 경우 hidden으로 기본값을 줄 것 -->
											<!-- =================================== -->
											<c:if test="${user.USERNATION eq 'KOR'}">
												<input type="hidden" id="nation" name="nation" value="KOR">
											</c:if>
											
											<c:if test="${user.USERNATION ne 'KOR'}">
											<input type="hidden" id="nation" name="nation" value="ENG">
												<div class="form-group has-feedback text-center">
													<label for="inputCity" class="col-xs-3 col-sm-3">City : </label>
													<div class="col-xs-9 col-sm-9">
														<input type="text" class="form-control" id="city" name="city" placeholder="City" value="${user.CITY}" required>
														
													</div>
												</div>
												<div class="form-group has-feedback text-center">
													<label for="inputRegion" class="col-xs-3 col-sm-3">Region : </label>
													<div class="col-xs-9 col-sm-9">
														<input type="text" class="form-control" id="region" name="region" placeholder="Region" value="${user.REGION}" required>
													</div>
												</div>
												<div class="form-group has-feedback text-center">
													<label for="inputCountry" class="col-xs-3 col-sm-3">Country : </label>
													<div class="col-xs-9 col-sm-9">
													<input type="hidden" id="countryOp" value="${user.COUNTRY}"/>
														<select class="form-control" id="country" name="country" required> 
			                                                <option value="AL">Albania</option>
			                                                <option value="DZ">Algeria</option>
			                                                <option value="AR">Argentina</option>
			                                                <option value="AM">Armenia</option>
			                                                <option value="AU">Australia</option>
			                                                <option value="AT">Austria</option>
			                                                <option value="AZ">Azerbaijan</option>
			                                                <option value="BH">Bahrain</option>
			                                                <option value="BD">Bangladesh</option>
			                                                <option value="BY">Belarus</option>
			                                                <option value="BE">Belgium</option>
			                                                <option value="BT">Bhutan</option>
			                                                <option value="BA">Bosnia and Herzegovina</option>
			                                                <option value="BW">Botswana</option>
			                                                <option value="BR">Brazil</option>
			                                                <option value="BN">Brunei Darussalam</option>
			                                                <option value="BG">Bulgaria</option>
			                                                <option value="KH">Cambodia</option>
			                                                <option value="CA">Canada</option>
			                                                <option value="CV">Cape Verde</option>
			                                                <option value="CL">Chile</option>
			                                                <option value="CN">China</option>
			                                                <option value="CR">Costa Rica</option>
			                                                <option value="HR">Croatia</option>
			                                                <option value="CU">Cuba</option>
			                                                <option value="CY">Cyprus</option>
			                                                <option value="CZ">Czech Republic</option>
			                                                <option value="DK">Denmark</option>
			                                                <option value="DJ">Djibouti</option>
			                                                <option value="DM">Dominica</option>
			                                                <option value="EC">Ecuador</option>
			                                                <option value="EG">Egypt</option>
			                                                <option value="EE">Estonia</option>
			                                                <option value="ET">Ethiopia</option>
			                                                <option value="FJ">Fiji</option>
			                                                <option value="FI">Finland</option>
			                                                <option value="FR">France</option>
			                                                <option value="GE">Georgia</option>
			                                                <option value="DE">Germany</option>
			                                                <option value="GR">Greece</option>
			                                                <option value="HK">Hong Kong</option>
			                                                <option value="HU">Hungary</option>
			                                                <option value="IN">India</option>
			                                                <option value="ID">Indonesia</option>
			                                                <option value="IR">Iran, Islamic Republic of</option>
			                                                <option value="IE">Ireland</option>
			                                                <option value="IL">Israel</option>
			                                                <option value="IT">Italy</option>
			                                                <option value="JP">Japan</option>
			                                                <option value="JO">Jordan</option>
			                                                <option value="KZ">Kazakhstan</option>
			                                                <option value="KE">Kenya</option>
			                                                <option value="KR">Korea</option>
			                                                <option value="LA">Lao People's Democratic Republic</option>
			                                                <option value="LV">Latvia</option>
			                                                <option value="LU">Luxembourg</option>
			                                                <option value="MO">Macao</option>
			                                                <option value="MK">Macedonia, the former Yugoslav Republic of</option>
			                                                <option value="MY">Malaysia</option>
			                                                <option value="MV">Maldives</option>
			                                                <option value="MU">Mauritius</option>
			                                                <option value="MX">Mexico</option>
			                                                <option value="MN">Mongolia</option>
			                                                <option value="MA">Morocco</option>
			                                                <option value="MZ">Mozambique</option>
			                                                <option value="MM">Myanmar</option>
			                                                <option value="NP">Nepal</option>
			                                                <option value="NL">Netherlands</option>
			                                                <option value="NZ">New Zealand</option>
			                                                <option value="NG">Nigeria</option>
			                                                <option value="NO">Norway</option>
			                                                <option value="OM">Oman</option>
			                                                <option value="PK">Pakistan</option>
			                                                <option value="PA">Panama</option>
			                                                <option value="PE">Peru</option>
			                                                <option value="PH">Philippines</option>
			                                                <option value="PL">Poland</option>
			                                                <option value="PT">Portugal</option>
			                                                <option value="QA">Qatar</option>
			                                                <option value="RO">Romania</option>
			                                                <option value="RU">Russian Federation</option>
			                                                <option value="RW">Rwanda</option>
			                                                <option value="SA">Saudi Arabia</option>
			                                                <option value="SG">Singapore</option>
			                                                <option value="SK">Slovakia</option>
			                                                <option value="SI">Slovenia</option>
			                                                <option value="ES">Spain</option>
			                                                <option value="LK">Sri Lanka</option>
			                                                <option value="SE">Sweden</option>
			                                                <option value="CH">Switzerland</option>
			                                                <option value="TW">Taiwan</option>
			                                                <option value="TZ">Tanzania, United Republic of</option>
			                                                <option value="TH">Thailand</option>
			                                                <option value="TN">Tunisia</option>
			                                                <option value="TR">Turkey</option>
			                                                <option value="UA">Ukraine</option>
			                                                <option value="AE">United Arab Emirates</option>
			                                                <option value="GB">United Kingdom</option>
			                                                <option value="US">United States</option>
			                                                <option value="UZ">Uzbekistan</option>
			                                                <option value="VE">Venezuela</option>
			                                                <option value="VN">Viet Nam</option>
			                                                <option value="ZM">Zambia</option>
														</select>
													</div>
												</div>
												<div class="form-group has-feedback text-center">
													<label for="inputShippingMethod" class="col-xs-3 col-sm-3">Shipping Method : </label>
													<div class="col-xs-9 col-sm-9">
														<input type="text" class="form-control" id="shippingMethod" name="shippingMethod" placeholder="Shipping Method" value="EMS" required disabled>
													</div>
												</div>
											</c:if>
											<!-- 해외인 경우 끝 -->
											<!-- =================================== -->
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
												<!-- reward 사진은 이전 페이지에서 선택 시 넘어오는 값이다. -->
												<img src="${reward.rewardImg }" alt="">
												<div class="overlay-link"></div>										
											</div>
											</c:if>
											<div class="body ph-20">
												<!-- reward name -->
												<!-- =========== -->
												<c:if test="${rewardNum != 0 }">
												<h5><strong>${reward.rewardSubject}</strong></h5>
												</c:if>
												<!-- =========== -->
												<div class="separator"></div>
												<div class="reward-detail">
													<!-- rewardAount는 단순 보여주기를 위한 방식 -->
													<!-- rewardNum과 함께 넘어오는 값임 -->
													<c:choose>
														<c:when test="${rewardNum != 0 }">
														<span class="text-left">Reward: </span> 
														<span class="text-right">$${reward.rewardAmount }</span><br>
														<span class="text-left">Shipping: </span>
														<span class="text-right">$5</span><br>
														<input type="hidden" id="shippingAmount" name="shippingAmount" value="5">
														<span class="text-left">Total:</span>
														<span class="text-right">$${reward.rewardAmount+5 }</span><br>
														<input type="hidden" id="rewardAmount" name="rewardAmount" value="${reward.rewardAmount}">
														</c:when>
														<c:otherwise>
														<span class="text-left">Reward: </span> 
														<span class="text-right">$10</span><br>
														<input type="hidden" id="rewardAmount" name="rewardAmount" value="10">
														</c:otherwise>
													</c:choose>
													
													<input type="hidden" id="totalAmount" name="totalAmount" value="${reward.rewardAmount+25}">
													<input type="hidden" id="campaignName" name="campaignName" value="${campaignName}">
													<label></label>
												</div>
											</div>
										</div>
										<div class="style-2 mb-20 ph-20 bordered text-center">
											<span class="text-left"><input type="radio" name="payment_method" value="card" checked required> Card
											</span>
											<span><input type="radio" name="payment_method" value="trans" required> Trans
											</span>
											<span class="text-right"><input type="radio" name="payment_method" value="phone" required> Phone
											</span>
										</div>
										<button type="submit" class="btn btn-lg btn-danger" style="width: 100%"><strong>Submit payment</strong></button>
									</div>
								</div>
							</form>
							<label></label>
						</div>
					</div>
				</div>
			</section>
			<label class="space-top"> </label>
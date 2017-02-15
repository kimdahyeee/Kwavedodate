<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<section class="main-container">
	<div class="container">
		<div class="row">
			<div class="main col-md-8 col-md-offset-2 text-center">
				<ul class="nav nav-pills nav-justified" role="tablist">
					<li class="active">
						<a href="#history" role="tab" data-toggle="tab" title="images">
							<h4><strong>History</strong></h4>
						</a>
					</li>
					<li>
						<a href="#yourInfo" role="tab" data-toggle="tab" title="video">
							<h4><strong>Your Info</strong></h4>
						</a>
					</li>
					<li>
						<a href="#changePassword" role="tab" data-toggle="tab" title="text">
							<h4><strong>Change Password</strong></h4>
						</a>
					</li>
				</ul>

				<div class="tab-content clear-style text-left">
					<!-- #HISTORY -->
					<div class="tab-pane active" id="history">
						<div class="table-responsive" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
							<table class="table table-colored text-center">
								<thead>
									<tr>
										<th>Pledge number</th>
										<th>Campaigns</th>
										<th>Amount</th>
										<th>Date</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<!-- ììì¦ ì¡°í íì´ì§ë¡ href -->
										<td><a href="#">imp_404382851169</a></td>
										<td>
											<div class="table-header">
												<img src="resources/images/oh-yeon-campaign.jpg">
											</div>
											<div class="table-footer">projectName/rewardName</div>
										</td>
										<td>$200</td>
										<td>2017-01-26 20:28</td>
										
									</tr>
									<tr>
										<!-- ììì¦ ì¡°í íì´ì§ë¡ href -->
										<td><a href="#">imp_274106034545</a></td>
										<td>
											<div class="table-header">
												<img src="resources/images/gong-you-campaign.jpg" alt="">
											</div>
											<div class="table-footer">projectName/rewardName</div>
										</td>
										<td>$400</td>
										<td>2017-01-10 10:30</td>
										
									</tr>
									<tr>
										<!-- ììì¦ ì¡°í íì´ì§ë¡ href -->
										<td><a href="#">imp_764558197620</a></td>
										<td>
											<div class="table-header">
												<img src="resources/images/kim-go-eun-campaign.jpg" alt="">
											</div>
											<div class="table-footer">projectName/rewardName</div>
										</td>
										<td>$300</td>
										<td>2016-12-20 14:20</td>
										
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<!-- #YOUR INFO -->
					<div class="tab-pane" id="yourInfo" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
						<h3>About You:</h3>
						<a class="text-info btn-md-link text-right" data-toggle="modal" data-target="#updateYourInfo" href="#">Edit 
							<i class="fa fa-pencil" aria-hidden="true"></i>
						</a>

						<!-- YOUR INFO MODAL CONTENTS -->
						<div class="modal fade" id="updateYourInfo" tabindex="-1" role="dialog" aria-labelledby="updateYourInfoLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">Update Your Info</h4>
									</div>

									<form class="form-horizontal" id="validateAboutYou">
										<div class="modal-body">
											<div class="form-group has-feedback">
												<div class="col-sm-12">
													<input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="Email" value='<sec:authentication property="principal.username"/>' disabled> 
														<i class="fa fa-envelope-o form-control-feedback"></i>
												</div>
											</div>
											<div class="form-group has-feedback">
												<div class="col-sm-12">
													<input type="text" class="form-control" id="userName" name="userName" placeholder="User Name" value='${user.USERNAME}' required> 
														<i class="fa fa-user form-control-feedback"></i>
												</div>
											</div>
											<div class="form-group has-feedback">
												<div class="col-sm-12">
													<input type="text" class="form-control" id="phone" name="phone" placeholder="Phone Number" value='${user.PHONE}' required> 
														<i class="fa fa-mobile form-control-feedback fa-lg"></i>
												</div>
											</div>
											<div class="form-group has-feedback last-form">
												<div class="col-sm-12">
													<select class="form-control" id="nation" name="nation"
														required>
														<option value="KOR">KOREAN</option>
														<option value="ENG" selected>ENGLISH</option>
														<option value="CHI">CHINESE</option>
													</select>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-sm btn-default">Save changes</button>
											<button type="button" class="btn btn-sm btn-dark" data-dismiss="modal">Close</button>
										</div>
									</form>
								</div>
							</div>
						</div>
						<br/><br/> 
						
						<div class="col-xs-12 col-sm-12">
							<label class="col-xs-4 col-sm-3 control-label">User Name: </label>
							<div class="col-xs-8 col-sm-9 control-label">
								<p style="display: inline;">${user.USERNAME}</p>
								<a class="text-warning btn-md-link" href="<c:url value='/logout'/>">Logout <i class="fa fa-sign-out" aria-hidden="true"></i></a><br>
							</div>
						</div>
						
						<div class="col-xs-12 col-sm-12 mt-5">
							<label class="col-xs-4  col-sm-3 control-label">Email: </label>
							<div class="col-xs-8 col-sm-9">
								<p>
									<sec:authentication property="principal.username" />
								<p>
							</div>
						</div>
						
						<div class="col-xs-12 col-sm-12 mt-5">
							<label class="col-xs-4  col-sm-3 control-label">Phone: </label>
							<div class="col-xs-8 col-sm-9">
								<!-- <p><sec:authentication property="principal.phone"/><p> -->
								<p>${user.PHONE}</p>
							</div>
						</div>
						
						<div class="col-xs-12 col-sm-12 mt-5">
							<label class="col-xs-4  col-sm-3 control-label">Nation: </label>
							<div class="col-xs-8 col-sm-9">
								<p>${user.USERNATION}</p>
							</div>
						</div>
						
						<!-- pills margin-top (width에 따라서 다르게 설정하였음)-->
						<div class="pills-space"></div>
						
						<!-- ================================================ -->
						
						<h3> Shipping Address: </h3>
								<a class="text-info btn-md-link" data-toggle="modal" data-target="#updateShippingAddress" href="#">Edit <i class="fa fa-pencil" aria-hidden="true"></i></a>
								<!-- SHIPPING ADDRESS CONTENTS -->
							<div class="modal fade" id="updateShippingAddress" tabindex="-1" role="dialog" aria-labelledby="updateShippingAddressLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">
												<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">Update Your Shipping Address</h4>
										</div>

										<form class="form-horizontal" id="validateDeliveryInfo">
											<div class="modal-body">
												<div class="form-group has-feedback">
													<div class="col-sm-12">
														<input type="text" class="form-control postcodify_address" id="address1" name="address1" placeholder="Address" value='${user.ADDRESS1}'> 
														<i class="fa fa-home form-control-feedback"></i>
													</div>
												</div>
												<div class="form-group has-feedback">
													<div class="col-sm-12">
														<input type="text" class="form-control postcodify_details" id="address2" name="address2" placeholder="Address Detail" value='${user.ADDRESS2}'>
														<i class="fa fa-paper-plane-o form-control-feedback"></i>
													</div>
												</div>
												<div class="form-group has-feedback">
													<div class="col-md-12">
														<input type="text" class="form-control postcodify_postcode5" id="zipCode" name="zipCode" placeholder="Zip Code" value='${user.ZIPCODE}'>
														<i class="fa fa-list-alt form-control-feedback"></i>
													</div>
												</div>
												<c:if test="${user.USERNATION ne 'KOR'}">
												<div class="form-group has-feedback">
													<div class="col-sm-12">
														<input type="text" class="form-control" id="city" name="city" placeholder="City" value='${user.CITY}'> 
														<i class="fa fa-tag form-control-feedback fa-lg"></i>
													</div>
												</div>
												<div class="form-group has-feedback">
													<div class="col-sm-12">
														<input type="hidden" value='${user.COUNTRY}'/>
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
												<div class="form-group has-feedback last-form">
													<div class="col-sm-12">
														<input type="text" class="form-control" id="region" name="region" placeholder="State/Region/Province" value='${user.REGION}'/> <i class="fa fa-tags form-control-feedback fa-lg"></i>
													</div>
												</div>
												</c:if>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-sm btn-default">Save changes</button>
												<button type="button" class="btn btn-sm btn-dark" data-dismiss="modal">Close</button>
											</div>
										</form>
									</div>
								</div>
							</div>
							<br/><br/> 
							<div class="col-xs-12 col-sm-12">
								<label class="col-xs-4  col-sm-3 control-label">Address: </label>
								<div class="col-xs-8 col-sm-9">
									<p>${user.ADDRESS1}<p>
								</div>
							</div>
							
							<div class="col-xs-12 col-sm-12 mt-5">
								<label class="col-xs-4  col-sm-3 control-label">Address Detail: </label>
								<div class="col-xs-8 col-sm-9">
									<p>${user.ADDRESS2}<p>
								</div>
							</div>
							
							<div class="col-xs-12 col-sm-12 mt-5">
								<label class="col-xs-4  col-sm-3 control-label">Zip code: </label>
								<div class="col-xs-8 col-sm-9">
									<p>${user.ZIPCODE}<p>
								</div>
							</div>

							<div class="col-xs-12 col-sm-12 mt-5">
								<label class="col-xs-4  col-sm-3 control-label">City: </label>
								<div class="col-xs-8 col-sm-9">
									<p>${user.CITY}<p>
								</div>
							</div>

							<div class="col-xs-12 col-sm-12 mt-5">
								<label class="col-xs-4  col-sm-3 control-label">Country: </label>
								<div class="col-xs-8 col-sm-9">
									<p>${user.COUNTRY}<p>
								</div>
							</div>
							
							<div class="col-xs-12 col-sm-12 mt-5">
								<label class="col-xs-4  col-sm-3 control-label">Region: </label>
								<div class="col-xs-8 col-sm-9">
									<p>${user.REGION}<p>
								</div>
							</div>	
						</div>

						<!-- #CHANGE PASSWORD -->
						<div class="tab-pane" id="changePassword">
						
							<!-- 일반 로그인인 경우 비밀번호 변경 가능 UI -->
							<div class="main-container">
								<div class="container">
									<div class="row">
										<div class="main object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
											<div class="form-block center-block p-30">
												<form class="form-horizontal" id="validateChangePassword">
													
													<div class="form-group has-feedback">
														<div class="col-sm-12">
															<input type="password" class="form-control" id="currentPassword" name="currentPassword" placeholder="Current Password" required> 
																<i class="fa fa-lock form-control-feedback"></i>
														</div>
													</div>
													<div class="form-group has-feedback">
														<div class="col-sm-12">
															<input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="New Password" required> 
																<i class="fa fa-lock form-control-feedback"></i>
														</div>
													</div>
													<div class="form-group has-feedback last-form">
														<div class="col-sm-12">
															<input type="password" class="form-control" id="newPasswordConfirm" name="newPasswordConfirm" placeholder="New Password Confirm" required>
																<i class="fa fa-lock form-control-feedback"></i>
														</div>
													</div>
													<div class="form-group">
														<div class="col-sm-12">
															<button type="submit" class="btn square btn-danger" style="width: 100%;">
															Change <i class="fa fa-check" aria-hidden="true"></i></button>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- SNS 로그인인 경우 비밀번호 변경 불가능 UI -->
							<div class="main-container">
								<div class="container">
									<div class="row">
										<div class="main object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
											<div class="form-block center-block p-30">
												<h1>Sorry!</h1>
												
												<form class="form-horizontal" id="validateChangePassword">
													<div class="form-group has-feedback">
														<div class="col-sm-12">
															<p>You can't change password. <br/>
															Because you log in with SNS!</p>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>

					</div>
				</div>
			</section>
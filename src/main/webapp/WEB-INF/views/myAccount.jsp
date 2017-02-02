<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

		<section class="main-container">
				<div class="container">
					<div class="row">
						<div class="main col-md-8 col-md-offset-2 text-center">
							<ul class="nav nav-pills nav-justified" role="tablist">
								<li class="active"><a href="#history" role="tab" data-toggle="tab" title="images"><h4><strong>History</strong></h4></a></li>
								<li><a href="#yourInfo" role="tab" data-toggle="tab" title="video"><h4><strong>Your Info</strong></h4></a></li>
								<li><a href="#changePassword" role="tab" data-toggle="tab" title="text"><h4><strong>Change Password</strong></h4></a></li>
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
													<th>Track Delivery</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<!-- 영수증 조회 페이지로 href -->
													<td><a href="#">imp_404382851169</a></td>
													<td>
														<div class="table-header">
															<img src="resources/images/oh-yeon-campaign.jpg">
														</div>
														<div class="table-footer">
															projectName/rewardName
														</div>
													</td>
													<td>$200</td>
													<td>2017-01-26 20:28</td>
													<td class="yet">Yet</td>
												</tr>
												<tr>
													<!-- 영수증 조회 페이지로 href -->
													<td><a href="#">imp_274106034545</a></td>
													<td>
														<div class="table-header">
															<img src="resources/images/gong-you-campaign.jpg" alt="">
														</div>
														<div class="table-footer">
															projectName/rewardName
														</div>
													</td>
													<td>$400</td>
													<td>2017-01-10 10:30</td>
													<td class="delivering">Delivering</td>
												</tr>
												<tr>
													<!-- 영수증 조회 페이지로 href -->
													<td><a href="#">imp_764558197620</a></td>
													<td>
														<div class="table-header">
															<img src="resources/images/kim-go-eun-campaign.jpg" alt="">
														</div>
														<div class="table-footer">
															projectName/rewardName
														</div>
													</td>
													<td>$300</td>
													<td>2016-12-20 14:20</td>
													<td class="complete">Complete</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>

								<!-- #YOUR INFO -->
								<div class="tab-pane" id="yourInfo" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
									<h3>About You: </h3>
									<a class="text-info btn-md-link text-right" data-toggle="modal" data-target="#updateYourInfo" href="#">Edit <i class="fa fa-pencil" aria-hidden="true"></i></a>

									<!-- YOUR INFO MODAL CONTENTS -->
									<div class="modal fade" id="updateYourInfo" tabindex="-1" role="dialog" aria-labelledby="updateYourInfoLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
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
																<input type="text" class="form-control" id="userName" name="userName" placeholder="User Name" value='${username}' required>
																<i class="fa fa-user form-control-feedback"></i>
															</div>
														</div>
														<div class="form-group has-feedback">
															<div class="col-sm-12">
																<input type="text" class="form-control" id="phone" name="phone" placeholder="Phone Number" value='${phone}' required>
																<i class="fa fa-mobile form-control-feedback fa-lg"></i>
															</div>
														</div>
														<div class="form-group has-feedback last-form">
															<div class="col-sm-12">
																<select class="form-control" id="nation" name="nation" required> 
																	<option value="KOR">KOREAN</option>
																	<option value="ENG" selected>ENGLISH</option>
																	<!-- <option value="CHI">CHINESE</option> -->
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

									<label class="col-sm-3 control-label">User Name: </label>
									<div class="col-sm-9">
										<p>${username}</p>
									</div>

									<label class="col-sm-3 control-label">Email: </label>
									<div class="col-sm-9">
										<p><sec:authentication property="principal.username"/><p>
									</div>

									<label class="col-sm-3 control-label">Phone: </label>
									<div class="col-sm-9">
										<!-- <p><sec:authentication property="principal.phone"/><p> -->
										<p>${phone}</p>
									</div>

									<label class="col-sm-3 control-label">Nation: </label>
									<div class="col-sm-9">
										<p>${usernation} <p>
									</div>

									<!-- pills margin-top (width에 따라서 다르게 설정하였음)-->
									<div class="pills-space"></div>
									<!-- ================================================ -->

									<h3>Shipping Address: </h3>
									<a class="text-info btn-md-link" data-toggle="modal" data-target="#updateShippingAddress" href="#">Edit <i class="fa fa-pencil" aria-hidden="true"></i></a>
									<!-- SHIPPING ADDRESS CONTENTS -->
									<div class="modal fade" id="updateShippingAddress" tabindex="-1" role="dialog" aria-labelledby="updateShippingAddressLabel" aria-hidden="true" action="#">
										<div class="modal-dialog">
											<div class="modal-content">
												
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
													<h4 class="modal-title" id="myModalLabel">Update Your Shipping Address</h4>
												</div>
													
												<form class="form-horizontal" id="validateDeliveryInfo">
													<div class="modal-body">
														<div class="form-group has-feedback">
															<div class="col-sm-12">
																<input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="Email" value='${username}' disabled>
																<i class="fa fa-envelope-o form-control-feedback"></i>
															</div>
														</div>
														<div class="form-group has-feedback">
															<div class="col-sm-12">
																<input type="text" class="form-control postcodify_address" id="address1" name="address1" placeholder="Address" value='${address1}'>
																<i class="fa fa-home form-control-feedback"></i>
															</div>
														</div>
														<div class="form-group has-feedback">
															<div class="col-sm-12">
																<input type="text" class="form-control postcodify_details" id="address2" name="address2" placeholder="Address Detail" value='${address2}'>
																<i class="fa fa-paper-plane-o form-control-feedback"></i>
															</div>
														</div>
														<div class="form-group has-feedback">
															
															<div class="col-md-12">
																<input type="text" class="form-control postcodify_postcode5" id="zipCode" name="zipCode" placeholder="Zip Code" value='${zipcode}'>
																<i class="fa fa-list-alt form-control-feedback"></i>
															</div>
															
														</div>
														<div class="form-group has-feedback">
															<div class="col-sm-12">
																<input type="text" class="form-control" id="city" name="city" placeholder="City" value='${city}'>
																<i class="fa fa-tag form-control-feedback fa-lg"></i>
															</div>
														</div>
														<div class="form-group has-feedback">
															<div class="col-sm-12">
																<input type="text" class="form-control" id="country" name="country" placeholder="Country" value='${country}'>
																<i class="fa fa-tag form-control-feedback fa-lg"></i>
															</div>
														</div>
														<div class="form-group has-feedback last-form">
															<div class="col-sm-12">
																<input type="text" class="form-control" id="region" name="region" placeholder="State/Region/Province" value='${region}'>
																<i class="fa fa-tags form-control-feedback fa-lg"></i>
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

									<label class="col-sm-3 control-label">Address: </label>
									<div class="col-sm-9">
										<p>${address1}<p>
									</div>

									<label class="col-sm-3 control-label">Address Detail: </label>
									<div class="col-sm-9">
										<p>${address2}<p>
									</div>

									<label class="col-sm-3 control-label">Zip code: </label>
									<div class="col-sm-9">
										<p>${zipcode}<p>
									</div>

									<!-- 여기서부터는 해외인 경우에만 적용 -->
									<label class="col-sm-3 control-label">City: </label>
									<div class="col-sm-9">
										<p>${city}<p>
									</div>
									<label class="col-sm-3 control-label">Country: </label>
									<div class="col-sm-9">
										<p>${country}<p>
									</div>
									<label class="col-sm-3 control-label">Region: </label>
									<div class="col-sm-9">
										<p>${region}<p>
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
																	<button type="submit" class="btn square btn-danger" style="width: 100%;">Change <i class="fa fa-check" aria-hidden="true"></i></button>
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
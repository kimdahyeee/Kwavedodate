
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<section class="main-container">
	<div class="container">
		<div class="row">
			<div class="main col-md-8 col-md-offset-2 text-center">
				<ul class="nav nav-pills nav-justified" role="tablist">
					<li class="active">
						<a href="#history" role="tab" data-toggle="tab" title="images">
							<strong><spring:message code="history"/></strong>
						</a>
					</li>
					<li>
						<a href="#yourInfo" role="tab" data-toggle="tab" title="video">
							<strong><spring:message code="yourInfo"/></strong>
						</a>
					</li>
					<li>
						<a href="#changePassword" role="tab" data-toggle="tab" title="text">
							<strong><spring:message code="changePassword_info"/></strong>
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
										<th><spring:message code="pledgeNumber"/></th>
										<th><spring:message code="campaigns"/></th>
										<th><spring:message code="amount"/></th>
										<th><spring:message code="date"/></th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${fn:length(historyList) > 0}">
										<c:forEach items="${historyList}" var="historyLists" begin="0" end="${fn:length(historyList)}" step="1" varStatus="status">
											<tr>
												<td>
													<c:choose>
				                           				<c:when test="${not empty historyList[status.index].PRECEIPT_URL}"><a href="${completePaymentInfo.receipt_url}" onclick="window.open(this.href, 'popup', 'popup');return false;" target="_blank"><strong>${historyList[status.index].PIMP_UID}</strong></a></c:when>
						                           		<c:otherwise><strong>${historyList[status.index].PIMP_UID}</strong></c:otherwise>
						                           	</c:choose>
												</td>
												<td>
													<div class="table-header">
														<img src="${historyList[status.index].CCAMPAIGNIMG}">
													</div>
													<div class="table-footer">${historyList[status.index].CCAMPAIGNSUBJECT}
														<c:if test="${not empty historyList[status.index].RREWARDSUBJECT}"><br/>${historyList[status.index].RREWARDSUBJECT}</c:if>
													</div>
												</td>
												<td>$${historyList[status.index].PTOTALAMOUNT }</td>
												<td>${historyList[status.index].PPAID_AT}</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
							<c:if test="${fn:length(historyList) eq 0}">
								<div class="space-top"></div>
							</c:if>
						</div>
					</div>
					
					<!-- ====== -->

					<!-- #YOUR INFO -->
					<!-- ====== -->
					<div class="tab-pane" id="yourInfo" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
						<h3><spring:message code="aboutYou"/>:</h3>
						<a class="text-info btn-md-link text-right" data-toggle="modal" data-target="#updateYourInfo" href="#"><spring:message code="edit"/> 
							<i class="fa fa-pencil" aria-hidden="true"></i>
						</a>
	
						<!-- YOUR INFO MODAL CONTENTS -->
						<div class="modal fade" id="updateYourInfo" tabindex="-1" role="dialog" aria-labelledby="updateYourInfoLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span><span class="sr-only"><spring:message code="close"/></span>
										</button>
										<h4 class="modal-title" id="myModalLabel"><spring:message code="updateYourInfo"/></h4>
									</div>

									<form class="form-horizontal" id="validateAboutYou">
										<div class="modal-body">
											<div class="form-group has-feedback">
												<div class="col-sm-12">
													<input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="<spring:message code="email"/>" value="<sec:authentication property="principal.username"/>" disabled> 
														<i class="fa fa-envelope-o form-control-feedback"></i>
												</div>
											</div>
											<div class="form-group has-feedback">
												<div class="col-sm-12">
													<input type="text" class="form-control" id="userName" name="userName" placeholder="<spring:message code="userName"/>" value="${user.USERNAME}" required>  
														<i class="fa fa-user form-control-feedback"></i>
												</div>
											</div>
											<div class="form-group has-feedback">
												<div class="col-sm-12">
													<input type="text" class="form-control" id="phone" name="phone" placeholder="<spring:message code="phoneNumber"/>" value="${user.PHONE}"> 
														<i class="fa fa-mobile form-control-feedback fa-lg"></i>
												</div>
											</div>
											<div class="form-group has-feedback last-form">
												<div class="col-sm-12">
													<input type="hidden" id="nation_hidden" value="${user.USERNATION }"/>
													<select class="form-control" id="nation" name="nation" required>
														<option value="KOR"><spring:message code="korean"/></option>
														<option value="ENG"><spring:message code="english"/></option>
														<option value="CHI"><spring:message code="chinese"/></option>
													</select>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-sm btn-default"><spring:message code="saveChanges"/></button>
											<button type="button" class="btn btn-sm btn-dark" data-dismiss="modal"><spring:message code="close"/></button>
										</div>
									</form>
								</div>
							</div>
						</div>
							<br/><br/> 
							
						<div class="col-xs-12 col-sm-12">
							<label class="col-xs-4 col-sm-3 control-label"><spring:message code="userName"/>: </label>
							<div class="col-xs-8 col-sm-9 control-label">
								<p style="display: inline;">${user.USERNAME}</p>
								<a class="text-warning btn-md-link" href="<c:url value='/logout'/>">Logout <i class="fa fa-sign-out" aria-hidden="true"></i></a><br>
							</div>
						</div>
						
						<div class="col-xs-12 col-sm-12 mt-5">
							<label class="col-xs-4  col-sm-3 control-label"><spring:message code="email"/>: </label>
							<div class="col-xs-8 col-sm-9">
								<p>
									<sec:authentication property="principal.username" />
								<p>
							</div>
						</div>
							
						<div class="col-xs-12 col-sm-12 mt-5">
							<label class="col-xs-4  col-sm-3 control-label"><spring:message code="phone"/>: </label>
							<div class="col-xs-8 col-sm-9">
								<!-- <p><sec:authentication property="principal.phone"/><p> -->
								<p>${user.PHONE}</p>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 mt-5">
							<label class="col-xs-4  col-sm-3 control-label"><spring:message code="nation(Language)"/>: </label>
							<div class="col-xs-8 col-sm-9">
								<p><c:choose>
									<c:when test="${user.USERNATION =='KOR'}"><spring:message code="korean"/></c:when>
									<c:when test="${user.USERNATION =='ENG'}"><spring:message code="english"/></c:when>
									<c:otherwise><spring:message code="chinese"/></c:otherwise>
								</c:choose></p>
							</div>
						</div>				
						
						<div class="pills-space"></div>
						
						<h3><spring:message code="shippingAddress"/>: </h3>
						<a class="text-info btn-md-link" data-toggle="modal" data-target="#updateShippingAddress" href="#"><spring:message code="edit"/> <i class="fa fa-pencil" aria-hidden="true"></i></a>
						<div class="modal fade" id="updateShippingAddress" tabindex="-1" role="dialog" aria-labelledby="updateShippingAddressLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span><span class="sr-only"><spring:message code="close"/></span>
										</button>
										<h4 class="modal-title" id="myModalLabel"><spring:message code="updateYourShippingAddress"/></h4>
									</div>

									<form class="form-horizontal" id="validateDeliveryInfo">
										<div class="modal-body">
											<div class="form-group has-feedback">
												<div class="col-sm-12">
													<input type="hidden" id="country_hidden" value='${user.COUNTRY}'/>
													<select class="form-control" id="country" name="country"> 
														<option value="">==== <spring:message code="choose"/> ====l</option>	
		                                                <option value="Brazil">Brazil</option>	
		                                                <option value="China"><spring:message code="china"/></option>
		                                                <option value="HongKong">Hong Kong</option>
		                                                <option value="Japan"><spring:message code="japan"/></option>
		                                                <option value="Korea"><spring:message code="korea"/></option>
		                                                <option value="United States"><spring:message code="unitedStates"/></option>
													</select>
												</div>
											</div>
											<div class="form-group has-feedback">
												<div class="col-md-12">
													<input type="text" class="form-control postcodify_postcode5" id="zipCode" name="zipCode" placeholder="<spring:message code="zipCode"/>" value='${user.ZIPCODE}'>
													<i class="fa fa-list-alt form-control-feedback"></i>
												</div>
											</div>
											<div class="form-group has-feedback">
												<div class="col-sm-12">
													<input type="text" class="form-control postcodify_address" id="address1" name="address1" placeholder="<spring:message code="address"/>" value='${user.ADDRESS1}'> 
													<i class="fa fa-home form-control-feedback"></i>
												</div>
											</div>
											<div class="form-group has-feedback">
												<div class="col-sm-12">
													<input type="text" class="form-control postcodify_details" id="address2" name="address2" placeholder="<spring:message code="addressDetail"/>" value='${user.ADDRESS2}'>
													<i class="fa fa-paper-plane-o form-control-feedback"></i>
												</div>
											</div>
											<div class="appendInputArea"></div>
											
											<c:choose>
												<c:when test="${user.COUNTRY ne 'KR'}">
													<div class="form-group has-feedback cityArea">
														<div class="col-sm-12">
															<input type="text" class="form-control" id="city" name="city" placeholder="<spring:message code="city"/>" value='${user.CITY}'> 
															<i class="fa fa-tag form-control-feedback fa-lg"></i>
														</div>
													</div>
													<div class="form-group has-feedback last-form regionArea">
														<div class="col-sm-12">
															<input type="text" class="form-control" id="region" name="region" placeholder="<spring:message code="state"/>" value='${user.REGION}'/> 
															<i class="fa fa-tags form-control-feedback fa-lg"></i>
														</div>
													</div>
												</c:when>
												<c:otherwise>
													<div class="cityRegionArea">
														<input type="hidden" id="city" name="city" value=""> 
														<input type="hidden" id="region" name="region" value=""/>
													</div>
												</c:otherwise>
											</c:choose>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-sm btn-default"><spring:message code="saveChanges"/></button>
											<button type="button" class="btn btn-sm btn-dark" data-dismiss="modal"><spring:message code="close"/></button>
										</div>
									</form>
								</div>
							</div>
						</div>
						<br/><br/> 
						<div class="col-xs-12 col-sm-12 mt-5">
							<label class="col-xs-4  col-sm-3 control-label"><spring:message code="country"/>: </label>
							<div class="col-xs-8 col-sm-9">
								<p>${user.COUNTRY}<p>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 mt-5">
							<label class="col-xs-4  col-sm-3 control-label"><spring:message code="zipCode"/>: </label>
							<div class="col-xs-8 col-sm-9">
								<p>${user.ZIPCODE}<p>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 mt-5">
							<label class="col-xs-4  col-sm-3 control-label"><spring:message code="address"/>: </label>
							<div class="col-xs-8 col-sm-9">
								<p>${user.ADDRESS1}<p>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 mt-5">
							<label class="col-xs-4  col-sm-3 control-label"><spring:message code="addressDetail"/>: </label>
							<div class="col-xs-8 col-sm-9">
								<p>${user.ADDRESS2}<p>
							</div>
						</div>
						<div class="appendArea"></div>
						
						<c:if test="${user.COUNTRY ne 'KR'}">
							<div class="col-xs-12 col-sm-12 mt-5">
								<label class="col-xs-4  col-sm-3 control-label"><spring:message code="city"/>: </label>
								<div class="col-xs-8 col-sm-9">
									<p>${user.CITY}<p>
								</div>
							</div>							
							<div class="col-xs-12 col-sm-12 mt-5">
								<label class="col-xs-4  col-sm-3 control-label"><spring:message code="region"/>: </label>
								<div class="col-xs-8 col-sm-9">
									<p>${user.REGION}<p>
								</div>
							</div>
						</c:if>	
					</div>
					<!-- #YOUR INFO END-->
					<!-- =========== -->
							
					<!-- #CHANGE PASSWORD -->
					<!-- ============== -->
					<div class="tab-pane" id="changePassword">
						<!-- ì¼ë° ë¡ê·¸ì¸ì¸ ê²½ì° ë¹ë°ë²í¸ ë³ê²½ ê°ë¥ UI -->
						<c:choose>
							<c:when test="${user.ISSNS != 1}">
								<div class="main-container">
									<div class="container">
										<div class="row">
											<div class="main object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
												<div class="form-block center-block p-30">
													<form class="form-horizontal" id="validateChangePassword">
														
														<div class="form-group has-feedback">
															<div class="col-sm-12">
																<input type="password" class="form-control" id="currentPassword" name="currentPassword" placeholder="<spring:message code="currentPassword"/>" required> 
																	<i class="fa fa-lock form-control-feedback"></i>
															</div>
														</div>
														<div class="form-group has-feedback">
															<div class="col-sm-12">
																<input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="<spring:message code="newPassword"/>" required> 
																	<i class="fa fa-lock form-control-feedback"></i>
															</div>
														</div>
														<div class="form-group has-feedback last-form">
															<div class="col-sm-12">
																<input type="password" class="form-control" id="newPasswordConfirm" name="newPasswordConfirm" placeholder="<spring:message code="newPasswordConfirm"/>" required>
																	<i class="fa fa-lock form-control-feedback"></i>
															</div>
														</div>
														<div class="form-group">
															<div class="col-sm-12">
																<button type="submit" class="btn square btn-danger" style="width: 100%;">
																<spring:message code="change"/> <i class="fa fa-check" aria-hidden="true"></i></button>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="main-container">
									<div class="container">
										<div class="row">
											<div class="main object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
												<div class="form-block center-block p-30">
													<h1><spring:message code="sorry"/></h1>
													
													<form class="form-horizontal" id="validateChangePassword">
														<div class="form-group has-feedback">
															<div class="col-sm-12">
																<p><spring:message code="changePasswordText1"/><br/>
																<spring:message code="changePasswordText1"/></p>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
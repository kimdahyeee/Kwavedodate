			<div class="main-container">
				<div class="container">
					<div class="row">
						<div class="main object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
							<div class="form-block center-block p-30">
								<h2 class="title text-center"><strong>Sign In</strong></h2>
								<form class="form-horizontal" id="validateSignIn">
									<div class="form-group has-feedback">
										<div class="col-sm-12">
											<input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="Email" required>
											<i class="fa fa-envelope-o form-control-feedback"></i>
										</div>
									</div>
									<div class="form-group has-feedback">
										<div class="col-sm-12">
											<input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="Password" required>
											<i class="fa fa-lock form-control-feedback"></i>

										</div>
									</div>
									<div class="form-group has-feedback">
										<div class="col-sm-12">
											<input type="password" class="form-control" id="userPasswordConfirm" name="userPasswordConfirm" placeholder="Password Confirm" required>
											<i class="fa fa-lock form-control-feedback"></i>
										</div>
									</div>
									<div class="form-group has-feedback">
										<div class="col-sm-12">
											<input type="text" class="form-control" id="userName" name="userName" placeholder="User name" required>
											<i class="fa fa-user form-control-feedback"></i>

										</div>
									</div>
									<div class="checkbox">
										<label>
											<input type="checkbox" id="signInAgreement" name="signInAgreement" required>Agreement <a href="<c:url value='/privacyPolicy' />">privacy policy</a> and <a href="<c:url value='/termsOfUse' />">term of use</a>
										</label>
									</div>	
									<input type="hidden" id="location" value="${location}">
									<div class="form-group">
										<div class="col-sm-12">							
											<button type="submit" class="btn square btn-danger" style="width: 100%;">Sign In <i class="fa fa-user"></i></button>
										</div>
									</div>
								</form>
								
							</div>
						</div>

					</div>
				</div>
			</div>
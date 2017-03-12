		<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
		<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<style type="text/css" >
		.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
		    position: fixed;
		    left:0;
		    right:0;
		    top:0;
		    bottom:0;
		    background: rgba(0,0,0,0.2); /*not in ie */
		    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
		    
		}
		    .wrap-loading div{ /*로딩 이미지*/
		        position: fixed;
		        top:50%;
		        left:50%;
		        margin-left: -21px;
		        margin-top: -21px;
		    }
		    .display-none{ /*감추기*/
		        display:none;
		    }
		</style>
 
			<div class="wrap-loading display-none">
			    <div><img src="resources/images/mission_continues-01.jpg" /></div>
			</div>

			<div class="main-container">
				<div class="container">
					<div class="row">
						<div class="main object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
							<div class="form-block center-block p-30">
								<h2 class="title text-center"><strong><spring:message code="forgotPassword"/></strong></h2>
								<form class="form-horizontal" id="validateFindPasswordSend">
									<div class="form-group has-feedback">
										<div class="col-sm-12">
											<input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="Email" required>
											<i class="fa fa-envelope-o form-control-feedback"></i>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-12">							
											<button type="submit" class="btn square btn-danger" style="width: 100%;"><spring:message code="sendLink"/> <i class="fa fa-user"></i></button>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-12">							
											<span ><spring:message code="findPasswordText1"/></span>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
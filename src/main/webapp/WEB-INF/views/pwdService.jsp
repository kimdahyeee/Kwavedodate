<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="true" %>
         
         <div class="main-container">
            <div class="container">
               <div class="row">
                  <div class="main object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
                     <div class="form-block center-block p-30">
                        <h2 class="title text-center"><strong><spring:message code="password"/><spring:message code="change"/></strong></h2>
                        <form class="form-horizontal" id="validateFindPassword">
                        	<input type="hidden" class="form-control" id="userEmail" name="userEmail" value="${ue}">
                        	
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
                                 <button type="submit" class="btn square btn-danger" style="width: 100%;"><spring:message code="change"/><i class="fa fa-check" aria-hidden="true"></i></button>
                              </div>
                           </div>
                           <%session.invalidate(); %>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


      <div class="main-container">
            <div class="container">
               <div class="row">
                  <div class="main object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
                     <div class="form-block center-block p-30">
                        <h2 class="title text-center"><strong><spring:message code="helloThere"/></strong></h2>
                        <form class="form-horizontal" id="validateLogin" method="post">
                           <div class="form-group has-feedback">
                              <div class="col-sm-12">
                                 <input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="Email" required>
                                 <i class="fa fa-envelope-o form-control-feedback"></i>
                              </div>
                           </div>
                           <div class="form-group has-feedback last-form">
                              <div class="col-sm-12">
                                 <input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="Password" required>
                                 <i class="fa fa-lock form-control-feedback"></i>
                              </div>
                           </div>
                           <div class="checkbox">
                              <label>
                                 <input type="checkbox" id="remember_me" name="remember_me" checked/><spring:message code="rememberMe"/>
                              </label>
                           </div>   
                           <div class="form-group">
                              <div class="col-sm-12">                     
                                 <button type="submit" class="btn square btn-danger" style="width: 100%;"><spring:message code="login"/><i class="fa fa-user"></i></button>
                                 <a class="btn square btn-gray-transparent col-md-6 col-xs-6 col-lg-6" href="signin"><spring:message code="signIn"/></a>
                                 
                                 <a class="btn square btn-gray-transparent col-md-6 col-xs-6 col-lg-6" href="findPassword"><spring:message code="findPassword"/></a>
                              </div>
                           </div>

                           <div class="separator"></div>

                           <div class="form-group">
                              <div class="col-sm-12">                     
                                 <a id="facebookLoginBtn" class="btn square btn-primary" style="width: 100%;">
                                    <i class="fa fa-facebook"></i><spring:message code="facebookLogin"/>
                                 </a>
                              </div>
                           </div>
                           <input type="hidden" id="loginRedirect" name="loginRedirect" value="${loginRedirect}"/>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
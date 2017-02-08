<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
//로그인 validation
if($("#validateLogin").length>0) {
    $("#validateLogin").validate({
        submitHandler: function(form) {   
            // 데이터 베이스에 저장 ajax 사용
            $.ajax({
                
            	type: "POST",
                url: '<c:url value="j_spring_security_check"/>',
                data: {
                    "userEmail": $("#userEmail").val(),
                    "userPassword": $("#userPassword").val()
                },
                dataType: "json",
                success: function(data) {
                    //성공 시 데이터 처리 
                	 if(data.success == false){
                         alert("아이디와 비밀번호를 확인해주세요.");
                         window.location = "http://localhost:8181/kwaveweb/login";
                      }else{
                         //alert("이미 회원가입 된 이메일입니다.");
                         //window.location = "http://localhost:8181/kwaveweb/signin";
                      }
                }
            });
        },
        errorPlacement: function(error, element) {
            error.appendTo(element.parent());  
        },
        onkeyup: false,
        onclick: false,
        rules: {
            userEmail: {
                required: true,
                email: true
            },
            userPassword: {
                required: true,
                minlength: 6
            }
        },
        messages: {
            userEmail: {
                required: "Please enter your email address.",
                email: "Please enter a valid email address."
            },
            userPassword: {
                required: "Please enter your password.",
                minlength: "Your password must be at least 6 charaters long."
            }
        },
        errorElement: "span",
        highlight: function (element) {
            $(element).parent().removeClass("has-success").addClass("has-error");
            $(element).siblings("label").addClass("hide");
        },
        success: function (element) {
            $(element).parent().removeClass("has-error").addClass("has-success");
            $(element).siblings("label").removeClass("hide");
        }
    });
}
</script>


<div class="main-container">
				<div class="container">
					<div class="row">
						<div class="main object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
							<div class="form-block center-block p-30">
								<h2 class="title text-center"><strong>Hello There</strong></h2>
								<form class="form-horizontal" id="validateLogin" action="./j_spring_security_check" method="post">
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
											<input id="remember_me" name="_spring_security_remember_me" type="checkbox"/>Remember me.
										</label>
									</div>	
									<div class="form-group">
										<div class="col-sm-12">							
											<button type="submit" class="btn square btn-danger" style="width: 100%;">Log In <i class="fa fa-user"></i></button>
											<a class="btn square btn-gray-transparent" href="signin" style="width: 49%;">Sign In</a>
											<a class="btn square btn-gray-transparent" href="findPassword" style="width: 50%;">Find password</a>
										</div>
									</div>

									<div class="separator"></div>

									<div class="form-group">
										<div class="col-sm-12">							
											<a id="facebookLoginBtn" class="btn square btn-primary" href="/kwaveweb/facebookLogin" style="width: 100%;">
												<i class="fa fa-facebook"></i> facebook login
											</a>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
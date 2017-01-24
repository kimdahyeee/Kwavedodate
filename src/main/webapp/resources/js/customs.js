/* Theme Name: KWAVE D Web Service
 * Author: Choi Hong Hee(Adler)
 * Author URI: http://kwavedonate.com
 * Author e-mail: vvshinevv@naver.com
 * Created: Jan 2017
 * File Description: Custom scripts
 */
$(document).ready(function() {
	/* swiper customize */
    var swiper = new Swiper('.swiper-container', {
    	initialSlide: 2,
        pagination: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        slidesPerView: 1,
        centeredSlides: true,
        paginationClickable: true,
        spaceBetween: 10,
        breakpoints: {
        	320: {
        		slidesPerView: 1, 
        		spaceBetween: 10
        	},
        	480: {
        		slidesPerView: 1,
        		spaceBetween: 10
        	},
        	640: {
        		slidesPerView: 1,
        		spaceBetween: 10
        	},
        	767: {
        		slidesPerView: 1,
        		spaceBetween: 10
        	},
        	991: {
        		slidesPerView: 1,
        		spaceBetween: 10
        	},
        	1199: {
        		slidesPerView: 1,
        		spaceBetween: 10
        	},
            1280: {
                slidesPerView: 2,
                spaceBetween: 20
            },

        	1320: {
        		slidesPerView: 2,
        		spaceBetween: 20
        	},
        	1640: {
				slidesPerView: 2,
        		spaceBetween: 20
        	},
        	2000: {
        		slidesPerView: 3,
        		spaceBetween: 30
        	},
        	3000: {
				slidesPerView: 3,
        		spaceBetween: 30
        	},
        	4000: {
				slidesPerView: 3,
        		spaceBetween: 30
        	},
        	6000: {
        		slidesPerView: 5,
        		spaceBetween: 30
        	}
        }
    });

    /* Contact form validation customize*/

    // 회원가입 validation
    if($("#validateSignIn").length>0) {
        $("#validateSignIn").validate({
            submitHandler: function(form) {   
                // 데이터 베이스에 저장 ajax 사용
                $.ajax({
                    type: "POST",
                    url: "/",
                    data: {
                        "userEmail": $("#userEmail").val(),
                        "userPassword": $("#userPassword").val(),
                        "userName": $("#userName").val()
                    },
                    dataType: "json",
                    success: function(data) {
                        //성공 시 데이터 처리 
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
                },
                userPasswordConfirm: {
                    required: true,
                    minlength: 6,
                    equalTo: "#userPassword"
                },
                userName: { 
                    required: true,
                    minlength: 1
                },
                signInAgreement: {
                    required: true
                }
            },
            messages: {
                userEmail: {
                    required: "We need your email address to contact you.",
                    email: "Please enter a valid email address."
                },
                userPassword: {
                    required: "Please enter a password.",
                    minlength: "Your password must be at least 6 charaters long."
                },
                userPasswordConfirm: {
                    required: "Please confirm the password.",
                    minlength: "Your password must be at least 6 charaters long.",
                    equalTo: "Please enter the same password as above."
                },
                userName: {
                    required: "Please enter your name.",
                    minlength: "Your name must be at least 1 charaters long."
                },
                signInAgreement: {
                    required: "Please accept our policy."
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

    // 로그인 validation
    if($("#validateLogin").length>0) {
        $("#validateLogin").validate({
            submitHandler: function(form) {   
                // 데이터 베이스에 저장 ajax 사용
                $.ajax({
                    type: "POST",
                    url: "/",
                    data: {
                        "userEmail": $("#userEmail").val(),
                        "userPassword": $("#userPassword").val()
                    },
                    dataType: "json",
                    success: function(data) {
                        //성공 시 데이터 처리 
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

    // 비밀번호 찾기 validation
    if($("#validateFindPassword").length>0) {
        $("#validateFindPassword").validate({
            submitHandler: function(form) {   
                // 데이터 베이스에 저장 ajax 사용
                $.ajax({
                    type: "POST",
                    url: "/",
                    data: {
                        "userEmail": $("#userEmail").val()
                    },
                    dataType: "json",
                    success: function(data) {
                        //성공 시 데이터 처리 
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
                }
            },
            messages: {
                userEmail: {
                    required: "Please enter your email address.",
                    email: "Please enter a valid email address."
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
});

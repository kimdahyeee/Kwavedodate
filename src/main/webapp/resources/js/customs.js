/* Theme Name: KWAVE D Web Service
 * Author: Choi Hong Hee(Adler)
 * Author URI: http://kwavedonate.com
 * Author e-mail: vvshinevv@naver.com
 * Created: Jan 2017
 * File Description: Custom scripts
 */

/*
 * youtube video
 */
if(jQuery("#player").length > 0){
	var tag = document.createElement('script');
	
	tag.src = "https://www.youtube.com/iframe_api";
	var firstScriptTag = document.getElementsByTagName('script')[0];
	firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
	
	// 3. This function creates an <iframe> (and YouTube player)
	//    after the API code downloads.
	var player;
	function onYouTubeIframeAPIReady() {
	  player = new YT.Player('player', {
	    height: '315px',
	    width: '560px',
	    videoId: document.getElementById('youtube_code').value,
	    rel:0,
	    events: {
	    	'onReady': onPlayerReady,
	    	'onStateChange': onPlayerStateChange
	    }
	  });
	}
	
	// 5. The API calls this function when the player's state changes.
	//    The function indicates that when playing a video (state=1),
	//    the player should play for six seconds and then stop.
	   
	    function onPlayerStateChange(event) {
	      if (event.data == YT.PlayerState.ENDED) {
	    	  $('.embed-container').hide();
	      $('#play_vid').show();
	      $('#play_img').show();
	      $('.campaign-badge').show();
	  }
	}
	
	function onPlayerReady(event) {
	    $('#play_vid').click(function() {
	        event.target.playVideo();
	    });
	}
	
	function stopVideo() {
	  player.stopVideo();
	}
	
	$(document).ready(function() {
	    $('#play_vid').click(function() {
	        $('.embed-container').show();
	        $('#play_vid').hide();
	        $('#play_img').hide();
	        $('.campaign-badge').hide();
	    });
	});
}

$(document).ready(function() {


    /* banner custom */
    if($(".campaigns-banner").length>0) {
        if (Modernizr.touch) {
            $(".campaigns-banner").vide({
                poster: "resources/images/campaigns_banner.jpg"
            }, {
                position: "50% 50%", 
                posterType: "jpg", 
                resizing: true
            });
        } else {
            $(".campaigns-banner").vide({
                poster: "resources/images/campaigns_banner.jpg"
            }, {
                position: "50% 50%",
                posterType: "jpg", 
                resizing: true
            });
        };
    };


    if($(".aboutUs-banner").length>0) {
        if (Modernizr.touch) {
            $(".aboutUs-banner").vide({
                poster: "resources/images/aboutUs_banner.jpg"
            }, {
                position: "50% 50%", 
                posterType: "jpg", 
                resizing: true
            });
        } else {
            $(".aboutUs-banner").vide({
                poster: "resources/images/aboutUs_banner.jpg"
            }, {
                position: "50% 50%", 
                posterType: "jpg", 
                resizing: true
            });
        };
    };


    /* fixed aside custom */
    if($("aside.campaignEnterNow-web").length>0) {
        $("aside.campaignEnterNow-web").scrollToFixed({  
            
            marginTop: $('header').outerHeight(true) + 10,
            limit: function() {
                return $('.campaign-perks').offset().top - $(this).outerHeight(true);
            },
            zIndex: 999
        });
    }

    if($("div.campaignEnterNow-mobile").length>0) {
        $("div.campaignEnterNow-mobile-fixed").scrollToFixed({
            bottom: 0,
            limit: function() {
                return $('.campaign-perks').offset().top;
            },
            zIndex: 999
        });
    }
        

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
                    url: "/kwaveweb/insertUser", 
                    data: {
                        "userEmail": $("#userEmail").val(),
                        "userPassword": $("#userPassword").val(),
                        "userName": $("#userName").val()
                    },
                    dataType: "json",
                    success: function(data) {
                       if(data.KEY == "SUCCESS"){
                          alert("회원가입을 축하드립니다");
                          window.location = "http://localhost:8181/kwaveweb/login";
                       }else{
                          alert("이미 회원가입 된 이메일입니다.");
                          window.location = "http://localhost:8181/kwaveweb/signin";
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

    /*// 로그인 validation
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
                    	 location.href="/"
                        
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
    }*/

    // 비밀번호 찾기 validation
    if($("#validateFindPasswordSend").length>0) {
        $("#validateFindPasswordSend").validate({
            submitHandler: function(form) {   
                // 데이터 베이스에 저장 ajax 사용
                $.ajax({
                    type: "POST",
                    url: "/kwaveweb/sendLink",
                    data: {
                        "userEmail": $("#userEmail").val()
                    },
                    dataType: "json",
                    success: function(data) {
                    	if(data.KEY == "SUCCESS"){
                            alert("메일이 전송되었습니다.");
                            window.location = "http://localhost:8181/kwaveweb/";
                         }else{
                            alert("메일을 확인해주세요.");
                            window.location = "http://localhost:8181/kwaveweb/";
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

    // 비밀번호 변경 validation
    if($("#validateChangePassword").length>0) {
        $("#validateChangePassword").validate({
            submitHandler: function(form) {   
                // 데이터 베이스에 저장 ajax 사용
                $.ajax({
                    type: "POST",
                    url: "/kwaveweb/modifyPassword",
                    data: {
                        "currentPassword": $("#currentPassword").val(),
                        "newPassword": $("#newPassword").val()
                    },
                    dataType: "json",
                    success: function(data) {
                        //성공 시 데이터 처리 
                    	if(data.KEY == "SUCCESS"){
                            alert("비밀번호가 변경되었습니다.");
                            window.location = "http://localhost:8181/kwaveweb/myAccount";
                         }else{
                            alert("비밀번호를 확인해주세요.");
                            window.location = "http://localhost:8181/kwaveweb/myAccount";
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
                currentPassword: {
                    required: true,
                    minlength: 6
                },
                newPassword: {
                    required: true,
                    minlength: 6
                },
                newPasswordConfirm: {
                    required: true,
                    minlength: 6,
                    equalTo: "#newPassword"
                }
            },
            messages: {
                currentPassword: {
                    required: "Please enter a older password.",
                    minlength: "Your password must be at least 6 charaters long."
                },
                newPassword: {
                    required: "Please enter a new password.",
                    minlength: "Your password must be at least 6 charaters long."
                },
                newPasswordConfirm: {
                    required: "Please confirm the password.",
                    minlength: "Your password must be at least 6 charaters long.",
                    equalTo: "Please enter the same password as above."
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

    // 개인 정보 변경 validation
    if($("#validateAboutYou").length>0) {
        $("#validateAboutYou").validate({
            submitHandler: function(form) {   
                // 데이터 베이스에 저장 ajax 사용
                $.ajax({
                    type: "POST",
                    url: "/kwaveweb/modifyUser",
                    data: {
                        "userEmail": $("#userEmail").val(),
                        "userName": $("#userName").val(),
                        "nation": $("#nation").val(),
                        "phone" : $("#phone").val()
                
                    },
                    dataType: "json",
                    success: function(data) {
                        //성공 시 데이터 처리 
                    	if(data.KEY == "SUCCESS"){
                            alert("회원정보수정이 완료되었습니다.");
                           location.href = "http://localhost:8181/kwaveweb/myAccount";
                           
                         }else{
                            alert("회원정보수정이 실패했습니다.");
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
                userName: {
                    required: true,
                    minlength: 1
                },
                nation: {
                    required: true
                }
            },
            messages: {
                userEmail: {
                    required: "Please enter your email address.",
                    email: "Please enter a valid email address."
                },
                userName: {
                    required: "Please enter your name.",
                    minlength: "Your name must be at least 1 charaters long."
                },
                nation: {
                    required: "You have to select nation."
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
    
    
    // 비밀번호 찾기 변경
    // 비밀번호 찾기 validation
    if($("#validateFindPassword").length>0) {
        $("#validateFindPassword").validate({
            submitHandler: function(form) {   
                // 데이터 베이스에 저장 ajax 사용
                $.ajax({
                    type: "POST",
                    url: "/kwaveweb/pwdmodifyService",
                    data: {
                    	"userEmail" : $("#userEmail").val(),
                        "userPassword": $("#newPassword").val()
                    },
                    dataType: "json",
                    success: function(data) {
                        //성공 시 데이터 처리 
                    	if(data.KEY == "SUCCESS"){
                            alert("비밀 번호가 변경되었습니다. 로그인 해주세요.");
                           location.href = "http://localhost:8181/kwaveweb/login";
                           
                         }else{
                            alert("실패");
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
                newPassword: {
                    required: true,
                    minlength: 6
                },
                newPasswordConfirm: {
                    required: true,
                    minlength: 6,
                    equalTo: "#newPassword"
                }
            },
            messages: {
                newPassword: {
                    required: "Please enter a new password.",
                    minlength: "Your password must be at least 6 charaters long."
                },
                newPasswordConfirm: {
                    required: "Please confirm the password.",
                    minlength: "Your password must be at least 6 charaters long.",
                    equalTo: "Please enter the same password as above."
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

 // 배송정보 validation
    if($("#validateDeliveryInfo").length>0) {
        $("#validateDeliveryInfo").validate({
            submitHandler: function(form) {   
                // Iamport 결제 모듈 연동
                $.ajax({
                    type: "POST",
                    url: "/kwaveweb/modifyAddress",
                    data: {
                    	 "address1": $("#address1").val(),
                         "address2": $("#address2").val(),
                         "zipCode": $("#zipCode").val(),
                         "city" : $("#city").val(),
                         "country" : $("#country").val(),
                         "region" : $("#region").val()                        
                    },
                    dataType: "json",
                    success: function(data) {
                    	if(data.KEY == "SUCCESS"){
                            alert("주소지 정보 수정이 완료되었습니다.");
                            location.href = "http://localhost:8181/kwaveweb/myAccount";
                         }else{
                            alert("주소지 정보 수정이 실패했습니다.");
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
                //단순 입력이 되는 값에 한정함
                //넘어오는 값들(ex. rewardNum, proejctName, rewardAmount, shippingAmount...)은 rules에 담지 않았음
                
                zipCode: {
                    required: true
                },
                address1: {
                    required: true
                },
                city: {
                    required: true
                },
                region: {
                    required: true
                },
                country: {
                    required: true
                },
                shippingMethod: {
                    required: true
                }
            },
            messages: {
                zipCode: {
                    required: "Please enter your zip code number."
                },
                address1: {
                    required: "Please enter your address."
                },
                city: {
                    required: "Please enter your city."
                },
                region: {
                    required: "Please enter your region."
                },
                country: {
                    required: "Please select your country. This depend on shipping amount."
                },
                shippingMethod: {
                    required: "Please enter your shipping method"
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
    
    	

 // 결제정보 validation
    if($("#validatePaymentInfo").length>0) {
    	var IMP = window.IMP;
    	IMP.init('imp57757789');	
    	
        $("#validatePaymentInfo").validate({
            submitHandler: function(form) {  
            	IMP.request_pay({
        		    pg : 'inicis', // version 1.1.0부터 지원.
        		    pay_method : document.getElementById(payment_method),
        		    merchant_uid : 'merchant_' + new Date().getTime(),
        		    name : '주문명:KWAVE_D결제테스트',
        		    amount : $("#totalAmount").val(),
        		    buyer_email : $("#userEmail").val(),
        		    buyer_name : $("#userName").val(),
        		    buyer_tel : $("#phone").val(),
        		    buyer_addr : $("#address1").val(),
        		    buyer_postcode : '123-456',
        		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
        		}, function(rsp) {
        		    if ( rsp.success ) {
        		        var msg = '결제가 완료되었습니다.';
        		        msg += '고유ID : ' + rsp.imp_uid;
        		        msg += '상점 거래ID : ' + rsp.merchant_uid;
        		        msg += '결제 금액 : ' + rsp.paid_amount;
        		        msg += '카드 승인번호 : ' + rsp.apply_num;
        		        $.ajax({
                            type: "POST",
                            url: "/kwaveweb/insertDelivery",	// delivery table
                            data: {
                            	 "imp_uid" : rsp.imp_uid,
                            	 "merchant_uid" : rsp.merchant_uid,

                                 "userEmail": $("#userEmail").val(),
                                 "campaignName" : $("#campaignName").val(),
                                 "rewardNum" : $("#rewardNum").val(),
                                 "totalAmount" : $("#totalAmount").val(),
                                 "shippingAmount" : $("#shippingAmount").val(),
                                 "shippingMethod" : $("#shippingMethod").val(),
                                 //"note" : $("#note").val(),
                                 
                                 "userName": $("#userName").val(),
                                 "phone": $("#phone").val(),
                            	 "address1": $("#address1").val(),
                                 "address2": $("#address2").val(),
                                 "zipCode": $("#zipCode").val(),
                                 "city" : $("#city").val(),
                                 "country" : $("#country").val(),
                                 "region" : $("#region").val(),
                                 
                                 
                            },
                            dataType: "json",
                            success: function(data) {
                            	if(data.KEY == "SUCCESS"){
                            		alert("성공처리 되었습니다.")
                                 }else{
                                    alert("주소지 정보 수정이 실패했습니다.");
                                 }
                            }
                        });
        		    } else {
        		        var msg = '결제에 실패하였습니다.';
        		        msg += '에러내용 : ' + rsp.error_msg;
        		        msg += '고유ID : ' + rsp.imp_uid;
        		        msg += '상점 거래ID : ' + rsp.merchant_uid;
        		        msg += '결제 금액 : ' + rsp.paid_amount;
        		    }
        		    
        		    alert(msg);
        		    
        		});
             
            },
            errorPlacement: function(error, element) {  
                error.appendTo(element.parent());  
            },
            onkeyup: false,
            onclick: false,
            rules: {
                //단순 입력이 되는 값에 한정함
                //넘어오는 값들(ex. rewardNum, proejctName, rewardAmount, shippingAmount...)은 rules에 담지 않았음
                userEmail: {
                    required: true,
                    email: true,
                },
                userName: {
                    required: true,
                    minlength: 1
                },
                phone: {
                    required: true
                },
                zipCode: {
                    required: true
                },
                address1: {
                    required: true
                },
                city: {
                    required: true
                },
                region: {
                    required: true
                },
                country: {
                    required: true
                },
                shippingMethod: {
                    required: true
                }
            },
            messages: {
                userEmail: {
                    required: "Please enter your email address.",
                    email: "Please enter a valid email address."
                },
                userName: {
                    required: "Please enter your name.",
                    minlength: "Your name must be at least 1 charaters long."
                },
                phone: {
                    required: "Please enter your phone number."
                },
                zipCode: {
                    required: "Please enter your zip code number."
                },
                address1: {
                    required: "Please enter your address."
                },
                city: {
                    required: "Please enter your city."
                },
                region: {
                    required: "Please enter your region."
                },
                country: {
                    required: "Please select your country. This depend on shipping amount."
                },
                shippingMethod: {
                    required: "Please enter your shipping method"
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

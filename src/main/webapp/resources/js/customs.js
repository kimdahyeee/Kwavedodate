/* T/* Theme Name: KWAVE D Web Service
 * Author: Choi Hong Hee(Adler)
 * Author URI: http://kwavedonate.com
 * Author e-mail: vvshinevv@naver.com
 * Created: Jan 2017
 * File Description: Custom scripts
 */
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
    if($(".swiper-container").length>0) {
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
    }

    
    /* Contact form validation customize*/
    // 회원가입 validation
    if($("#validateSignIn").length>0) {
        $("#validateSignIn").validate({
           
            submitHandler: function(form) {   
                // 데이터 베이스에 저장 ajax 사용
                $.ajax({
                    type: "POST",
                    url: "/insertUser", 
                    data: {
                        "userEmail": $("#userEmail").val(),
                        "userPassword": $("#userPassword").val(),
                        "userName": $("#userName").val(),
                        "location" : $("#location").val()
                    },
                    dataType: "json",
                    success: function(data) {
                       if(data.KEY == "SUCCESS"){
                          alert(signin_welcome);//회원가입을 축하드립니다
                          location.replace("/login");
                       }else{
                          alert("이미 회원가입 된 이메일입니다.");
                          
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

    // 로그인 validation
    if($("#validateLogin").length>0) {
        $("#validateLogin").validate({
            submitHandler: function(form) {   
                // 데이터 베이스에 저장 ajax 사용
                $.ajax({
                   type: "POST",
                    url: "/kwaveweb/j_spring_security_check",
                    data: {
                        "username": $("#userEmail").val(),
                        "password":$("#userPassword").val(),
                        "remember_me" : $("#remember_me").val()
                    },
                    dataType: "json",
                    success: function(data) {
                       //성공 시 데이터 처리 
                        if(data.KEY=="SUCCESS") {
                              location.replace(data.RETURNURI);
                        } else if(data.KEY=="SUCCESS_ADMIN") {
                        	  location.replace(data.RETURNURI);
                        } else {
                           alert("로그인 실패");
                           location.replace("/login?fail");
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

    // 비밀번호 찾기 validation
    if($("#validateFindPasswordSend").length>0) {
        $("#validateFindPasswordSend").validate({
    		
            submitHandler: function(form) {   
                // 데이터 베이스에 저장 ajax 사용
            	wrapWindowByMask();
                $.ajax({
                    type: "POST",
                    url: "/sendLink",
                    data: {
                        "userEmail": $("#userEmail").val()
                    },
                    dataType: "json",
                    success: function(data) {
                       if(data.KEY == "SUCCESS"){
                    	    closeWindowByMask();
                            alert("메일이 전송되었습니다.");
                            location.replace("/");
                         }else{
                        	closeWindowByMask();
                            alert("메일을 확인해주세요.");
                            location.replace("/findPassword");
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
                    url: "/modifyPassword",
                    data: {
                        "currentPassword": $("#currentPassword").val(),
                        "newPassword": $("#newPassword").val()
                    },
                    dataType: "json",
                    success: function(data) {
                        //성공 시 데이터 처리 
                       if(data.KEY == "SUCCESS"){
                            alert("비밀번호가 변경되었습니다.");
                            location.replace("/myAccount");
                         }else{
                            alert("비밀번호를 확인해주세요.");
                            location.replace("/myAccount");
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
                    required: confirm_password, //"Please confirm the password.",
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
    
    // ui 변경
    if($("#updateYourInfo").length>0) {
       var cityInputTag = "" +
             "<div class='form-group has-feedback cityArea'>" +
               "<div class='col-sm-12'>" +
                     "<input type='text' class='form-control' id='city' name='city' placeholder='City' value=''/>" +
                     "<i class='fa fa-tag form-control-feedback fa-lg'></i>" +
                  "</div>" +
            "</div>";
      var regionInputTag = "" +
            "<div class='form-group has-feedback regionArea'>" +
                  "<div class='col-sm-12'>" +
                  "<input type='text' class='form-control' id='region' name='region' placeholder='Region' value=''/>" +
                  "<i class='fa fa-tags form-control-feedback fa-lg'></i>" +
               "</div>" +
            "</div>";
      var cityRegionArea = "" +
            "<div class='cityRegionArea'>" +
               "<input type='hidden' id='city' name='city value=''/>" + 
               "<input type='hidden' id='region' name='region' value=''/>" +
            "</div>";
       
       $("#country").change(function() {
          if($("#country").val() == 'Korea') {
             $(".cityArea").remove();
             $(".regionArea").remove();
             $(".appendInputArea").append(cityRegionArea);
          } else {   
             if(!($(".cityArea").length>0 && $(".regionArea").length>0)) {
                $(".cityRegionArea").remove();
                $(".appendInputArea").append(cityInputTag);
                 $(".appendInputArea").append(regionInputTag);
             }
          }
       });
    }

    // 개인 정보 변경 validation
    if($("#validateAboutYou").length>0) {
       $("#nation").val($("#nation_hidden").val()).attr("selected", "selected");
        $("#validateAboutYou").validate({
            submitHandler: function(form) {   
                // 데이터 베이스에 저장 ajax 사용
                $.ajax({
                    type: "POST",
                    url: "/modifyUser",
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
                           alert(msg2); //회원정보수정이 완료되었습니다.
                           location.replace("/myAccount");
                           
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
                    url: "/pwdmodifyService",
                    data: {
                       "userEmail" : $("#userEmail").val(),
                        "userPassword": $("#newPassword").val()
                    },
                    dataType: "json",
                    success: function(data) {
                        //성공 시 데이터 처리 
                       if(data.KEY == "SUCCESS"){
                            alert("비밀 번호가 변경되었습니다. 로그인 해주세요.");
                            location.replace("/login");
                           
                         }else{
                            alert("비밀번호 변경 실패하였습니다.");
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
       $("#country").val($("#country_hidden").val()).attr("selected", "selected");
        $("#validateDeliveryInfo").validate({
            submitHandler: function(form) {   
                // Iamport 결제 모듈 연동
                $.ajax({
                    type: "POST",
                    url: "/modifyAddress",
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
                            location.replace("/myAccount");
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
    
    
   
	
	
    // ui 변경 사항
    if($("#validatePaymentInfo").length>0) {
    	// 배송비 값 설정 5, 10, 15, 20, 8, 25 달러 환율
    	const sAmountKR = 5, sAmountBR = 10, sAmountCN = 15, sAmountHK = 20, sAmountJP = 8, sAmountUS = 25;
    	const sCountryKR = 1100, sCountryCN = 165, sCountryEN = 1;
    	const sMethodKR = "국내배송", sMethod = "EMS";
    	
    	var pageLocale = $("#currentLocale").val();
    	var rewardAmount = parseInt($("#rewardAmount").val());

    	$("#country").val($("#countryVal").val()).attr("selected", "selected");
    	var dCountry = $("#country").val();
    	
		var cityTag = "" +
				"<div class='form-group has-feedback text-center cityArea'>" +
					"<label for='inputCity' class='col-xs-3 col-sm-3'>City : </label>" +
					"<div class='col-xs-9 col-sm-9'>" +
						"<input type='text' class='form-control' id='city' name='city' placeholder='City' value='' required>" +
						"</div>" +
				"</div>";
		var regionTag = "" +
				"<div class='form-group has-feedback text-center regionArea'>" +
					"<label for='inputCity' class='col-xs-3 col-sm-3'>Region : </label>" +
					"<div class='col-xs-9 col-sm-9'>" +
						"<input type='text' class='form-control' id='region' name='region' placeholder='Region' value='' required>" +
						"</div>" +
				"</div>";
		
		var paymentMethod = "" +
				"<div id='paymentMethod'>" +
					"<span><input type='radio' name='payment_method' id='payment_method_card' value='card' required/> Card</span><br><span class='paymentCardArea'></span>" +
					"<span><input type='radio' name='payment_method' id='payment_method_trans' value='trans' required/> Trans</span><br><span class='paymentTransArea'></span>" +
					"<span><input type='radio' name='payment_method' id='payment_method_phone' value='phone' required/> Phone</span><br><span class='paymentPhoneArea'</span>" +
					"<span><input type='radio' name='payment_method' id='payment_method_paypal' value='paypal' required> Paypal</span><span class='paymentPaypalArea'></span>" +
				"</div>";
		
    	// payment 첫 Loading 시
    	function shippingAmountFunc(sAmount, sCountry, sMethod) {
    		 var cRewardAmount = rewardAmount;
    		 var cTotalAmount = rewardAmount + sAmount;
    		 
			 $("#shippingMethod").val(sMethod);
			 $("#shippingAmount").val(sAmount);
			 $("#totalAmount").val(cTotalAmount);
			 
    		 if ($("#country").val() == "Korea") {
		 		 $("#city").val("");		$("div").remove(".cityArea");
				 $("#region").val("");		$("div").remove(".regionArea");
		 	 }
    		 
		 	 if (pageLocale == "ko")		cRewardAmount = cRewardAmount*1100;
		 	 else if (pageLocale == "ch")	cRewardAmount = cRewardAmount*165;
		  	 else 							cRewardAmount = cRewardAmount;

		 	 $(".rewardAmountArea").text(notation + rewardAmount*sCountry + "  ($" + rewardAmount + ")" );
		 	 $(".shippingAmountArea").text(notation + sAmount*sCountry + "  ($" + sAmount + ")");
			 $(".totalAmountArea").text(notation + cTotalAmount*sCountry + "  ($" + cTotalAmount + ")" );

			 if (pageLocale == "ko") {
				$(".paymentPaypalArea").text("  ($"+  cTotalAmount + ")");
				$(".paymentTransArea").text("  ("+ notation + $("#totalAmount").val()*1100 + ")");
				$(".paymentCardArea").text("  (" + notation + $("#totalAmount").val()*1100 + ")");
				$(".paymentPhoneArea").text("  (" + notation + $("#totalAmount").val()*1100 + ")");
				
			} else {
				$(".paymentPaypalArea").text("  ($" + cTotalAmount + ")");
				$(".paymentTransArea").text("  (\u20A9"+ cTotalAmount*1100+ ")");
				$(".paymentCardArea").text("  (\u20A9" + cTotalAmount*1100+ ")");
				$(".paymentPhoneArea").text("  (\u20A9" + cTotalAmount*1100+ ")");
			}
		}
    	// reward가 있는 경우
    	if($("#rewardNum").val() != 0) {
    		if(pageLocale == "ko") {					var sCountry = sCountryKR;
    			
    			if(dCountry == "Korea") 				shippingAmountFunc(sAmountKR, sCountry, sMethodKR);
    			else if (dCountry == "China") 			shippingAmountFunc(sAmountCN, sCountry, sMethod);
    			else if (dCountry == "HongKong")		shippingAmountFunc(sAmountHK, sCountry, sMethod);
    			else if (dCountry == "Japan") 			shippingAmountFunc(sAmountJP, sCountry, sMethod);
    			else if (dCountry == "United States") 	shippingAmountFunc(sAmountUS, sCountry, sMethod);
    			else if (dCountry == "Brazil") 			shippingAmountFunc(sAmountBR, sCountry, sMethod);
    		} 
    		else if(pageLocale == "en") {				var sCountry = sCountryEN;
    			
    			if(dCountry == "Korea") 				shippingAmountFunc(sAmountKR, sCountry, sMethodKR);
    			else if (dCountry == "China") 			shippingAmountFunc(sAmountCN, sCountry, sMethod);
    			else if (dCountry == "HongKong") 		shippingAmountFunc(sAmountHK, sCountry, sMethod);
    			else if (dCountry == "Japan") 			shippingAmountFunc(sAmountJP, sCountry, sMethod);
    			else if (dCountry == "United States") 	shippingAmountFunc(sAmountUS, sCountry, sMethod);
    			else if (dCountry == "Brazil") 			shippingAmountFunc(sAmountBR, sCountry, sMethod);
    		} 
    		else if(pageLocale == "ch") {				var sCountry = sCountryCN;
    			
    			if(dCountry == "Korea") 				shippingAmountFunc(sAmountKR, sCountry, sMethodKR);
    			else if (dCountry == "China")     		shippingAmountFunc(sAmountCN, sCountry, sMethod);
    			else if (dCountry == "HongKong")     	shippingAmountFunc(sAmountHK, sCountry, sMethod);
    			else if (dCountry == "Japan")     		shippingAmountFunc(sAmountJP, sCountry, sMethod);
    			else if (dCountry == "United States")	shippingAmountFunc(sAmountUS, sCountry, sMethod);
    			else if (dCountry == "Brazil")     		shippingAmountFunc(sAmountBR, sCountry, sMethod);
    		}
    	} 
    	// reward가 없는 경우
    	else {
    		$("#shippingAmount").val("0");
    		$("#totalAmount").val("10");
    		if(pageLocale == "ko") 			$(".totalAmountArea").text(notation + "11000" + "  ($10)" );
    		else if (pageLocale == "ch") 	$(".totalAmountArea").text(notation + "1650" + "  ($10)" );
    		else if (pageLocale == "en")	$(".totalAmountArea").text(notation + "10" + "  ($10)" );
    	}
    	
    	// 국가 변경 시
		$("#country").change(function() {
			function shippingAmountChangeFunc(sAmount, sCountry, sMethod) {
				shippingAmountFunc(sAmount, sCountry, sMethod);				
    		 	
				if(!($(".cityArea").length>0 && $(".regionArea").length>0) && !($("#country").val() == "Korea")) {
					$(".appendArea").append(cityTag);
					$(".appendArea").append(regionTag);
					$("#shippingMethod").val(sMethod);
				} else {
					$("#shippingMethod").val(sMethod);
				}
			}
			if(pageLocale == "ko") {
    			var sCountry = sCountryKR;
    			if($("#country").val() == "Korea") {
    				shippingAmountChangeFunc(sAmountKR, sCountry,sMethodKR);
    			} else if ($("#country").val() == "China") {
    				shippingAmountChangeFunc(sAmountCN, sCountry,sMethod);
    			} else if ($("#country").val() == "HongKong") {
    				shippingAmountChangeFunc(sAmountHK, sCountry,sMethod);
    			} else if ($("#country").val() == "Japan") {
    				shippingAmountChangeFunc(sAmountJP, sCountry,sMethod);
    			} else if ($("#country").val() == "United States") {
    				shippingAmountChangeFunc(sAmountUS, sCountry,sMethod);
    			} else if ($("#country").val() == "Brazil") {
    				shippingAmountChangeFunc(sAmountBR, sCountry,sMethod);
    			}
    		} else if(pageLocale == "en") {
    			var sCountry = sCountryEN;
    			if($("#country").val() == "Korea") {
    				shippingAmountChangeFunc(sAmountKR, sCountry,sMethodKR);
    			} else if ($("#country").val() == "China") {
    				shippingAmountChangeFunc(sAmountCN, sCountry,sMethod);
    			} else if ($("#country").val() == "HongKong") {
    				shippingAmountChangeFunc(sAmountHK, sCountry,sMethod);
    			} else if ($("#country").val() == "Japan") {
    				shippingAmountChangeFunc(sAmountJP, sCountry,sMethod);
    			} else if ($("#country").val() == "United States") {
    				shippingAmountChangeFunc(sAmountUS, sCountry,sMethod);
    			} else if ($("#country").val() == "Brazil") {
    				shippingAmountChangeFunc(sAmountBR, sCountry,sMethod);
    			}
    		} else if(pageLocale == "ch") {
    			var sCountry = sCountryCN;
    			if($("#country").val() == "Korea") {
    				shippingAmountChangeFunc(sAmountKR, sCountry,sMethodKR);
    			} else if ($("#country").val() == "China") {
    				shippingAmountChangeFunc(sAmountCN, sCountry,sMethod);
    			} else if ($("#country").val() == "HongKong") {
    				shippingAmountChangeFunc(sAmountHK, sCountry,sMethod);
    			} else if ($("#country").val() == "Japan") {
    				shippingAmountChangeFunc(sAmountJP, sCountry,sMethod);
    			} else if ($("#country").val() == "United States") {
    				shippingAmountChangeFunc(sAmountUS, sCountry,sMethod);
    			} else if ($("#country").val() == "Brazil") {
    				shippingAmountChangeFunc(sAmountBR, sCountry,sMethod);
    			}
    		}
		});
    }
    
    // 결제정보 validation
    if($("#validatePaymentInfo").length>0) {
       var IMP = window.IMP;
       //IMP.init('imp57757789');   
        $("#validatePaymentInfo").validate({
            submitHandler: function(form) {  
            	var payment_country = $("#country").val();
            	var totalAmount = $("#totalAmount").val();
            	var payment_method_checked = '';
            	var payment_pg = '';
            	var payment_method = document.getElementsByName("payment_method");
                for(var i = 0; i < payment_method.length; i++) {
                   if(payment_method[i].checked == true) {
                      payment_method_checked = payment_method[i].value;
                   }
                }
            	
            	if(payment_method_checked == "paypal") {
            		payment_pg = 'paypal';
            		IMP.init('imp57757789');
            		payment_method = 'card';
            	} else {
            		payment_pg = 'inicis';
            		totalAmount = totalAmount * 1100;
            		IMP.init('imp57757789');
            	}
              
               IMP.request_pay({
                  pg : payment_pg, // version 1.1.0부터 지원.   // inicis
                  pay_method : payment_method_checked,//payment_method_checked,
                  merchant_uid : 'merchant_' + new Date().getTime(),
                  name : $("#campaignName").val() +"/" + $("#rewardSubject").val(),
                  amount : totalAmount,
                  buyer_email : $("#userEmail").val(),
                  buyer_name : $("#userName").val(),
                  buyer_tel : $("#phone").val(),
                  buyer_addr : $("#address1").val(),
                  buyer_postcode : $("#zipCode").val(),
//                  m_redirect_url : 'http://13.124.5.135:8181/m_redirect?'
                  m_redirect_url : 'http://13.124.66.223:8181/kwaveweb/m_redirect?'
                	  + "campaignName=" + $("#campaignName").val()
                	  + "&note=" + $("#note").val()
                	  + "&rewardNum=" + $("#rewardNum").val()
                	  + "&rewardAmount=" + $("#rewardAmount").val()
                	  + "&totalAmount=" + $("#totalAmount").val()
                	  + "&shippingAmount=" + $("#shippingAmount").val()
                	  + "&shippingMethod=" + $("#shippingMethod").val()
                	  + "&note=" + $("#note").val()
                	  + "&city=" + $("#city").val()
                	  + "&region=" + $("#region").val()
                	  + "&country=" + $("#country").val()
                	  + "&address2=" + $("#address2").val()
                	  
              }, function(rsp) {
                  if ( rsp.success ) {
                      var msg = '결제가 완료되었습니다.';
                      msg += '고유ID : ' + rsp.imp_uid;
                      msg += '상점 거래ID : ' + rsp.merchant_uid;
                      msg += '결제 금액 : ' + rsp.paid_amount;
                      msg += '카드 승인번호 : ' + rsp.apply_num;

                      $.ajax({
                               type: "POST",
                               url: "/kwaveweb/insertDelivery",   // delivery table
                               data: {
                            	   "imp_uid" : rsp.imp_uid,
                            	   "campaignName" : $("#campaignName").val(),
	                               "rewardNum" : $("#rewardNum").val(),
	                               "rewardAmount" : $("#rewardAmount").val(),
	                               "shippingAmount" : $("#shippingAmount").val(),
	                               "shippingMethod" : $("#shippingMethod").val(),
	                               "note" : $("#note").val(),
	                               "address2": $("#address2").val(),
	                               "city" : $("#city").val(),
	                               "country" : $("#country").val(),
	                               "region" : $("#region").val()
	                            },
	                            dataType: "json",
	                            success: function(data) {
	                            	if(data.KEY == "SUCCESS"){
	                            		alert("성공처리 되었습니다.")
	                            		location.replace("/kwaveweb/completePayment?imp_uid=" + rsp.imp_uid);
	                                 }else{
	                                    alert("결제에 실패했습니다. 다시 시도해주세요.");
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

function wrapWindowByMask() {
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height(); 
    var maskWidth = window.document.body.clientWidth;
     
    var mask = "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
    var loadingImg = '';
     
    loadingImg += "<div id='loadingImg' style='position:absolute; left:50%; top:40%; display:none; z-index:10000;'>";
    loadingImg += " <img src='resources/images/viewLoading.gif'/>";
    loadingImg += "</div>";  
 
    //화면에 레이어 추가
    $('body')
        .append(mask)
        .append(loadingImg)
       
    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $('#mask').css({
            'width' : maskWidth
            , 'height': maskHeight
            , 'opacity' : '0.3'
    }); 
 
    //마스크 표시
    $('#mask').show();   
 
    //로딩중 이미지 표시
    $('#loadingImg').show();
}

function closeWindowByMask() {
    $('#mask, #loadingImg').hide();
    $('#mask, #loadingImg').remove();  
}

/*
 * youtube video
 */
if(jQuery("#player").length > 0){
	var tag = document.createElement('script');
	
	tag.src = "https://www.youtube.com/iframe_api";
	var firstScriptTag = document.getElementsByTagName('script')[0];
	firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
	
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




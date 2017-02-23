/* Theme Name: KWAVE D Web Service
 * Author: Kim Da Hye
 * Author URI: http://kwavedonate.com
 * Author e-mail: dahye4321@naver.com
 * Created: Jan 2017
 * File Description: Custom scripts
 */

window.fbAsyncInit =function(){
	FB.init({
		appId:'384354298609794',
		cookie:true,
		xfbml:true,
		version:'v2.8'
	});
};

(function(d, s, id){
	var js, fjs = d.getElementsByTagName(s)[0];
	if(d.getElementById(id)){return;}
	js = d.createElement(s); js.id=id;
	js.src = "//connect.facebook.net/ko_KR/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

$(document).ready(function(){
	$("#facebookLoginBtn").click(function(event){
		FB.getLoginStatus(function(response) {
			 FB.login(function(response) {
			  if (response.status === 'connected') {
			    console.log(response.authResponse.accessToken);
			    FB.api('/me', {fields: 'name,email'}, function(user){
			    	if(user.email == null){
			    		alert("이메일 정보가 누락된 sns 계정입니다. 일반 회원가입을 해주시길 바랍니다.");
			    		location.replace("/kwaveweb/signin");
			    	}else{
			    		$.ajax({
		                    type: "POST",
		                    url: "/kwaveweb/FacebookValidate", 
		                    data: {
		                        "userEmail" : user.email,
		                        "userName" : user.name
		                    },
		                    dataType: "json",
		                    success: function(data) {
		                       if(data.KEY == "SUCCESS"){
		                    	   //처음 페이스북 로그인시
		                    	   $.ajax({
		                           	type: "POST",
		                               url: "/kwaveweb/j_spring_security_check",
		                               data: {
		                                   "userEmail": user.email,
		                                   "userPassword":user.email+user.name+"1@#$@#!$$$#@"
		                               },
		                               dataType: "json",
		                               success: function(data) {
		                               	//성공 시 데이터 처리 
		                                   if(data.KEY=="SUCCESS") {
		                                      if((document.refferer)=="localhost:8181/kwaveweb/login") {
		                                         location.href="/kwaveweb/";
		                                      }
		                                      else {
		                                         location.replace(document.referrer);
		                                      }
		                                   } else {
		                                      alert("로그인 실패");
		                                      location.href="/kwaveweb/login";
		                                   }
		                                }
		                            });
		                    	  // $.post("/kwaveweb/j_spring_security_check", {"userEmail" : user.email, "userPassword" : user.email+user.name+"1@#$@#!$$$#@"});
		                    	   //location.href="/kwaveweb/";
		                       }else{
   		                          alert("이미 회원가입 된 이메일입니다.");
   		                          location.replace("/kwaveweb/login");
		                       }
		                    }
		                });
			    	}
			    });
			  }
			},{scope: 'public_profile, email'});
		});
	});
});



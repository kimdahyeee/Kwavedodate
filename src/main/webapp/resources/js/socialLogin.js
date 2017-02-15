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
			    		$.post("http://localhost:8181/kwaveweb/facebookLogin", {"userEmail" : user.email, "userName" : user.name});
			    		location.replace("/kwaveweb");
			    	}
			    });
			  }
			},{scope: 'public_profile, email'});
		});
	});
});



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
			  }
			},{scope: 'public_profile, email'});
		});
	});
});



package com.web.kwave;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.httpclient.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@PropertySource("/resources/database.properties")
public class FacebookLogin {

	private static final Logger logger = LoggerFactory.getLogger(FacebookLogin.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Inject
	private Environment environment;
	

	/**
	 * 페이스북 로그인 팝업 호출
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/facebookSignIn", method = RequestMethod.GET)
	public String facebookSignin(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception{
		logger.info("{}", "facebookSignin start");
	
		String callbackUrl = environment.getProperty("callback.host") + "/facebook/facebookAccessToken";
		String oauthUrl = "https://www.facebook.com/dialog/oauth?" +
                        "client_id="+ environment.getProperty("facebook.app.id")+"&redirect_uri="+URLEncoder.encode(callbackUrl, "UTF-8")+
                        "&display=popup"+
                        "&scope=public_profile, email";
			                             
        model.addAttribute("oauthUrl", oauthUrl);

		return "login";
	}
	
	
	@RequestMapping(value="/facebook/index", method=RequestMethod.POST)
	public String facebookIndex(HttpSession session, Model model){
		//facebook info setting
		Facebook facebook = new FacebookTemplate((String)session.getAttribute("ACCESS_TOKEN"));
		String facebookEmail = facebook.userOperations().getUserProfile().getEmail();
		String facebookName = facebook.userOperations().getUserProfile().getName();
		
		logger.info("facebookEmail=>{}", facebookEmail);
		
		HashMap<String, String> profileInfo = new HashMap<String, String>();
		profileInfo.put("facebookEmail", facebookEmail);
		profileInfo.put("facebookName", facebookName);
		
		model.addAttribute("facebookInfo", profileInfo);
		
		return "test";
	}
	
	/**
	 * 페이스북 로그인 결과 리턴
	 * @throws Exception 
	 */
	@RequestMapping(value="/facebook/facebookAccessToken")
	public String getFacebookAccessToken(HttpServletRequest request, Model model, @RequestParam(value="message", defaultValue="", required=false) String message, HttpServletResponse response) throws Exception{
		String code= request.getParameter("code");
		String errorReson = request.getParameter("error_reason");
		String errorDescription = request.getParameter("error_description");
		
		if(logger.isInfoEnabled()){
			logger.info("code=>" +code);
			logger.info("errorReson=>" +errorReson);
			logger.info("errorDescription=>" +errorDescription);
		}
		
		requestAccessToken(request, code);
		
		return "callback";
	}
	
	/**
	 * 토큰 값 받아옴
	 * @throws Exception 
	 */
	public void requestAccessToken(HttpServletRequest request, String code) throws Exception{
		String accessToken ="";
		String result = "";
		
		String callbackUrl = environment.getProperty("callback.host") + "/facebook/facebookAccessToken";
		String url = "https://graph.facebook.com/oauth/access_token"+
			                "?client_id="+environment.getProperty("facebook.app.id")+
			                "&client_secret="+environment.getProperty("facebook.app.secret")+
			                "&redirect_uri="+URLEncoder.encode(callbackUrl, "UTF-8")+
			                "&code="+code;
	
		HttpGet httpGet = new HttpGet(url);
		DefaultHttpClient httpClient = new DefaultHttpClient();
		result= httpClient.execute(httpGet, new BasicResponseHandler());
		accessToken = result.split("&")[0].replaceFirst("access_token", "");
		
		setAccessToken(request, accessToken);

	}
	
	public void setAccessToken(HttpServletRequest request, String accessToken) throws Exception {
	    request.getSession().setAttribute("ACCESS_TOKEN", accessToken);
	    logger.info("ACCESS_TOKEN => " + request.getSession().getAttribute("ACCESS_TOKEN"));
	}


}

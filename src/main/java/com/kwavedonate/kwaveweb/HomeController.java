package com.kwavedonate.kwaveweb;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.social.connect.Connection;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.FacebookProfile;
import org.springframework.social.facebook.api.UserOperations;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kwavedonate.kwaveweb.campaign.service.CampaignService;
import com.kwavedonate.kwaveweb.core.util.BcryptEncoder;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource(name = "bcryptEncoder")
	private BcryptEncoder encoder;
	
	@Resource(name="campaignService")
	private CampaignService campaignService;
	
	@Autowired
	private FacebookConnectionFactory connectionFactory;
	
	@Autowired
	private OAuth2Parameters oAuth2Parameters;
	
	public String getAuthorizeUrl(){
		OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
		String authorizeUrl = oauthOperations.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);
		return authorizeUrl;
	}
	
	@Value("${facebook.redirect.url}")
	private String redirectUrl;
	
	public Map<String, Object> getFacebookUserInfo(String code){
		Map<String, Object> map = new HashMap<String, Object>();
		OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
		
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, redirectUrl, null);
		String accessToken = accessGrant.getAccessToken();
		
		Connection<Facebook> connection = connectionFactory.createConnection(accessGrant);
		Facebook facebook = connection ==null? new FacebookTemplate(accessToken) : connection.getApi();
		
		UserOperations userOperations = facebook.userOperations();
		FacebookProfile facebookProfile = null;
		try{
			facebookProfile = userOperations.getUserProfile();
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		map.put("facebookid", facebookProfile.getId());
		return map;
	}
	
	/**
	 * 메인화면
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/")
	public String main(Model model, Locale loc) {
		
		Locale currentLocale = LocaleContextHolder.getLocale();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentLocale", currentLocale);
		List<Map<String, Object>> campaignsList = campaignService.getMainCampaignsList(map);
		
		for(Map<String, Object> campaignsLists : campaignsList){
			int campaignDueDate = Integer.valueOf(campaignsLists.get("campaignDueDate").toString());
			
			logger.info("campaignDueDate == {}.", campaignDueDate);
			if(campaignDueDate == 7){
				campaignsLists.put("campaignDueDate", "a week left");
			}else if(campaignDueDate == 1){
				campaignsLists.put("campaignDueDate", "a day left");
			}else if(campaignDueDate == 0){
				campaignsLists.put("campaignDueDate", "ends today");
			}else{
				campaignsLists.put("campaignDueDate", campaignDueDate+" days left");
			}
		}
		
		logger.info("main == {}.", campaignsList);
		model.addAttribute("campaignsList", campaignsList);
		return "main";
	}

	/**
	 * about us 화면
	 * @return
	 */
	@RequestMapping("/aboutUs")
	public String aboutUs() {
		logger.info("aboutUs");
		return "aboutUs";
	}
	
	/**
	 * login 화면
	 * @param request
	 * @return
	 */
	@RequestMapping("/login")
	public String login(HttpServletRequest request) {
		logger.info("loginPage");
		
		return "login";
	}
}

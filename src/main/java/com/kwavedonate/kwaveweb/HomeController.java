package com.kwavedonate.kwaveweb;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kwavedonate.kwaveweb.campaign.service.CampaignService;
import com.kwavedonate.kwaveweb.core.util.BcryptEncoder;
import com.kwavedonate.kwaveweb.user.vo.UserDetailsVO;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private Facebook facebook;

	@Resource(name = "bcryptEncoder")
	private BcryptEncoder encoder;
	
	@Resource(name="campaignService")
	private CampaignService campaignService;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="/")
	public String main(Model model) {

		List<Map<String, Object>> list = campaignService.getMainCampaign();
		
		for(Map<String, Object> lists : list){
			int campaignDueDate = Integer.valueOf(lists.get("campaignDueDate").toString());
			
			logger.info("campaignDueDate == {}.", campaignDueDate);
			if(campaignDueDate == 7){
				lists.put("campaignDueDate", "a week left");
			}else if(campaignDueDate == 1){
				lists.put("campaignDueDate", "a day left");
			}else if(campaignDueDate == 0){
				lists.put("campaignDueDate", "ends today");
			}else{
				lists.put("campaignDueDate", campaignDueDate+" days left");
			}
		}
		
		logger.info("main == {}.", list);
		model.addAttribute("list", list);

		return "main";
	}
	
	@RequestMapping(value="/aboutUs")
	public String aboutUs(){
		return "aboutUs";
	}
	
	@RequestMapping(value="/checkAuth", method=RequestMethod.GET)
	@Secured({"ROLE_ADMIN", "ROLE_USER"})
	public String checkAuth(Locale locale, Model model, Authentication auth) {
		UserDetailsVO vo = (UserDetailsVO) auth.getPrincipal();
		logger.info("Welcome checkAuth! Authentication is {}.", auth);
		logger.info("UserDetailsVO == {}.", vo);
		model.addAttribute("auth", auth);
		model.addAttribute("vo", vo);
		return "checkAuth";
	}
	
}

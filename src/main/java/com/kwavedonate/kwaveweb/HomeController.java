package com.kwavedonate.kwaveweb;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	/**
	 * 메인화면
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/")
	public String main(Model model) {

		List<Map<String, Object>> campaignsList = campaignService.getMainCampaignsList();
		
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
	
	

	/* about us 페이지 */
	@RequestMapping("/aboutUs")
	public String aboutUs() {
		return "aboutUs";
	}
	
	/* 로그인 실패시 이동 */
	@RequestMapping("/loginfail")
	public String loginfail(HttpServletResponse response) {

		return "/login";
	}
	
	/*
	 * 로그인 페이지
	 */
	@RequestMapping("/login")
	public String login(HttpServletRequest request) {

		return "login";
	}
}

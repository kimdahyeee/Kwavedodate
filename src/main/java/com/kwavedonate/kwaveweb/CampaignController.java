package com.kwavedonate.kwaveweb;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kwavedonate.kwaveweb.campaign.service.CampaignService;
import com.kwavedonate.kwaveweb.campaign.vo.CampaignVo;
import com.kwavedonate.kwaveweb.campaign.vo.RewardsVo;

@Controller
@RequestMapping(value="/campaigns")
public class CampaignController {
	
	private static final Logger logger = LoggerFactory.getLogger(CampaignController.class);
	
	@Resource(name="campaignService")
	private CampaignService campaignService;
	
	static final int KoExchangeRate = 1100; //1달러당 1100원
	static final int ChExchangeRate = 165; //1달러당 165위안
	static final int DefaultMoney = 10; //기본 요금
	
	/**
	 * campaigns 화면
	 * @param model
	 * @return
	 */
	@RequestMapping(value="")
	public String CampaignsView(Model model, Locale locale){
		
		Locale currentLocale = LocaleContextHolder.getLocale();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("currentLocale", currentLocale);
		
		List<Map<String, Object>> list = campaignService.getAllCampaignsList(param);
		List<Map<String, Object>> currentList = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> recentlyList = new ArrayList<Map<String,Object>>();
		
		for(Map<String, Object> lists : list){
			String campaignName = lists.get("campaignName").toString();
			String campaignSubject = lists.get("campaignSubject").toString();
			String campaignImg = lists.get("campaignImg").toString();
			int campaignDueDate = Integer.valueOf(lists.get("campaignDueDate").toString());
			
			Map<String, Object> map = new HashMap<String, Object>();

			//current campaigns list
			if(campaignDueDate >= 0){
				if(campaignDueDate == 7){
					map.put("campaignDueDate", "a week left");
				}else if(campaignDueDate == 1){
					map.put("campaignDueDate", "a day left");
				}else if(campaignDueDate == 0){
					map.put("campaignDueDate", "ends today");
				}else{
					map.put("campaignDueDate", campaignDueDate+" days left");
				}
				map.put("campaignName", campaignName);
				map.put("campaignSubject", campaignSubject);
				map.put("campaignImg", campaignImg);
				
				currentList.add(map);
			}else{


				//recently campaigns list
				map.put("campaignName", campaignName);
				map.put("campaignSubject", campaignSubject);
				map.put("campaignImg", campaignImg);
				
				recentlyList.add(map);
			}
		}
		
		model.addAttribute("currentList", currentList);
		model.addAttribute("recentlyList", recentlyList);
	
		return "campaigns";
	}
	
	/**
	 * campaign 상세화면
	 * @param campaignName
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{campaignName}")
	public String CampaignsDetail(@PathVariable("campaignName") String campaignName, Model model, Locale locale){
		Locale currentLocale = LocaleContextHolder.getLocale();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("campaignName", campaignName);
		map.put("currentLocale", currentLocale);
		CampaignVo campaignDetail = campaignService.getCampaignDetail(map);
		int campaignDueDate = Integer.valueOf(campaignDetail.getDuedateToSysdate());
		
		if(campaignDueDate >= 0){
			if(campaignDueDate == 7){
				campaignDetail.setDuedateToSysdate("a week left");
			}else if(campaignDueDate == 1){
				campaignDetail.setDuedateToSysdate("a day left");
			}else if(campaignDueDate == 0){
				campaignDetail.setDuedateToSysdate("ends today");
			}else{
				campaignDetail.setDuedateToSysdate(campaignDueDate+" days left");
			}
		}else{
			campaignDetail.setDuedateToSysdate("end");
		}
		
		model.addAttribute("details", campaignDetail);
		
		return "campaignDetail";
	}
	
	/**
	 * campaign detail화면에 삽입되는 rewards화면
	 * @param campaignName
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{campaignName}/reward")
	public String rewardView(@PathVariable("campaignName") String campaignName, Model model, Locale locale){
		Locale currentLocale = LocaleContextHolder.getLocale();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("campaignName", campaignName);
		map.put("currentLocale", currentLocale);
		List<RewardsVo> rewardsDetail = campaignService.getAllRewards(map);
		for(RewardsVo lists : rewardsDetail){
			int amount = Integer.valueOf(lists.getRewardAmount());
			if(currentLocale.toString().equals("en")){
				lists.setRewardAmount(String.valueOf(amount));
			}else if(currentLocale.toString().equals("ch")){
				amount = amount * ChExchangeRate;
				lists.setRewardAmount(String.valueOf(amount));
			}else{
				amount = amount * KoExchangeRate;
				lists.setRewardAmount(String.valueOf(amount));
			}
		}
		
		int defaultMoney = DefaultMoney;
		if(currentLocale.toString().equals("en")){
			model.addAttribute("defaultMoney", String.valueOf(defaultMoney));
		}else if(currentLocale.toString().equals("ch")){
			defaultMoney = DefaultMoney * ChExchangeRate;
			model.addAttribute("defaultMoney", String.valueOf(defaultMoney));
		}else{
			defaultMoney = DefaultMoney * KoExchangeRate;
			model.addAttribute("defaultMoney", String.valueOf(defaultMoney));
		}
		
		model.addAttribute("rewards", rewardsDetail);
		
		return "empty/rewards";
	}
}

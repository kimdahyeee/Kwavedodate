package com.kwavedonate.kwaveweb;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kwavedonate.kwaveweb.campaign.service.CampaignService;

@Controller
public class CampaignController {

	private static final Logger logger = LoggerFactory.getLogger(CampaignController.class);
	
	@Resource(name="campaignService")
	private CampaignService campaignService;
	
	@RequestMapping(value="/campaigns")
	public String CampaignsView(Model model){
		
		List<Map<String, Object>> list = campaignService.getCampaignsList();
		List<Map<String, Object>> currentList = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> recentlyList = new ArrayList<Map<String,Object>>();
		
		for(Map<String, Object> lists : list){
			String campaignName = lists.get("campaignName").toString();
			String campaignSubject = lists.get("campaignSubject").toString();
			String campaignImg = lists.get("campaignImg").toString();
			int campaignDueDate = Integer.valueOf(lists.get("campaignDueDate").toString());
			
			Map<String, Object> map = new HashMap<String, Object>();
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
	
}

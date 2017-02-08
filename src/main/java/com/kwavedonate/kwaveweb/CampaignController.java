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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kwavedonate.kwaveweb.campaign.service.CampaignService;
import com.kwavedonate.kwaveweb.campaign.vo.CampaignVo;
import com.kwavedonate.kwaveweb.campaign.vo.RewardsVo;

@Controller
@RequestMapping(value="/campaigns")
public class CampaignController {

	private static final Logger logger = LoggerFactory.getLogger(CampaignController.class);
	
	@Resource(name="campaignService")
	private CampaignService campaignService;
	
	@RequestMapping(value="")
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
	
	@RequestMapping(value="/{campaignName}")
	public String CampaignsDetail(@PathVariable("campaignName") String campaignName, Model model){
		System.out.println(campaignName);
		CampaignVo campaignDetail = campaignService.getCampaignDetail(campaignName);
		
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
	
	@RequestMapping(value="/{campaignName}/reward")
	public String rewardView(@PathVariable("campaignName") String campaignName, Model model){
		List<RewardsVo> rewardsDetail = campaignService.getRewardsDetail(campaignName);
		model.addAttribute("rewards", rewardsDetail);
		return "empty/rewards";
	}
	
}

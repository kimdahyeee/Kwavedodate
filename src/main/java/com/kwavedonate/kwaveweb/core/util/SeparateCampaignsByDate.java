package com.kwavedonate.kwaveweb.core.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class SeparateCampaignsByDate {
	
	public List<Map<String, Object>> allCamapaignList;
	public List<Map<String, Object>> beforeCamapaignList;
	public List<Map<String, Object>> currentCampaignList;
	public List<Map<String, Object>> closedCamapaignList;
	
	public SeparateCampaignsByDate(List<Map<String, Object>> allCamapaignList) {
		this.allCamapaignList = allCamapaignList;
		beforeCamapaignList = new ArrayList<Map<String,Object>>();
		currentCampaignList = new ArrayList<Map<String,Object>>();
		closedCamapaignList = new ArrayList<Map<String,Object>>();
	}
	
	public void separate() {
		for(Map<String, Object> lists : allCamapaignList){
			int dueDate = (Integer) lists.get("dueDate");
			int launchDate = (Integer) lists.get("launchDate");
			
			if(dueDate < 0 && launchDate < 0){
				//진행전
				beforeCamapaignList.add(lists);
			}else if(dueDate <=0 && launchDate >=0){
				//진행중
				currentCampaignList.add(lists);
			}else{
				//종료
				closedCamapaignList.add(lists);
			}
		}
	}
}

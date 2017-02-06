package com.kwavedonate.kwaveweb.campaign.service;

import java.util.List;
import java.util.Map;

import com.kwavedonate.kwaveweb.campaign.vo.CampaignVo;

public interface CampaignService {
	public List<Map<String, Object>> getMainCampaign();
	public List<Map<String, Object>> getCampaignsList();
	public CampaignVo getCampaignDetail(String campaignName);
}

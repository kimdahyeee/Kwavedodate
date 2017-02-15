package com.kwavedonate.kwaveweb.campaign.service;

import java.util.List;
import java.util.Map;

import com.kwavedonate.kwaveweb.campaign.vo.CampaignVo;
import com.kwavedonate.kwaveweb.campaign.vo.RewardsVo;

public interface CampaignService {
	public List<Map<String, Object>> getMainCampaignsList();
	public List<Map<String, Object>> getAllCampaignsList();
	public CampaignVo getCampaignDetail(String campaignName);
	public List<RewardsVo> getAllRewards(String campaignName);
	public Map<String, Object> getRewards(Map<String, Object> param);
}

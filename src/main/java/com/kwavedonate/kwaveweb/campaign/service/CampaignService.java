package com.kwavedonate.kwaveweb.campaign.service;

import java.util.List;
import java.util.Map;

import com.kwavedonate.kwaveweb.campaign.vo.CampaignVo;
import com.kwavedonate.kwaveweb.campaign.vo.RewardsVo;

public interface CampaignService {
	public List<Map<String, Object>> getMainCampaignsList(Map<String, Object> map);
	public List<Map<String, Object>> getAllCampaignsList(Map<String, Object> map);
	public CampaignVo getCampaignDetail(Map<String, Object> map);
	public List<RewardsVo> getAllRewards(Map<String, Object> map);
	public Map<String, Object> getRewards(Map<String, Object> param);
}

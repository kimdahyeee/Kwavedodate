package com.kwavedonate.kwaveweb.campaign.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kwavedonate.kwaveweb.campaign.vo.CampaignVo;
import com.kwavedonate.kwaveweb.campaign.vo.RewardsVo;

@Service("campaignService")
public class CampaignServiceImpl implements CampaignService{
	
	@Resource(name="campaignMapper")
	private CampaignMapper campaignMapper;
	
	@Override
	public List<Map<String, Object>> getMainCampaign() {		
		return campaignMapper.selectMainCampaign();
	}

	@Override
	public List<Map<String, Object>> getCampaignsList() {
		return campaignMapper.selectCampaigns();
	}

	@Override
	public CampaignVo getCampaignDetail(String campaignName) {
		return campaignMapper.detailCampaigns(campaignName);
	}

	@Override
	public List<RewardsVo> getRewardsDetail(String campaignName) {
		return campaignMapper.detailRewards(campaignName);
	}
	
	@Override
	public Map<String, Object> getRewards(String campaignName, String rewardNum) {
		return campaignMapper.selectRewards(campaignName, rewardNum);
	}
}

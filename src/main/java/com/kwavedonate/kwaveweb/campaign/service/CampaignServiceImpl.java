package com.kwavedonate.kwaveweb.campaign.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kwavedonate.kwaveweb.campaign.vo.CampaignVo;

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

}

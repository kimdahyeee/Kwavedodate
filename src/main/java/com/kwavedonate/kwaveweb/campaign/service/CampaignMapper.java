package com.kwavedonate.kwaveweb.campaign.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.kwavedonate.kwaveweb.campaign.vo.CampaignVo;
import com.kwavedonate.kwaveweb.campaign.vo.RewardsVo;

public interface CampaignMapper {
	List<Map<String, Object>> selectMainCampaign();
	List<Map<String, Object>> selectCampaigns();
	CampaignVo detailCampaigns(@Param("campaignName") String campaignName);
	List<RewardsVo> detailRewards(@Param("campaignName") String campaignName);
}

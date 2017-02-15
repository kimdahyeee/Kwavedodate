package com.kwavedonate.kwaveweb.campaign.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;

import com.kwavedonate.kwaveweb.campaign.vo.CampaignVo;
import com.kwavedonate.kwaveweb.campaign.vo.RewardsVo;

@Service("campaignService")
public class CampaignServiceImpl extends SqlSessionDaoSupport implements CampaignService{
	
	@Override
	public List<Map<String, Object>> getMainCampaign() {		
		return getSqlSession().selectList("campaign.selectMainCampaign");
	}

	@Override
	public List<Map<String, Object>> getCampaignsList() {
		return getSqlSession().selectList("campaign.selectCampaigns");
	}

	@Override
	public CampaignVo getCampaignDetail(String campaignName) {
		return getSqlSession().selectOne("campaign.detailCampaigns", campaignName);
	}

	@Override
	public List<RewardsVo> getRewardsDetail(String campaignName) {
		return getSqlSession().selectList("campaign.detailRewards", campaignName);
	}
	
	@Override
	public Map<String, Object> getRewards(Map<String, Object> param) {
		return getSqlSession().selectOne("campaign.selectRewards", param);
	}
}

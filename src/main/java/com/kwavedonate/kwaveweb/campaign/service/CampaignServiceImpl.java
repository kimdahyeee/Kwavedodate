package com.kwavedonate.kwaveweb.campaign.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;

import com.kwavedonate.kwaveweb.campaign.vo.CampaignVo;
import com.kwavedonate.kwaveweb.campaign.vo.RewardsVo;

@Service("campaignService")
public class CampaignServiceImpl extends SqlSessionDaoSupport implements CampaignService{
	
	@Override
	public List<Map<String, Object>> getAllCampaignsList() {
		return getSqlSession().selectList("campaign.selectAllCampaignsList");
	}

	@Override
	public List<Map<String, Object>> getMainCampaignsList() {		
		return getSqlSession().selectList("campaign.selectMainCampaign");
	}

	@Override
	public CampaignVo getCampaignDetail(String campaignName) {
		return getSqlSession().selectOne("campaign.detailCampaigns", campaignName);
	}

	@Override
	public List<RewardsVo> getAllRewards(String campaignName) {
		return getSqlSession().selectList("campaign.selectAllRewards", campaignName);
	}
	
	@Override
	public Map<String, Object> getRewards(Map<String, Object> param) {
		return getSqlSession().selectOne("campaign.selectRewards", param);
	}
}

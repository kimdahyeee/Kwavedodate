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
	public List<Map<String, Object>> getAllCampaignsList(Map<String, Object> map) {
		return getSqlSession().selectList("campaign.selectAllCampaignsList", map);
	}

	@Override
	public List<Map<String, Object>> getMainCampaignsList(Map<String, Object> map) {		
		return getSqlSession().selectList("campaign.selectMainCampaign", map);
	}

	@Override
	public CampaignVo getCampaignDetail(Map<String, Object> map) {
		return getSqlSession().selectOne("campaign.detailCampaigns", map);
	}

	@Override
	public List<RewardsVo> getAllRewards(Map<String, Object> map) {
		return getSqlSession().selectList("campaign.selectAllRewards", map);
	}
	
	@Override
	public Map<String, Object> getRewards(Map<String, Object> param) {
		return getSqlSession().selectOne("campaign.selectRewards", param);
	}
}

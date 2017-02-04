package com.kwavedonate.kwaveweb.campaign.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("campaignService")
public class CampaignServiceImpl implements CampaignService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Resource(name="campaignMapper")
	private CampaignMapper campaignMapper;
	
	@Override
	public List<Map<String, Object>> getMainCampaign() {		
		return campaignMapper.selectMainCampaign();
	}

}

package com.kwavedonate.kwaveweb.admin.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;


@Service("adminService")
public class AdminServiceImpl extends SqlSessionDaoSupport implements AdminService{

	@Override
	public List<Map<String, Object>> getAllUserList() {
		return getSqlSession().selectList("admin.selectAllUser");
	}

	@Override
	public Map<String, Object> getUserDetails(String userEmail) {
		return getSqlSession().selectOne("admin.selectUserDetail", userEmail);
	}

	@Override
	public List<Map<String, Object>> getDonateList(String userEmail) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("admin.selectDonateList", userEmail);
	}

	@Override
	public Map<String, Object> getDeliveryDetail(Map<String, Object> map) {
		return getSqlSession().selectOne("admin.selectDeliveryDetail", map);
	}

	@Override
	public Map<String, Object> getPaymentInfo(String imp_uid) {
		return getSqlSession().selectOne("admin.selectPaymentInfo", imp_uid);
	}

	@Override
	public List<Map<String, Object>> getCampaignsList() {
		return getSqlSession().selectList("admin.selectCampaignsList");
	}

	@Override
	public Map<String, Object> getCampaignDetail(String campaignName) {
		return getSqlSession().selectOne("admin.selectCampaignDetail", campaignName);
	}

	@Override
	public Map<String, Object> getMulLanguageRewardDetail(Map<String, Object> map) {
		return getSqlSession().selectOne("admin.selectMulLanguageRewardDetail", map);
	}

}

package com.kwavedonate.kwaveweb.admin.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;

import com.kwavedonate.kwaveweb.campaign.vo.RewardCommonVo;


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

	@Override
	public int insertReward(Map<String, Object> map) {
		try  {
			getSqlSession().insert("admin.insertReward", map);
			map.put("idx", map.get("idx"));
			getSqlSession().insert("admin.insertMulLanguageReward", map);
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public RewardCommonVo getRewardCommonDetail(int rewardNum) {
		return getSqlSession().selectOne("admin.selectCommonRewardDetail", rewardNum);
	}

	@Override
	public int updateRewardCommonDetail(Map<String, Object> map) {
		System.out.println("rewardNum In AdminServiceImpl" + map.get("rewardNum"));
		return getSqlSession().update("admin.updateRewardCommonDetail", map);
	}

	@Override
	public Map<String, Object> getRewardChildDetail(Map<String, Object> map) {
		return  getSqlSession().selectOne("admin.selectChildRewardDetail", map);
	}

	@Override
	public int updateRewardChildDetail(Map<String, Object> map) {
		return getSqlSession().update("admin.updateRewardChildDetail", map);
	}
	
	public int insertCampaign(Map<String, Object> map) {
		try  {
			getSqlSession().insert("admin.insertCampaign", map);
			getSqlSession().insert("admin.insertMulLanguageCampaign", map);
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int deleteCampaign(String campaignName) {
		return getSqlSession().delete("admin.deleteCampaign", campaignName);
	}

	@Override
	public int deleteReward(String rewardNum) {
		return getSqlSession().delete("admin.deleteReward", rewardNum);
	}

	
}

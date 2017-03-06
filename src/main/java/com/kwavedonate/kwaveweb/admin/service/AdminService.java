package com.kwavedonate.kwaveweb.admin.service;

import java.util.List;
import java.util.Map;

import com.kwavedonate.kwaveweb.campaign.vo.RewardCommonVo;

public interface AdminService {
	public List<Map<String, Object>> getAllUserList();
	public Map<String, Object> getUserDetails(String userEmail);
	public List<Map<String, Object>> getDonateList(String userEmail);
	public Map<String, Object> getDeliveryDetail(Map<String, Object> map);
	public Map<String, Object> getPaymentInfo(String imp_uid);
	public List<Map<String, Object>> getCampaignsList();
	public Map<String, Object> getCampaignDetail(String campaignName);
	public Map<String, Object> getMulLanguageRewardDetail(Map<String, Object> map);
	public int insertReward(Map<String, Object> map);

	public RewardCommonVo getRewardCommonDetail(int rewardNum);
	public int updateRewardCommonDetail(Map<String, Object> map);
	public Map<String, Object> getRewardChildDetail(Map<String, Object> map);
	public int updateRewardChildDetail(Map<String, Object> map);
	public int insertCampaign(Map<String, Object> map);
	public int deleteCampaign(String campaignName);
	public int deleteReward(String rewardNum);
}

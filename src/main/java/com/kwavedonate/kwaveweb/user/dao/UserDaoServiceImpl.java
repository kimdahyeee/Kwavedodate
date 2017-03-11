package com.kwavedonate.kwaveweb.user.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userDaoService")
public class UserDaoServiceImpl extends SqlSessionDaoSupport implements UserDaoService {

	@Override
	public int insertFacebookUser(Map<String, Object> paramMap) {
		return getSqlSession().insert("user.insertFacebookUser", paramMap);
	}
	
	@Override
	public Map<String, Object> selectIsSns(String userEmail) {
		return getSqlSession().selectOne("user.selectIsSns", userEmail);
	}

	@Override
	@Transactional
	public int insertUser(Map<String, String> paramMap) {
		return getSqlSession().insert("user.insertUser", paramMap);
	}
	
	@Override
	@Transactional
	public int insertDelivery(Map<String, Object> paramMap) {
		return getSqlSession().insert("user.insertDelivery", paramMap);
	}
	
	@Override
	@Transactional
	public int insertPayments(Map<String, Object> paramMap) {
		return getSqlSession().insert("user.insertPayments", paramMap);
	}

	@Override
	public Map<String, Object> selectUser(String username) {
		return getSqlSession().selectOne("user.selectUser", username);
	}

	@Override
	public Map<String, Object> selectUserAccount(String username) {
		return getSqlSession().selectOne("user.selectUserAccount", username);
	}
	
	@Override
	public Map<String, Object> selectPassword(String userEmail) {
		return getSqlSession().selectOne("user.selectPassword", userEmail);
	}
	
	@Override
	public Map<String, Object> selectEmail(String userEmail) {
		return getSqlSession().selectOne("user.selectEmail", userEmail);
	}

	@Override
	public int modifyUser(Map<String, String> paramMap) {
		return getSqlSession().update("user.modifyUser", paramMap);
	}

	@Override
	public int modifyAddress(Map<String, String> paramMap) {
		return getSqlSession().update("user.modifyAddress", paramMap);
	}
	
	@Override
	public int modifyPassword(Map<String, String> paramMap) {
		return getSqlSession().update("user.modifyPassword", paramMap);
	}
	
	@Override
	public int updateCampaignsByPayment(Map<String, Object> paramMap) {
		return getSqlSession().update("user.updateCampaignsByPayment", paramMap);
	}
	
	@Override
	public int updateRewardsByPayment(Map<String, Object> paramMap) {
		return getSqlSession().update("user.updateRewardsByPayment", paramMap);
	}

	@Override
	public List<Map<String, Object>> selectHistoryList(Map<String, Object> map) {
		return getSqlSession().selectList("user.selectHistoryList", map);
	}

	@Override
	public int deletePayments(String imp_uid) {
		return getSqlSession().delete("user.deletePayment", imp_uid);
	}

	@Override
	public int deleteDelivery(String imp_uid) {
		return getSqlSession().delete("user.deleteDelivery", imp_uid);
	}

	@Override
	public int updateRewardsByPaymentPlus(String rewardNum) {
		return getSqlSession().update("user.updateRewardsByPaymentPlus", rewardNum);
	}

	@Override
	public int updateCampaignsByPaymentMinus(String imp_uid) {
		return getSqlSession().update("user.updateCampaignsByPaymentMinus", imp_uid);
	}

	@Override
	public Map<String, Object> selectCompletePaymentInfo(Map<String, Object> map) {
		return getSqlSession().selectOne("user.selectCompletePaymentInfo", map);
	}
	
	
}

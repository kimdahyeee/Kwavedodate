package com.kwavedonate.kwaveweb.admin.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;

import com.kwavedonate.kwaveweb.user.vo.UserDetailsVo;


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
	
	
	
}

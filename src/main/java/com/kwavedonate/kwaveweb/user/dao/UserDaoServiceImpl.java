package com.kwavedonate.kwaveweb.user.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userDaoService")
public class UserDaoServiceImpl extends SqlSessionDaoSupport implements UserDaoService {

	@Override
	@Transactional
	public int insertUser(Map<String, String> paramMap) {
		// TODO Auto-generated method stub
		return getSqlSession().insert("user.insertUser", paramMap);
	}

	@Override
	public Map<String, Object> selectUser(String username) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("user.selectUser", username);
	}

	@Override
	public Map<String, Object> selectUserAccount(String username) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("user.selectUserAccount", username);
	}
	
	@Override
	public Map<String, Object> selectPassword(String userEmail) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("user.selectPassword", userEmail);
	}
	
	@Override
	public Map<String, Object> selectEmail(String userEmail) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("user.selectEmail", userEmail);
	}

	@Override
	public int modifyUser(Map<String, String> paramMap) {
		// TODO Auto-generated method stub
		return getSqlSession().update("user.modifyUser", paramMap);
	}

	@Override
	public int modifyAddress(Map<String, String> paramMap) {
		// TODO Auto-generated method stub
		return getSqlSession().update("user.modifyAddress", paramMap);
	}
	
	@Override
	public int modifyPassword(Map<String, String> paramMap) {
		// TODO Auto-generated method stub
		return getSqlSession().update("user.modifyPassword", paramMap);
	}

}

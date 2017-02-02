package com.kwavedonate.kwaveweb.user.dao;

import java.util.Map;

public interface UserDaoService {
	
	public int insertUser(Map<String, String> paramMap);
	
	public Map<String, Object> selectUser(String username);
	
	public int modifyUser(Map<String, String> paramMap);
	
	public int modifyAddress(Map<String, String> paramMap);
	
	public Map<String, Object> selectUserAccount(String username);
	
}

package com.kwavedonate.kwaveweb.user.dao;

import java.util.Map;

public interface UserDaoService {

	public int insertUser(Map<String, String> paramMap);

	public Map<String, Object> selectUser(String username);
	
	public Map<String, Object> selectUserAccount(String username);
	
	public Map<String, Object> selectPassword(String userEmail);
	
	public Map<String, Object> selectEmail(String userEmail);

	public int modifyUser(Map<String, String> paramMap);

	public int modifyAddress(Map<String, String> paramMap);

	public int modifyPassword(Map<String, String> paramMap);
	
}

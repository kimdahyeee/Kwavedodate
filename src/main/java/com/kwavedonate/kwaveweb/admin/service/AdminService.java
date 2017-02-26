package com.kwavedonate.kwaveweb.admin.service;

import java.util.List;
import java.util.Map;

import com.kwavedonate.kwaveweb.user.vo.UserDetailsVo;

public interface AdminService {
	public List<Map<String, Object>> getAllUserList();
	public Map<String, Object> getUserDetails(String userEmail);
	public List<Map<String, Object>> getDonateList(String userEmail);
	public Map<String, Object> getDeliveryDetail(Map<String, Object> map);
}

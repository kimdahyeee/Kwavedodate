package com.kwavedonate.kwaveweb.user.service;

import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;


public class UserLoginSuccessHandler implements AuthenticationSuccessHandler {



	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication a)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		ObjectMapper om = new ObjectMapper(); 
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("KEY", "SUCCESS"); 
		map.put("RETURNURI", getReturnUrl(request, response));
		String jsonString = om.writeValueAsString(map); 
		OutputStream out = response.getOutputStream(); 
		out.write(jsonString.getBytes());
	}
	
	/** 
	 * 이전 페이지로 이동
	 * @param request 
	 * @param response 
	 * @return 
	 * */ 
	private String getReturnUrl(HttpServletRequest request, HttpServletResponse response) { 
		RequestCache requestCache = new HttpSessionRequestCache(); 
		SavedRequest savedRequest = requestCache.getRequest(request, response); 
		if (savedRequest == null) { 
			return request.getSession().getServletContext().getContextPath(); 
		} 
		return savedRequest.getRedirectUrl(); 
	}
}


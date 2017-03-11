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

import com.kwavedonate.kwaveweb.user.vo.UserDetailsVo;


public class UserLoginSuccessHandler implements AuthenticationSuccessHandler {



	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		UserDetailsVo userdetails = (UserDetailsVo) auth.getPrincipal();
		ObjectMapper om = new ObjectMapper(); 
		String userauth = userdetails.getAuthorities().toString();
		Map<String, Object> map = new HashMap<String, Object>(); 
		System.out.println(userauth);
		if(userauth.equals("[ROLE_ADMIN]") || userauth.equals("[ROLE_TESTER]")) {
			System.out.println("ROLE_ADMIN, ROLE_TESTER");
			map.put("KEY","SUCCESS_ADMIN");
			map.put("RETURNURI", "/admin/choosePageView");
		} else {
			map.put("KEY", "SUCCESS"); 
			map.put("RETURNURI", getReturnUrl(request, response)+getReturnLang(auth));
		}
		
		
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
	
	private String getReturnLang(Authentication authentication) {
		UserDetailsVo user = (UserDetailsVo) authentication.getPrincipal();
		if(user.getUserNation().equals("KOR")) {
			return "?lang=ko";
		} else if (user.getUserNation().equals("ENG")) {
			return "?lang=en";
		} else {
			return "?lang=ch";
		}
	}
}


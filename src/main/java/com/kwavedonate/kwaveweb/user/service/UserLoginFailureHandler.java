package com.kwavedonate.kwaveweb.user.service;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class UserLoginFailureHandler implements AuthenticationFailureHandler {

	private static final Logger logger = LoggerFactory.getLogger(UserLoginFailureHandler.class);

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {

		ObjectMapper om = new ObjectMapper(); 
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("success", false); map.put("message", exception.getMessage()); 
		// {"success" : false, "message" : "..."} 
		String jsonString = om.writeValueAsString(map); 
		OutputStream out = response.getOutputStream(); 
		out.write(jsonString.getBytes());

	}

}

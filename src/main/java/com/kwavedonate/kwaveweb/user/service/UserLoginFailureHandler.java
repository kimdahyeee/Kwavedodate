package com.kwavedonate.kwaveweb.user.service;

import java.io.IOException;
import java.io.OutputStream;
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
	 public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception)
	   throws IOException, ServletException {
		 
		 ObjectMapper om = new ObjectMapper();
		 
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("success", false);
		 map.put("message", exception.getMessage());
		 
		 String jsonString = om.writeValueAsString(map);
		 
		 OutputStream out = response.getOutputStream();
		 out.write(jsonString.getBytes());
		 
		 System.out.println("로그인 실패");
		 response.sendRedirect("/kwaveweb");
		 
		 
		 /*logger.info(auth.getLocalizedMessage());
		 logger.info(auth.getMessage());
		 for(StackTraceElement s : auth.getStackTrace()){
			 logger.info(s.getClassName());
			 logger.info(s.getFileName());
			 logger.info(s.getMethodName());
			 logger.info(s.getLineNumber()+"");
			 logger.info(s.isNativeMethod()+"");
		 }
		 req.setAttribute("errMsg",auth.getMessage());
		 req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, res);*/
	 }
	  

}

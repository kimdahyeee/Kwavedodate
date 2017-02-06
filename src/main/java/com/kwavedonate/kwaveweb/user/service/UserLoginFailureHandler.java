package com.kwavedonate.kwaveweb.user.service;

import java.io.IOException;
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
		map.put("success", false);
		map.put("message", exception.getMessage());

		String jsonString = om.writeValueAsString(map);

		System.out.println("로그인 실패");
		response.setContentType("text/html;charset=utf-8");
		String message = "잘못된 이메일이거나 잘못된 비밀번호입니다.";
		response.sendRedirect("/kwaveweb/login");
		try {
			PrintWriter out2 = response.getWriter();
			out2.println("<script>alert(" + message + ");</script>");
			out2.flush();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		
		//response.sendRedirect("/kwaveweb");

		/*logger.info(exception.getLocalizedMessage());
		logger.info(exception.getMessage());
		for (StackTraceElement s : exception.getStackTrace()) {
			logger.info(s.getClassName());
			logger.info(s.getFileName());
			logger.info(s.getMethodName());
			logger.info(s.getLineNumber() + "");
			logger.info(s.isNativeMethod() + "");
		}
		request.setAttribute("errMsg", exception.getMessage());
		request.getRequestDispatcher("/kwaveweb").forward(request, response);*/

	}

}

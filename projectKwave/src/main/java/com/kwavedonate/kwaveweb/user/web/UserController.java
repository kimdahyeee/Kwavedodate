package com.kwavedonate.kwaveweb.user.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kwavedonate.kwaveweb.core.util.BcryptEncoder;
import com.kwavedonate.kwaveweb.user.dao.UserDaoService;


@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Resource(name="userDaoService")
	private UserDaoService dao;
	
	@Resource(name="bcryptEncoder")
	BcryptEncoder encoder;
	
	@RequestMapping("/login")
	public String loginPage() {
		return "login";
	}
	
	@RequestMapping("/signin")
	public String signPage() {
		return "signin";
	}
	
	@RequestMapping("/user/denied")
	public String denied(Model model, Authentication auth, HttpServletRequest request) {
		AccessDeniedException ade = (AccessDeniedException) request.getAttribute(WebAttributes.ACCESS_DENIED_403);
		logger.info("ex : {}",ade);
		model.addAttribute("auth", auth);
		model.addAttribute("errMsg", ade);
		
		return "/user/denied";
	}
	
	@RequestMapping(value="/insertUser", method=RequestMethod.POST)
	public String insertUser(@RequestParam("userEmail")String userEmail, @RequestParam("userPassword")String userPassword, @RequestParam("userName")String userName) {
		String dbpw = encoder.encode(userPassword);
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("userEmail", userEmail);
		paramMap.put("userPassword", dbpw);
		paramMap.put("userName", userName);
		int result = dao.insertUser(paramMap);
		logger.info("result ===> {}", result);
		return "/main";
	}
	
	

}

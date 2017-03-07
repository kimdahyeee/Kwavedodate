package com.kwavedonate.kwaveweb;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kwavedonate.kwaveweb.core.util.BcryptEncoder;
import com.kwavedonate.kwaveweb.core.util.GetIpAddress;
import com.kwavedonate.kwaveweb.user.dao.UserDaoService;
import com.kwavedonate.kwaveweb.user.vo.UserDetailsVo;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	private Map<String, Object> emailCheck = new HashMap<String, Object>();
	private int mailCount = 0;

	@Autowired
	private JavaMailSender mailSender;
	
	@Resource(name = "userDaoService")
	private UserDaoService dao;

	@Resource(name = "bcryptEncoder")
	private BcryptEncoder encoder;

	/*
	 * 회원가입 페이지 이동
	 */
	@RequestMapping(value="/signin", method=RequestMethod.GET)
	public String signPage(HttpServletRequest request, HttpSession session, Model model) {
		String webBrowserLocale = GetIpAddress.getClientIP(request);
		logger.info("singin" + webBrowserLocale);
		if(webBrowserLocale.equals("ko")) model.addAttribute("location", "ENG");
		else if (webBrowserLocale.equals("en")) model.addAttribute("location", "KOR");
		else if (webBrowserLocale.equals("ch")) model.addAttribute("location", "CHI");
		else model.addAttribute("location", "KOR");
		
		return "signin";
	}
	
	/*
	 * find password by email
	 */
	@RequestMapping("/findPassword")
	public String findpassword() {
		return "findPassword";
	}
	

	/*
	 * ���� ���� ������
	 */
	@RequestMapping("/myAccount")
	public String myAccount(Model model, HttpServletRequest request, Authentication authentication) {
		Locale currentLocale = LocaleContextHolder.getLocale();
		UserDetailsVo u = (UserDetailsVo) authentication.getPrincipal();
		Map<String, Object> map = new HashMap<String, Object>();

		String userEmail = u.getUsername().toString();
		map.put("userEmail", userEmail);
		map.put("currentLocale", currentLocale);
		Map<String, Object> user = dao.selectUserAccount(userEmail);
		List<Map<String, Object>> historyList = dao.selectHistoryList(map);
		model.addAttribute("user", user);
		model.addAttribute("historyList", historyList);

		return "myAccount";
	}


	/*
	 * 회원가입
	 */
	@ResponseBody
	@RequestMapping(value = "/insertUser", method = RequestMethod.POST)
	public HashMap<String, Object> insertUser(HttpServletRequest request, @RequestParam("userEmail") String userEmail,
			@RequestParam("userPassword") String userPassword, @RequestParam("userName") String userName,
			@RequestParam("location")String location) {
		
		String dbpw = encoder.encode(userPassword);
		
		Map<String, String> paramMap = new HashMap<String, String>();
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		
		paramMap.put("userEmail", userEmail);
		paramMap.put("userPassword", dbpw);
		paramMap.put("userName", userName);
		if(location.equals("KOR")) {
			paramMap.put("userNation", "KOR");
			paramMap.put("authority", "ROLE_USER_KOR");
		} else if(location.equals("ENG")) {
			paramMap.put("userNation", "ENG");
			paramMap.put("authority", "ROLE_USER_ENG");
		} else {
			paramMap.put("userNation", "CHI");
			paramMap.put("authority", "ROLE_USER_CHI");
		}
		int result;

		try {
			result = dao.insertUser(paramMap);
		} catch (Exception e) {
			result = 0;
		}

		if (result == 1) {
			hashmap.put("KEY", "SUCCESS");
		} else {
			hashmap.put("KEY", "FAIL");
		}


		return hashmap;
	}

	/**
	 * �ߺ�Ȯ��
	 */
	@ResponseBody
	@RequestMapping(value="/FacebookValidate", method=RequestMethod.POST)
	public HashMap<String, Object> FacebookValidate(HttpServletRequest request, @RequestParam("userEmail") String userEmail, @RequestParam("userName") String userName) {
		
		String ipc = GetIpAddress.getClientIP(request);
		String dbpw = encoder.encode(userEmail+userName+"1@#$@#!$$$#@");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		
		paramMap.put("userEmail", userEmail);
		paramMap.put("userName", userName);
		paramMap.put("userPassword", dbpw);
		if(ipc.equals("en")) {
			paramMap.put("userNation", "ENG");
		} else if(ipc.equals("ko")) {
			paramMap.put("userNation", "KOR");
		} else {
			paramMap.put("userNation", "CHI");
		}
		int result;

		try {
			//ó�� �����ϴ� ���
			result = dao.insertFacebookUser(paramMap);
		} catch (Exception e) {
			//�̹� ���Ե� ���
			Map<String, Object> snsMap = dao.selectIsSns(userEmail);
			int isSns = Integer.valueOf(snsMap.get("ISSNS").toString());
			if(isSns == 1){
				result = 1; //sns ���Ե� ���
			}else{
				result=0; //�α��� ����
			}
		}

		System.out.println("���Ծȵ�!" + result);
		if (result == 1) {
			hashmap.put("KEY", "SUCCESS"); //ó�� �����ϴ� ���
		}else {
			hashmap.put("KEY", "FAIL");
		}

		return hashmap;
	}
	
	// About You ����
	@ResponseBody
	@RequestMapping(value = "/modifyUser", method = RequestMethod.POST)
	public HashMap<String, Object> modifyUser(@RequestParam("userName") String userName,
			@RequestParam("phone") String phone, @RequestParam("nation") String userNation,
			@RequestParam("userEmail") String userEmail) {
		Map<String, String> paramMap = new HashMap<String, String>();
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		
		paramMap.put("authority", "ROLE_USER_" + userNation);
		paramMap.put("userName", userName);
		paramMap.put("phone", phone);
		paramMap.put("userNation", userNation);
		paramMap.put("userEmail", userEmail);
		int result;

		try {
			result = dao.modifyUser(paramMap);
		} catch (Exception e) {
			result = 0;
			e.printStackTrace();
		}

		if (result == 1) {
			hashmap.put("KEY", "SUCCESS");
		} else {
			hashmap.put("KEY", "FAIL");
		}

		return hashmap;
	}

	// Shipping Address ����
	@ResponseBody
	@RequestMapping(value = "/modifyAddress", method = RequestMethod.POST)
	public HashMap<String, Object> modifyAddress(Authentication authentication,
			@RequestParam("address1") String address1, @RequestParam("address2") String address2,
			@RequestParam("zipCode") String zipCode, @RequestParam("city") String city,
			@RequestParam("country") String country, @RequestParam("region") String region) {
		UserDetailsVo u = (UserDetailsVo) authentication.getPrincipal();
		String userEmail = u.getUsername().toString();
		
		Map<String, String> paramMap = new HashMap<String, String>();
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		paramMap.put("userEmail", userEmail);
		paramMap.put("address1", address1);
		paramMap.put("address2", address2);
		paramMap.put("zipCode", zipCode);
		paramMap.put("city", city);
		paramMap.put("country", country);
		paramMap.put("region", region);
		int result;

		try {
			result = dao.modifyAddress(paramMap);
		} catch (Exception e) {
			result = 0;
			e.printStackTrace();
		}

		if (result == 1) {
			hashmap.put("KEY", "SUCCESS");
		} else {
			hashmap.put("KEY", "FAIL");
		}


		return hashmap;
	}

	// password ����
	@ResponseBody
	@RequestMapping(value="/modifyPassword", method=RequestMethod.POST)
	public HashMap<String, Object> modifyPassword(Authentication authentication,
			@RequestParam("currentPassword") String currentPassword, @RequestParam("newPassword") String newPassword) {
		
		UserDetailsVo u = (UserDetailsVo) authentication.getPrincipal();
		String userEmail = u.getUsername().toString();
		int result = 0;
		Map<String, Object> user = dao.selectPassword(userEmail);
		Map<String, String> password = new HashMap<String, String>();
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		
		boolean check = encoder.matches(currentPassword, user.get("ROWPASSWORD").toString());
		
		System.out.println("TEST password : " + check);
		
		if (check == true) {
			String encodedPassword = encoder.encode(newPassword);
			password.put("userEmail", userEmail);
			password.put("newPassword", encodedPassword);
			try {
				result = dao.modifyPassword(password);
			} catch (Exception e) {
				e.printStackTrace();
				result = 0;
			}

			if (result == 1) {
				hashmap.put("KEY", "SUCCESS");
			} else {
				hashmap.put("KEY", "FAIL");
			}
		} else {
			hashmap.put("KEY", "FAIL");
		}


		return hashmap;
	}

	
	// userEmail
	@ResponseBody
	@RequestMapping(value="/sendLink", method=RequestMethod.POST)
	public Map<String, Object> sendLink (HttpServletResponse response, @RequestParam("userEmail")String userEmail) throws Exception{
		
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		Map<String, Object> userEmailExist = dao.selectEmail(userEmail);
		userEmailExist.putAll(dao.selectIsSns(userEmail));
		
		if (userEmailExist.get("USEREMAIL") != null && userEmailExist.get("ISSNS").toString().equals("0")) {
			
			String mUserEmail = userEmailExist.get("USEREMAIL").toString();
			String encEmail = encoder.encode(mUserEmail + String.valueOf(mailCount));
			
			emailCheck.put("userEmail", mUserEmail);
			emailCheck.put("encoding" + mUserEmail, encEmail);
			
			System.out.println(encEmail);
			String htmlContent = "" 
					+"<h1>KWAVE DONATE 비밀번호 변경 안내 메일입니다.</h1><br/>"
					+ "<h3>아래 링크를 통해 비밀번호 변경 페이지로 이동해주세요.</h3>"
					+ "http://localhost:8181/kwaveweb/pwdService?bep=" + encEmail.toString();
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				
				message.setFrom(new InternetAddress("lewis320@kwavedonate.com"));
				message.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(userEmailExist.get("USEREMAIL").toString()));
				message.setSubject("KWAVE DONATE 비밀번호 변경");
				message.setText(htmlContent, "UTF-8", "html");
				
				mailSender.send(message);
				result.put("KEY", "SUCCESS");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
			}
		} else {
			result.put("KEY", "FAIL");
		}
		return result;
	}

	@RequestMapping(value="/pwdService", method=RequestMethod.GET)
	public String pwdService(HttpServletRequest request, Model model) {

		try {
			String bep = request.getParameter("bep").toString();
			boolean bEmailCheck; 
			bEmailCheck = encoder.matches(emailCheck.get("userEmail").toString() + String.valueOf(mailCount), bep);
			if (bEmailCheck) {
				model.addAttribute("ue", emailCheck.get("userEmail").toString());
				emailCheck.clear();
				mailCount += 1;
				return "pwdService";
			} else {
				return "/errorPage";
			}
		} catch (Exception e) {
			// TODO: handle exception
			return "/errorPage";
		}

	
	}
	
	@ResponseBody
	@RequestMapping(value="/pwdmodifyService", method=RequestMethod.POST)
	public HashMap<String, Object> pwdmodifyService(@RequestParam("userEmail")String userEmail, @RequestParam("userPassword")String userPassword) {
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		String encodedPassword = encoder.encode(userPassword);
		Map<String, String> password = new HashMap<String, String>();
		
		password.put("userEmail", userEmail);
		password.put("newPassword", encodedPassword);
		
		if(dao.modifyPassword(password)==1) {
			hashmap.put("KEY", "SUCCESS");
		} else {
			hashmap.put("KEY", "FAIL");
		}
		return hashmap;
		
	}
}

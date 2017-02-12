package com.kwavedonate.kwaveweb.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kwavedonate.kwaveweb.core.util.BcryptEncoder;
import com.kwavedonate.kwaveweb.core.util.GetIpAddress;
import com.kwavedonate.kwaveweb.user.dao.UserDaoService;
import com.kwavedonate.kwaveweb.user.vo.UserDetailsVO;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	private String check="check";


	@Autowired
	private JavaMailSender mailSender;
	
	@Resource(name = "userDaoService")
	private UserDaoService dao;

	
	@Resource(name = "bcryptEncoder")
	private BcryptEncoder encoder;

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@RequestMapping(value="/signin", method=RequestMethod.GET)
	public String signPage(HttpServletRequest request, HttpSession session, Model model) {
		logger.info("UserController - SignIn");
		
		// IP 확인		
		String ipc = GetIpAddress.getClientIP(request);
		System.out.println("Web browser 정보 : " +ipc);
		
		model.addAttribute("ipAddress", ipc);
		
		return "signin";
	}

	@RequestMapping("/findPassword")
	public String findpassword() {
		return "findPassword";
	}
	
	@RequestMapping("/errorPage") 
	public String errorPage() {
		return "errorPage";
	}

	@RequestMapping("/denied")
	public String denied(Model model, Authentication auth, HttpServletRequest request) {
		AccessDeniedException ade = (AccessDeniedException) request.getAttribute(WebAttributes.ACCESS_DENIED_403);
		logger.info("ex : {}", ade);
		model.addAttribute("auth", auth);
		model.addAttribute("errMsg", ade);

		return "denied";
	}

	// myAccount Controller
	@RequestMapping("/myAccount")
	public String myAccount(Model model, HttpServletRequest request, Authentication authentication) {
		UserDetailsVO u = (UserDetailsVO) authentication.getPrincipal();
		String userEmail = u.getUsername().toString();
		// ModelAndView modelAndView = new ModelAndView();
		Map<String, Object> user = dao.selectUserAccount(userEmail);
		model.addAttribute("username", user.get("USERNAME"));
		model.addAttribute("usernation", user.get("USERNATION"));
		model.addAttribute("phone", user.get("PHONE"));
		model.addAttribute("zipcode", user.get("ZIPCODE"));
		model.addAttribute("address1", user.get("ADDRESS1"));
		model.addAttribute("address2", user.get("ADDRESS2"));
		model.addAttribute("city", user.get("CITY"));
		model.addAttribute("region", user.get("REGION"));
		model.addAttribute("country", user.get("COUNTRY"));

		// modelAndView.setViewName("myAccount");

		return "myAccount";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	// 회원가입
	@ResponseBody
	@RequestMapping(value = "/insertUser", method = RequestMethod.POST)
	public HashMap<String, Object> insertUser(@RequestParam("userEmail") String userEmail,
			@RequestParam("userPassword") String userPassword, @RequestParam("userName") String userName) {
		String dbpw = encoder.encode(userPassword);
		Map<String, String> paramMap = new HashMap<String, String>();
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		paramMap.put("userEmail", userEmail);
		paramMap.put("userPassword", dbpw);
		paramMap.put("userName", userName);
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

		logger.info("insert result ===> {}", result);

		return hashmap;
	}

	// About You 수정
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
			// TODO: handle exception
		}

		if (result == 1) {
			hashmap.put("KEY", "SUCCESS");
		} else {
			hashmap.put("KEY", "FAIL");
		}

		logger.info("modifyUser result ===> {}", result);

		return hashmap;
	}

	// Shipping Address 수정
	@ResponseBody
	@RequestMapping(value = "/modifyAddress", method = RequestMethod.POST)
	public HashMap<String, Object> modifyAddress(Authentication authentication,
			@RequestParam("address1") String address1, @RequestParam("address2") String address2,
			@RequestParam("zipCode") String zipCode, @RequestParam("city") String city,
			@RequestParam("country") String country, @RequestParam("region") String region) {
		UserDetailsVO u = (UserDetailsVO) authentication.getPrincipal();
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
			// TODO: handle exception
		}

		if (result == 1) {
			hashmap.put("KEY", "SUCCESS");
		} else {
			hashmap.put("KEY", "FAIL");
		}

		logger.info("modifyUser result ===> {}", result);

		return hashmap;
	}

	// password 변경
	@ResponseBody
	@RequestMapping(value="/modifyPassword", method=RequestMethod.POST)
	public HashMap<String, Object> modifyPassword(Authentication authentication,
			@RequestParam("currentPassword") String currentPassword, @RequestParam("newPassword") String newPassword) {
		
		UserDetailsVO u = (UserDetailsVO) authentication.getPrincipal();
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
				// TODO: handle exception
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

		logger.info("modifyUser result ===> {}", result);

		return hashmap;
	}
	
	
	// userEmail은 암호화, 복호화를 사용해야함, 현재는 bcrypt암호화 때문에 복호화가 진행되지 않음. 비교만 가능
	@ResponseBody
	@RequestMapping(value="/sendLink", method=RequestMethod.POST)
	public Map<String, Object> sendLink (@RequestParam("userEmail")String userEmail) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> userEmailExist = dao.selectEmail(userEmail);
	
		if (userEmailExist != null) {
			String ue = userEmailExist.get("USEREMAIL").toString();
			String encEmail = encoder.encode(ue);
			
			System.out.println(encEmail);
			String htmlContent = "<h1>아래 주소를 클릭하여 비밀번호를 변경하세요.</h1><br/>"
					+ "<h3>링크에 접속한 후 비밀 번호를 변경하지 않으면 이메일을 다시 전송해야 합니다.</h3>"
					+ "http://localhost:8181/kwaveweb/pwdService?bep=" 
					+ encEmail + "&ue=" + ue;
			try {
				MimeMessage message = mailSender.createMimeMessage();
				
				message.setFrom(new InternetAddress("tantosuperb@gmail.com"));
				message.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(userEmailExist.get("USEREMAIL").toString()));
				message.setSubject("KWAVE DONATE 비밀번호 변경 안내입니다.");
				message.setText(htmlContent, "UTF-8", "html");
				
				mailSender.send(message);
				result.put("KEY", "SUCCESS");
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
		} else {
			result.put("KEY", "FAIL");
		}
	
		
		return result;
	}
	
	
	

	@RequestMapping(value="/pwdService", method=RequestMethod.GET)
	public String pwdService(HttpServletRequest request, Model model) {

		String bep = request.getParameter("bep").toString();
		String ue = request.getParameter("ue").toString();
		
		if (!(check.equals(bep))) {
			model.addAttribute("ue", ue);
			check = bep;
			if(encoder.matches(ue, bep)) {
				return "pwdService";
				
			} else {
				System.out.println("안되네");
				return "/errorPage";
			}
		} else {
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

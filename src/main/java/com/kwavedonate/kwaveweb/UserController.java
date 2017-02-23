package com.kwavedonate.kwaveweb;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.cache.TransactionalCacheManager;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.MyBatisSystemException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.config.TxNamespaceHandler;
import org.springframework.transaction.support.DefaultTransactionDefinition;
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

	@Autowired
	private PlatformTransactionManager transactionManager;
	
	
	private String check="check";
	
	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private JavaMailSender mailSender;
	
	@Resource(name = "userDaoService")
	private UserDaoService dao;

	@Resource(name = "bcryptEncoder")
	private BcryptEncoder encoder;

	/*
	 * 회원가입 페이지
	 */
	@RequestMapping(value="/signin", method=RequestMethod.GET)
	public String signPage(HttpServletRequest request, HttpSession session, Model model) {
		// IP 확인		
		String ipc = GetIpAddress.getClientIP(request);
		System.out.println("Web browser 정보 : " +ipc);
		
		model.addAttribute("ipAddress", ipc);
		
		return "signin";
	}
	
	/*
	 * 비밀번호 찾기 페이지
	 */
	@RequestMapping("/findPassword")
	public String findpassword() {
		return "findPassword";
	}
	
	/*
	 * 에러 페이지
	 */
	@RequestMapping("/errorPage") 
	public String errorPage() {
		return "errorPage";
	}

	/*
	 * 권한 없을 경우 이동하는 페이지
	 */
	@RequestMapping("/denied")
	public String denied(Model model, Authentication auth, HttpServletRequest request) {
		/*AccessDeniedException ade = (AccessDeniedException) request.getAttribute(WebAttributes.ACCESS_DENIED_403);
		model.addAttribute("auth", auth);
		model.addAttribute("errMsg", ade);*/

		return "deniedPage";
	}

	/*
	 * 정보 수정 페이지
	 */
	@RequestMapping("/myAccount")
	public String myAccount(Model model, HttpServletRequest request, Authentication authentication) {
		UserDetailsVO u = (UserDetailsVO) authentication.getPrincipal();
		String userEmail = u.getUsername().toString();
		
		// ModelAndView modelAndView = new ModelAndView();
		Map<String, Object> user = dao.selectUserAccount(userEmail);
		model.addAttribute("user", user);

		return "myAccount";
	}


	/*
	 * 회원 가입 Controller
	 */
	@ResponseBody
	@RequestMapping(value = "/insertUser", method = RequestMethod.POST)
	public HashMap<String, Object> insertUser(HttpServletRequest request, @RequestParam("userEmail") String userEmail,
			@RequestParam("userPassword") String userPassword, @RequestParam("userName") String userName) {
		
		String ipc = GetIpAddress.getClientIP(request);
		String dbpw = encoder.encode(userPassword);
		
		Map<String, String> paramMap = new HashMap<String, String>();
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		
		paramMap.put("userEmail", userEmail);
		paramMap.put("userPassword", dbpw);
		paramMap.put("userName", userName);
		if(ipc.equals("en")) {
			paramMap.put("userNation", "ENG");
		} else if(ipc.equals("ko")) {
			paramMap.put("userNation", "KOR");
		} else {
			paramMap.put("userNation", "CHI");
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
	
	@RequestMapping(value="/facebookLogin", method=RequestMethod.POST)
	public String FacebookLogin(@RequestParam("userEmail") String userEmail, @RequestParam("userName") String userName){
		System.out.println("usermail: " +userEmail);
		System.out.println("username: " +userName);
		
		return "/";
	}
	/*
	 * 결제관련 컨트롤러
	 */
	@ResponseBody
	@RequestMapping(value="insertDeliveryENG", method=RequestMethod.POST)
	public HashMap<String, Object> insertDeliveryENG(
			@RequestParam("imp_uid")String imp_uid, @RequestParam("merchant_uid")String merchant_uid,
			@RequestParam("userEmail")String userEmail,
			@RequestParam("campaignName")String campaignName,
			@RequestParam("rewardNum")String rewardNum,
			@RequestParam("totalAmount")String totalAmount,
			@RequestParam("note")String note,
			@RequestParam("shippingAmount")String shippingAmount,
			@RequestParam("shippingMethod")String shippingMethod,
			@RequestParam("userName")String userName,
			@RequestParam("phone")String phone,
			@RequestParam("address1")String address1,
			@RequestParam("address2")String address2,
			@RequestParam("zipCode")String zipCode,
			@RequestParam("city")String city,
			@RequestParam("country")String country,
			@RequestParam("region")String region ) {
		int resultD = 0, resultP = 0;
		System.out.println("ENG");
		System.out.println(note);
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("imp_uid", imp_uid);
		paramMap.put("userEmail", userEmail);
		paramMap.put("merchant_uid", merchant_uid);
		paramMap.put("campaignName", campaignName);
		paramMap.put("rewardNum", Integer.parseInt(rewardNum));
		paramMap.put("totalAmount", Integer.parseInt(totalAmount));
		paramMap.put("shippingAmount", Integer.parseInt(shippingAmount));
		paramMap.put("shippingMethod", shippingMethod);
		paramMap.put("userName", userName);
		paramMap.put("phone", phone);
		paramMap.put("note", note);
		paramMap.put("address1", address1);
		paramMap.put("address2", address2);
		paramMap.put("zipCode", zipCode);
		paramMap.put("city", city);
		paramMap.put("country", country);
		paramMap.put("region", region);
		
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		
		/*resultD = dao.insertDelivery(paramMap);
		resultP = dao.insertPayments(paramMap);
		if(resultD == 1 && resultP == 1) {
			hashmap.put("KEY", "SUCCESS");
		}*/
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		try {
			resultD = dao.insertDelivery(paramMap);
			resultP = dao.insertPayments(paramMap);
			if(resultD == 1 && resultP == 1) {
				hashmap.put("KEY", "SUCCESS");
			}
		} catch (Exception e) {
			// TODO: handle exception
			transactionManager.rollback(status);
			hashmap.put("KEY", "FAIL");
			e.printStackTrace();
		}
		transactionManager.commit(status);
		
		return hashmap;
	}
	
	@ResponseBody
	@RequestMapping(value="insertDeliveryKOR", method=RequestMethod.POST)
	public HashMap<String, Object> insertDeliveryKOR(
			@RequestParam("imp_uid")String imp_uid, @RequestParam("merchant_uid")String merchant_uid,
			@RequestParam("rewardAmount")String rewardAmount,
			@RequestParam("userEmail")String userEmail,
			@RequestParam("campaignName")String campaignName,
			@RequestParam("rewardNum")String rewardNum,
			@RequestParam("totalAmount")String totalAmount,
			@RequestParam("shippingAmount")String shippingAmount,
			@RequestParam("shippingMethod")String shippingMethod,
			@RequestParam("note")String note,
			@RequestParam("userName")String userName,
			@RequestParam("phone")String phone,
			@RequestParam("address1")String address1,
			@RequestParam("address2")String address2,
			@RequestParam("zipCode")String zipCode ) {
		System.out.println("KOR");
		int resultD = 0, resultP=0;
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("imp_uid", imp_uid);
		paramMap.put("merchant_uid", merchant_uid);
		paramMap.put("userEmail", userEmail);
		paramMap.put("campaignName", campaignName);
		paramMap.put("rewardAmount", Integer.parseInt(rewardAmount));
		paramMap.put("rewardNum", Integer.parseInt(rewardNum));
		paramMap.put("totalAmount", Integer.parseInt(totalAmount));
		paramMap.put("shippingAmount", Integer.parseInt(shippingAmount));
		paramMap.put("shippingMethod", shippingMethod);
		paramMap.put("note", note);
		paramMap.put("userName", userName);
		paramMap.put("phone", phone);
		paramMap.put("address1", address1);
		paramMap.put("address2", address2);
		paramMap.put("zipCode", zipCode);
		
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		try {
			resultD = dao.insertDelivery(paramMap);
			resultP = dao.insertPayments(paramMap);
			dao.updateCampaignsByPayment(paramMap);
			dao.updaterewardsByPayment(paramMap);
			if(resultD == 1 && resultP == 1) {
				hashmap.put("KEY", "SUCCESS");
			}
		} catch (Exception e) {
			// TODO: handle exception
			transactionManager.rollback(status);
			hashmap.put("KEY", "FAIL");
			e.printStackTrace();
		}
		
		return hashmap;
	}

}

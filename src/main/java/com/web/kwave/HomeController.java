package com.web.kwave;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Locale;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
@Configuration
@PropertySource("/resources/database.properties")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * ����ȭ��
	 */
	@RequestMapping(value = "/")
	public String main(Locale locale, Model model) {
		/*IDao dao = sqlSession.getMapper(IDao.class); 
		model.addAttribute("list", dao.listDao());*/
		

		return "main";
	}
	
	/**
	 * �α���
	 */
	@RequestMapping(value = "/login")
	public String login(Locale locale, Model model) {
		return "login";
	}
	
	/**
	 * ��й�ȣã��
	 */
	@RequestMapping(value = "/findpassword")
	public String findPassword(Locale locale, Model model) {
		return "findPassword";
	}
	
	/**
	 * ȸ������
	 */
	@RequestMapping(value = "/signin")
	public String signIn(Locale locale, Model model) {
		return "signin";
	}
	
	/**
	 * �� ����
	 */
	@RequestMapping(value = "/myAccount")
	public String myAccount() {
		return "myAccount";
	}
	
	/**
	 * ȸ��Ұ�
	 */
	@RequestMapping(value = "/aboutUs")
	public String aboutUs() {
		return "aboutUs";
	}
	
	/**
	 * ķ����
	 */
	@RequestMapping(value = "/campaigns")
	public String campaigns() {
		return "campaigns";
	}
	
	/**
	 * ķ���� �󼼺���
	 */
	@RequestMapping(value = "/campaignDetail")
	public String campaignDetail() {
		return "campaignDetail";
	}
	
	/**
	 * ����
	 */
	@RequestMapping(value = "/payment")
	public String payment() {
		return "payment";
	}
	
	/**
	 * ����
	 */
	@RequestMapping(value = "/completePayment")
	public String completePayment() {
		return "completePayment";
	}
	
	/**
	 * ������
	 */
	@RequestMapping(value = "/rewards")
	public String rewards() {
		return "rewards";
	}
	
	/**
	 * �ӽ� ��й�ȣ
	 */
	@RequestMapping(value = "/temporaryPassword")
	public String temporaryPassword() {
		return "temporaryPassword";
	}
}

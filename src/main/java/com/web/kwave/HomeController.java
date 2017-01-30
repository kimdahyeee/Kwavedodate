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
	 * 메인화면
	 */
	@RequestMapping(value = "/")
	public String main(Locale locale, Model model) {
		/*IDao dao = sqlSession.getMapper(IDao.class); 
		model.addAttribute("list", dao.listDao());*/
		

		return "main";
	}
	
	/**
	 * 로그인
	 */
	@RequestMapping(value = "/login")
	public String login(Locale locale, Model model) {
		return "login";
	}
	
	/**
	 * 비밀번호찾기
	 */
	@RequestMapping(value = "/findpassword")
	public String findPassword(Locale locale, Model model) {
		return "findPassword";
	}
	
	/**
	 * 회원가입
	 */
	@RequestMapping(value = "/signin")
	public String signIn(Locale locale, Model model) {
		return "signin";
	}
	
	/**
	 * 내 정보
	 */
	@RequestMapping(value = "/myAccount")
	public String myAccount() {
		return "myAccount";
	}
	
	/**
	 * 회사소개
	 */
	@RequestMapping(value = "/aboutUs")
	public String aboutUs() {
		return "aboutUs";
	}
	
	/**
	 * 캠페인
	 */
	@RequestMapping(value = "/campaigns")
	public String campaigns() {
		return "campaigns";
	}
	
	/**
	 * 캠페인 상세보기
	 */
	@RequestMapping(value = "/campaignDetail")
	public String campaignDetail() {
		return "campaignDetail";
	}
	
	/**
	 * 결제
	 */
	@RequestMapping(value = "/payment")
	public String payment() {
		return "payment";
	}
	
	/**
	 * 결제
	 */
	@RequestMapping(value = "/completePayment")
	public String completePayment() {
		return "completePayment";
	}
	
	/**
	 * 리워드
	 */
	@RequestMapping(value = "/rewards")
	public String rewards() {
		return "rewards";
	}
	
	/**
	 * 임시 비밀번호
	 */
	@RequestMapping(value = "/temporaryPassword")
	public String temporaryPassword() {
		return "temporaryPassword";
	}
}

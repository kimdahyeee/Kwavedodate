package com.web.kwave;

import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.kwave.dao.IDao;

/**
 * Handles requests for the application home page.
 */
@Controller
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
		return "findpassword";
	}
	
	/**
	 * 회원가입
	 */
	@RequestMapping(value = "/signin")
	public String signIn(Locale locale, Model model) {
		return "signin";
	}
}

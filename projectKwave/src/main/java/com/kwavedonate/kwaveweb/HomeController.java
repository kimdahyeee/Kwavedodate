package com.kwavedonate.kwaveweb;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kwavedonate.kwaveweb.core.util.BcryptEncoder;
import com.kwavedonate.kwaveweb.user.vo.UserDetailsVO;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Resource(name="bcryptEncoder")
	private BcryptEncoder encoder;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/")
	public String homeGo() {
		return "main";
	}
	
	@RequestMapping("/main")
	public String maingo() {
		return "main";
	}
	
	
	@RequestMapping(value="/checkAuth", method=RequestMethod.GET)
	@Secured({"ROLE_ADMIN", "ROLE_USER"})
	public String checkAuth(Locale locale, Model model, Authentication auth) {
		UserDetailsVO vo = (UserDetailsVO) auth.getPrincipal();
		logger.info("Welcome checkAuth! Authentication is {}.", auth);
		logger.info("UserDetailsVO == {}.", vo);
		model.addAttribute("auth", auth);
		model.addAttribute("vo", vo);
		return "checkAuth";
	}
/*	
	
	@RequestMapping("/main")
	public String mainPage() {
		return "main";
	}

	@RequestMapping("/signForm")
	public String sign(){
		return "user/signForm";
	}

	@RequestMapping("/user/loginPage")
	public String login() {
		return "/user/loginPage";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.setAttribute("userLoginInfo", null);
		return "redirect:/main";
	}
	
	@RequestMapping(value="/signProcess", method=RequestMethod.POST)
	public String signDone(HttpServletRequest request, Model model) {
		
		if (request.getParameter("userPassword").equals(request.getParameter("userPasswordcheck"))){
			PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			passwordEncoding = new PasswordEncoding(passwordEncoder);
			
			IDao dao = sqlSession.getMapper(IDao.class);
			dao.signDao(request.getParameter("userEmail"), passwordEncoding.encode(request.getParameter("userPassword")), request.getParameter("userName"));
		} else {
			return "redirect:/user/signForm";
		}
		
		return "redirect:/main";
	}
	
	@RequestMapping(value="/loginProcess", method=RequestMethod.POST)
	public String loginComplete(HttpServletRequest request, HttpSession session, Model model) {
		return "redirect:/main";
	}*/
	

	
}

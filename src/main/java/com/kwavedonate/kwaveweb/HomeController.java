package com.kwavedonate.kwaveweb;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
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
	public String main() {
		return "main";
	}
	
	@RequestMapping("/campaigns")
	public String campaigns(Authentication authentication) {
		try {
			UserDetailsVO vo = (UserDetailsVO) authentication.getPrincipal();
			System.out.println(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "campaigns";
	}
	
	@RequestMapping("/aboutUs")
	public String aboutUs(Authentication authentication) {
		try {
			UserDetailsVO vo = (UserDetailsVO) authentication.getPrincipal();
			System.out.println(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return "aboutUs";
	}
	
	
/*	
	
	
	@RequestMapping(value="/checkAuth", method=RequestMethod.GET)
	@Secured({"ROLE_ADMIN", "ROLE_USER"})
	public String checkAuth(Locale locale, Model model, Authentication auth) {
		UserDetailsVO vo = (UserDetailsVO) auth.getPrincipal();
		logger.info("Welcome checkAuth! Authentication is {}.", auth);
		logger.info("UserDetailsVO == {}.", vo);
		model.addAttribute("auth", auth);
		model.addAttribute("vo", vo);
		return "checkAuth";
	}*/
	

	
}

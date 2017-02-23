package com.kwavedonate.kwaveweb;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kwavedonate.kwaveweb.campaign.service.CampaignService;
import com.kwavedonate.kwaveweb.campaign.vo.RewardsVo;
import com.kwavedonate.kwaveweb.user.dao.UserDaoService;
import com.kwavedonate.kwaveweb.user.vo.UserDetailsVO;

@Controller
@RequestMapping(value="/payments")
public class PaymentsController {

	@Resource(name="campaignService")
	private CampaignService campaignService;
	
	@Resource(name = "userDaoService")
	private UserDaoService userService;
	
	/**
	 * enter now �늻瑜� �썑 reward �럹�씠吏�
	 * @param campaignName
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{campaignName}/rewards")
	public String rewardsView(@PathVariable("campaignName") String campaignName, Model model, Locale locale){
		Locale currentLocale = LocaleContextHolder.getLocale();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("campaignName", campaignName);
		map.put("currentLocale", currentLocale);
		List<RewardsVo> rewardsDetail = campaignService.getAllRewards(map);
		model.addAttribute("rewards", rewardsDetail);
		return "rewards";
	}
	
	/**
	 * $10 寃곗젣 �럹�씠吏�
	 * @param campaignName
	 * @return
	 */
	@RequestMapping("/{campaignName}")
	public String paymentsView(@PathVariable("campaignName") String campaignName, Authentication authentication, Model model){
		UserDetailsVO u = (UserDetailsVO) authentication.getPrincipal();
		String userEmail = u.getUsername().toString();
		Map<String, Object> user = userService.selectUserAccount(userEmail);
		model.addAttribute("user", user);
		model.addAttribute("rewardNum", "0");
		
		return "payment";
	}
	
	/**
	 *  reward �꽑�깮 �썑 寃곗젣 �럹�씠吏�
	 * @param campaignName
	 * @param rewardNum
	 * @param authentication
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{campaignName}/reward/{rewardNum}")
	public String pamentsDetailView(@PathVariable("campaignName") String campaignName, @PathVariable("rewardNum") String rewardNum, Authentication authentication, Model model, Locale locale){
		Locale currentLocale = LocaleContextHolder.getLocale();
		UserDetailsVO u = (UserDetailsVO) authentication.getPrincipal();
		String userEmail = u.getUsername().toString();
		Map<String, Object> user = userService.selectUserAccount(userEmail);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentLocale", currentLocale);
		map.put("campaignName", campaignName);
		map.put("rewardNum", rewardNum);
		Map<String, Object> rewardMap = campaignService.getRewards(map);
		
		model.addAttribute("user", user);
		model.addAttribute("campaignName", campaignName);
		model.addAttribute("rewardNum", rewardNum);
		model.addAttribute("reward", rewardMap);
		
		return "payment";
	}
	
	
}

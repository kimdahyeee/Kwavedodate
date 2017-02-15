package com.kwavedonate.kwaveweb;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
	 * enter now 누른 후 reward 페이지
	 * @param campaignName
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{campaignName}/rewards")
	public String rewardsView(@PathVariable("campaignName") String campaignName, Model model){
		List<RewardsVo> rewardsDetail = campaignService.getAllRewards(campaignName);
		model.addAttribute("rewards", rewardsDetail);
		return "rewards";
	}
	
	/**
	 * $10 결제 페이지
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
	 *  reward 선택 후 결제 페이지
	 * @param campaignName
	 * @param rewardNum
	 * @param authentication
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{campaignName}/reward/{rewardNum}")
	public String pamentsDetailView(@PathVariable("campaignName") String campaignName, @PathVariable("rewardNum") String rewardNum, Authentication authentication, Model model){
		UserDetailsVO u = (UserDetailsVO) authentication.getPrincipal();
		String userEmail = u.getUsername().toString();
		Map<String, Object> user = userService.selectUserAccount(userEmail);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("campaignName", campaignName);
		param.put("rewardNum", rewardNum);
		Map<String, Object> rewardMap = campaignService.getRewards(param);
		
		model.addAttribute("user", user);
		model.addAttribute("campaignName", campaignName);
		model.addAttribute("rewardNum", rewardNum);
		model.addAttribute("reward", rewardMap);
		
		return "payment";
	}
	
	
}

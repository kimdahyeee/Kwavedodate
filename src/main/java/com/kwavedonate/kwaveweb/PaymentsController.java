package com.kwavedonate.kwaveweb;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	private UserDaoService userDao;
	/**
	 * enter now������ �� rewardȭ��
	 * @param campaignName
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{campaignName}/rewards")
	public String rewardsView(@PathVariable("campaignName") String campaignName, Model model){
		List<RewardsVo> rewardsDetail = campaignService.getRewardsDetail(campaignName);
		model.addAttribute("rewards", rewardsDetail);
		return "rewards";
	}
	
	/**
	 * reward ���� ���� ȭ��
	 * @param campaignName
	 * @return
	 */
	@RequestMapping("/{campaignName}")
	public String paymentsView(@PathVariable("campaignName") String campaignName, Authentication authentication, Model model){
		UserDetailsVO u = (UserDetailsVO) authentication.getPrincipal();
		String userEmail = u.getUsername().toString();
		Map<String, Object> user = userDao.selectUserAccount(userEmail);
		model.addAttribute("userName", user.get("USERNAME"));
		model.addAttribute("userPhone", user.get("PHONE"));
		model.addAttribute("rewardNum", "0");
		return "payment";
	}
	
	/**
	 * reward���ý� ����ȭ��
	 */
	@RequestMapping(value="/{campaignName}/reward/{rewardNum}")
	public String pamentsDetailView(@PathVariable("campaignName") String campaignName, @PathVariable("rewardNum") String rewardNum, Authentication authentication, Model model){
		UserDetailsVO u = (UserDetailsVO) authentication.getPrincipal();
		String userEmail = u.getUsername().toString();
		Map<String, Object> user = userDao.selectUserAccount(userEmail);
		model.addAttribute("userName", user.get("USERNAME"));
		model.addAttribute("userPhone", user.get("PHONE"));
		model.addAttribute("rewardNum", rewardNum);
		Map<String, Object> rewardMap = campaignService.getRewards(campaignName, rewardNum);
		model.addAttribute("reward", rewardMap);
		return "payment";
	}
}

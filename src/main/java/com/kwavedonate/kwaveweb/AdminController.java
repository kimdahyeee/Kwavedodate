package com.kwavedonate.kwaveweb;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kwavedonate.kwaveweb.admin.service.AdminService;
import com.kwavedonate.kwaveweb.campaign.service.CampaignService;
import com.kwavedonate.kwaveweb.core.util.Sstring;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping(value="admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	private IamportClient iamportClient;
	/**
	 * 관리자 메인 controller
	 * @param
	 * @return
	 */
	@RequestMapping(value="/main")
	public String adminMain(){
		return "admin/mainView";
	}
		
	/**
	 * 유저 관리 목록 controller
	 * @param
	 * @return
	 */
	@RequestMapping(value="/manageUsers")
	public String manageUsers(Model model) {
		List<Map<String, Object>> allUsersList = adminService.getAllUserList();
		model.addAttribute("allUsersList", allUsersList);
		return "admin/manageUsersView";
	}
	
	/**
	 * 유저 상세보기 controller
	 * @param
	 * @return
	 */
	@RequestMapping(value="/userDetail", method=RequestMethod.GET)
	public String userDetail(@RequestParam(value="userEmail") String userEmail, Model model) {
		Map<String, Object> userDetail = adminService.getUserDetails(userEmail);
		List<Map<String, Object>> donateList = adminService.getDonateList(userEmail);
		model.addAttribute("userDetail", userDetail);
		model.addAttribute("donateList", donateList);
		return "admin/userDetailView";
	}
	
	/**
	 * 캠페인 관리 목록 controller
	 * @param
	 * @return
	 */
	@RequestMapping(value="/manageCampaigns")
	public String manageCampaigns(Model model) {
		List<Map<String, Object>> allCamapaignsList = adminService.getCampaignsList();
		List<Map<String, Object>> beforeCamapaignsList = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> currentCampaignsList = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> closedCamapaignsList = new ArrayList<Map<String,Object>>();
		
		for(Map<String, Object> lists : allCamapaignsList){
			int dueDate = (Integer) lists.get("dueDate");
			int launchDate = (Integer) lists.get("launchDate");
			
			if(dueDate < 0 && launchDate < 0){
				//진행전
				beforeCamapaignsList.add(lists);
			}else if(dueDate <=0 & launchDate >=0){
				//진행중
				currentCampaignsList.add(lists);
			}else{
				//종료
				closedCamapaignsList.add(lists);
			}
		}
		model.addAttribute("beforeCamapaignsList", beforeCamapaignsList);
		model.addAttribute("currentCampaignsList", currentCampaignsList);
		model.addAttribute("closedCamapaignsList", closedCamapaignsList);
		return "admin/manageCampaignsView";
	}
	
	/**
	 * 캠페인 상세 보기 controller
	 * @param
	 * @return
	 */
	@RequestMapping(value="/campaignDetail/{campaignName}")
	public String campaignDetail(@PathVariable("campaignName") String campaignName, Model model) {
		Map<String, Object> campaignDetail = adminService.getCampaignDetail(campaignName);
		int sysToLaunchDate = (Integer)campaignDetail.get("sysToLaunchDate");
		int sysToDueDate = (Integer)campaignDetail.get("sysToDueDate");
		if(sysToDueDate < 0 && sysToLaunchDate < 0){
			//진행전
			model.addAttribute("leftDays", "진행전");
		}else if(sysToDueDate <=0 & sysToLaunchDate >=0){
			//진행중
			model.addAttribute("leftDays", Math.abs(sysToDueDate));
		}else{
			//종료
			model.addAttribute("leftDays", "종료");
		}
		model.addAttribute("campaignDetail", campaignDetail);
		return "admin/campaignDetailView";
	}
	
	/**
	 * 캠페인 별 사용자 목록 controller
	 * @param
	 * @return
	 */
	@RequestMapping(value="/campaignFundingUserList")
	public String campaignFundingUserList() {
		return "admin/campaignFundingUserListView";
	}
	
	/**
	 * 캠페인 추가 view controller
	 * @param
	 * @return
	 */
	@RequestMapping(value="/campaignAdd")
	public String campaignAdd() {
		return "admin/campaignAddView";
	}
	
	/**
	 * 캠페인 공통부분 변경 view controller
	 * @param
	 * @return
	 */
	@RequestMapping(value="/campaignCommonUpdate")
	public String campaignCommonUpdate() {
		return "admin/campaignCommonUpdateView";
	}
	
	/**
	 * 캠페인 한국어 부분 변경 view controller
	 * @param
	 * @return
	 */
	@RequestMapping(value="/campaignKoUpdate")
	public String campaignKoUpdate() {
		return "admin/campaignKoUpdateView";
	}
	
	/**
	 * 캠페인 영어 부분 변경 view controller
	 * @param
	 * @return
	 */
	@RequestMapping(value="/campaignEnUpdate")
	public String campaignEnUpdate() {
		return "admin/campaignEnUpdateView";
	}
	
	/**
	 * 캠페인 중국어 부분 변경 view controller
	 * @param
	 * @return
	 */
	@RequestMapping(value="/campaignChUpdate")
	public String campaignChUpdate() {
		return "admin/campaignChUpdateView";
	}
	
	/**
	 * 결제 내역 상세 보기 controller
	 * @param
	 * @return
	 */
	@RequestMapping(value="/paymentDetail", method=RequestMethod.GET)
	public String paymentDetail(@RequestParam(value="impUid") String impUid, @RequestParam(value="userEmail") String userEmail, Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("imp_uid", impUid);
		param.put("userEmail", userEmail);
		Map<String, Object> deliveryDetail = adminService.getDeliveryDetail(param);
		Map<String, Object> paymentInfo = adminService.getPaymentInfo(impUid);
		
		//iamport 정보
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		iamportClient = new IamportClient(Sstring.REST_API_KEY, Sstring.REST_API_SECRET_KEY);
		IamportResponse<Payment> payment_response = iamportClient.paymentByImpUid(impUid);
		Map<String, Object> paymentDetail = new HashMap<String, Object>();
		paymentDetail.put("imp_uid", impUid);
		paymentDetail.put("imp_pgProvider", payment_response.getResponse().getPgProvider());
		paymentDetail.put("imp_pgTid", payment_response.getResponse().getPgTid());
		paymentDetail.put("imp_applyNum", payment_response.getResponse().getApplyNum());
		paymentDetail.put("imp_cardName", payment_response.getResponse().getCardName());
		paymentDetail.put("imp_cardQuota", payment_response.getResponse().getCardQuota());
		paymentDetail.put("imp_paidAt", dt.format(payment_response.getResponse().getPaidAt()));
		paymentDetail.put("imp_status", payment_response.getResponse().getStatus());
		paymentDetail.put("imp_name", payment_response.getResponse().getName());
		paymentDetail.put("receipt_url", paymentInfo.get("receipt_url"));
		paymentDetail.put("totalAmount", paymentInfo.get("totalAmount"));
		paymentDetail.put("shippingAmount", paymentInfo.get("shippingAmount"));
		
		model.addAttribute("paymentDetail", paymentDetail);
		model.addAttribute("deliveryDetail", deliveryDetail);
		model.addAttribute("userEmail", userEmail);
		return "admin/paymentDetailView";
	}
	
	/**
	 * 리워드 선택 이전 캠페인 선택 controller
	 * @param
	 * @return
	 */
	@RequestMapping(value="/selectCampaignBeforeReward")
	public String selectCampaignBeforeReward() {
		return "admin/selectCampaignBeforeRewardView";
	}
	
	/**
	 * 리워드 관리 목록 controller
	 * @param
	 * @return
	 */
	@RequestMapping(value="/manageRewards")
	public String manageRewards() {
		return "admin/manageRewardsView";
	}
	
	/**
	 * 리워드 상세 보기 controller
	 * @param
	 * @return
	 */
	@RequestMapping(value="/rewardDetail")
	public String rewardDetail() {
		return "admin/rewardDetailView";
	}
	
	/**
	 * 리워드 추가 view controller
	 * @param
	 * @return
	 */
	@RequestMapping(value="/rewardAdd")
	public String rewardAdd() {
		return "admin/rewardAddView";
	}
	
	/**
	 * 리워드 공통 부분 수정 view controller
	 * @param
	 * @return
	 */
	@RequestMapping(value="/rewardCommonUpdate")
	public String rewardCommonUpdate() {
		return "admin/rewardCommonUpdateView";
	}
	
	/**
	 * 리워드 한국어 부분 수정 view controller
	 * @param
	 * @return
	 */
	@RequestMapping(value="/rewardKoUpdate")
	public String rewardKoUpdate() {
		return "admin/rewardKoUpdateView";
	}
	
	/**
	 * 리워드 영어 부분 수정 view controller
	 * @param
	 * @return
	 */
	@RequestMapping(value="/rewardEnUpdate")
	public String rewardEnUpdate() {
		return "admin/rewardEnUpdateView";
	}
	
	/**
	 * 리워드 중국어 부분 수정 view controller
	 * @param
	 * @return
	 */
	@RequestMapping(value="/rewardChUpdate")
	public String rewardChUpdate() {
		return "admin/rewardChUpdateView";
	}
	
	/**
	 * 캠페인 삭제
	 */
	@RequestMapping(value="deleteCampaigns", method=RequestMethod.GET)
	public void deleteCampaign(@RequestParam("campaignName") String campaignName){
		
	}
}

package com.kwavedonate.kwaveweb;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kwavedonate.kwaveweb.admin.service.AdminService;
import com.kwavedonate.kwaveweb.campaign.service.CampaignService;
import com.kwavedonate.kwaveweb.campaign.vo.RewardCommonVo;
import com.kwavedonate.kwaveweb.campaign.vo.RewardsVo;
import com.kwavedonate.kwaveweb.core.util.FileUtils;
import com.kwavedonate.kwaveweb.core.util.SeparateCampaignsByDate;
import com.kwavedonate.kwaveweb.core.util.Sstring;
import com.kwavedonate.kwaveweb.user.vo.UserDetailsVo;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping(value="admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	private static final String contextPath = "http://13.124.5.135:8181/kwaveweb/resources/uploads/";
	
	@Resource(name="adminService")
	private AdminService adminService;

	@Resource(name="campaignService")
	private CampaignService campaignService;
	private IamportClient iamportClient;
	
	
	@RequestMapping(value="/choosePageView")
	public String choosePageView() {
		return "admin/choosePageView";
	}
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
		List<Map<String, Object>> allCamapaignList = adminService.getCampaignsList();
		
		SeparateCampaignsByDate separateCampaignsByDate = new SeparateCampaignsByDate(allCamapaignList);
		separateCampaignsByDate.separate();
		
		model.addAttribute("beforeCamapaignList", separateCampaignsByDate.beforeCamapaignList);
		model.addAttribute("currentCampaignList", separateCampaignsByDate.currentCampaignList);
		model.addAttribute("closedCamapaignList", separateCampaignsByDate.closedCamapaignList);
		
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
	@RequestMapping(value="/campaignDetail/{campaignName}/fundingUserList")
	public String campaignFundingUserList(@PathVariable("campaignName") String campaignName, Model model) {
		List<Map<String, Object>> fundingUserList = adminService.getFundingUserList(campaignName);
		model.addAttribute("campaignName", campaignName);
		model.addAttribute("fundingUserList", fundingUserList);
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
	@RequestMapping(value="/campaignDetail/{campaignName}/campaignCommonDetail")
	public String campaignCommonUpdateView(@PathVariable("campaignName") String campaignName, Model model) {
		Map<String, Object> campaignCommaonDetail = adminService.getCampaignCommonDetail(campaignName);
		model.addAttribute("campaignCommaonDetail", campaignCommaonDetail);
		return "admin/campaignCommonUpdateView";
	}
	
	/**
	 * 캠페인 공통부분 변경
	 * @param map
	 * @param request
	 * @param auth
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateCommonCampaign", method=RequestMethod.POST)
	public HashMap<String, String> updateCommonCampaign(@RequestParam Map<String, Object> map, HttpServletRequest request, Authentication auth){
		HashMap<String, String> responseMap = new HashMap<String, String>();
		UserDetailsVo user = (UserDetailsVo) auth.getPrincipal();
		FileUtils fileUtils = new FileUtils(request);
		Map<String, String> listFile = fileUtils.parseInsertFileInfo();
		
		map.put("campaignImg", contextPath + listFile.get("campaignImgFile"));
		map.put("youtubeImg", contextPath + listFile.get("youtubeImgFile"));
		map.put("campaignRegister", user.getUsername().toString());
		
		if(adminService.updateCampaignCommonDetail(map) == 1){
			responseMap.put("KEY", "SUCCESS");
		}else{
			responseMap.put("KEY", "FAIL");
		}
		return responseMap;
	}
	
	/**
	 * 캠페인  자식 테이블 부분(언어) 수정  View
	 * @param
	 * @return
	 */
	@RequestMapping(value="/campaignDetail/{campaignName}/campaign{locale}Detail")
	public String campaignUpdateView(@PathVariable("campaignName") String campaignName, @PathVariable("locale") String locale, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("locale", locale);
		map.put("campaignName", campaignName);
		
		model.addAttribute("campaignChildDetail", adminService.getCampaignChildDetail(map));
		model.addAttribute("locale", locale);
		return "admin/campaignChildUpdateView";
	}
	
	/**
	 * 캠페인 자식(언어별) 수정
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateChildCampaign", method=RequestMethod.POST)
	public HashMap<String, String> updateChildCampaign(@RequestParam Map<String, Object> map){
		HashMap<String, String> responseMap = new HashMap<String, String>();
		if(adminService.updateCampaignChild(map) == 1){
			responseMap.put("KEY", "SUCCESS");
		}else{
			responseMap.put("KEY", "FAIL");
		}
		return responseMap;
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
		paymentDetail.put("rewardNum", paymentInfo.get("rewardNum"));
		
		model.addAttribute("paymentDetail", paymentDetail);
		model.addAttribute("deliveryDetail", deliveryDetail);
		model.addAttribute("userEmail", userEmail);
		
		return "admin/paymentDetailView";
	}
	
	/**
	 * 리워드 선택 이전 캠페인 선택 controller
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/selectCampaignBeforeReward")
	public String selectCampaignBeforeReward(Model model) {
		List<Map<String, Object>> allCamapaignList = adminService.getCampaignsList();
		SeparateCampaignsByDate separateCampaignsByDate = new SeparateCampaignsByDate(allCamapaignList);
		separateCampaignsByDate.separate();
		model.addAttribute("beforeCamapaignList", separateCampaignsByDate.beforeCamapaignList);
		model.addAttribute("currentCampaignList", separateCampaignsByDate.currentCampaignList);
		model.addAttribute("closedCamapaignList", separateCampaignsByDate.closedCamapaignList);
		
		return "admin/selectCampaignBeforeRewardView";
	}
	
	/**
	 * 리워드 관리 목록
	 * @param campaignName
	 * @param model
	 * @return
	 */
	@RequestMapping(value="{campaignName}/manageRewards")
	public String manageRewards(@PathVariable("campaignName") String campaignName, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("campaignName", campaignName); map.put("currentLocale", "Ko");

		List<RewardsVo> rewardsDetail = campaignService.getAllRewards(map);
		model.addAttribute("rewards", rewardsDetail);
		model.addAttribute("campaignName", campaignName);

		return "admin/manageRewardsView";
	}
	
	/**
	 * 리워드 상세 보기
	 * @param pathVariables
	 * @param model
	 * @return
	 */
	@RequestMapping(value="{campaignName}/manageRewards/{rewardNum}")
	public String rewardDetail(@PathVariable Map<String, Object> pathVariables, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("campaignName", (String)pathVariables.get("campaignName"));
		map.put("rewardNum", Integer.valueOf((String)pathVariables.get("rewardNum")));
		System.out.println("rewardNum: " + Integer.valueOf((String)pathVariables.get("rewardNum")));
		
		Map<String, Object> rewardDetail = adminService.getMulLanguageRewardDetail(map);
		model.addAttribute("reward", rewardDetail);
		
		return "admin/rewardDetailView";
	}
	
	/**
	 * 리워드 추가 view controller
	 * @param campaignName
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{campaignName}/rewardAdd")
	public String rewardAdd(@PathVariable("campaignName") String campaignName, Model model) {
		model.addAttribute(campaignName);
		return "admin/rewardAddView";
	}

	@ResponseBody
	@RequestMapping(value="/insertReward", method=RequestMethod.POST)
	public HashMap<String, Object> insertReward(HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> map) {
		HashMap<String, Object> responseMap = new HashMap<String, Object>(); int result;
		FileUtils fileUtils = new FileUtils(httpServletRequest);
		Map<String, String> listFile = fileUtils.parseInsertFileInfo();
		map.put("rewardImg", contextPath + listFile.get("rewardImgFile"));
		
		try { result = adminService.insertReward(map); } 
		catch(Exception e) { result = 0; e.printStackTrace(); }
		
		if (result == 1) { responseMap.put("key", "success"); } 
		else { responseMap.put("key", "fail"); }
		
		return responseMap;
	}

	/**
	 * 캠페인 등록
	 * @param request
	 * @param map
	 * @param auth
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/insertCampaign", method=RequestMethod.POST)
	public HashMap<String, String> insertCampaign(HttpServletRequest request, @RequestParam Map<String, Object> map, Authentication auth){
		HashMap<String, String> responseMap = new HashMap<String, String>();
		UserDetailsVo user = (UserDetailsVo) auth.getPrincipal();
		FileUtils fileUtils = new FileUtils(request);
		Map<String, String> listFile = fileUtils.parseInsertFileInfo();
		System.out.println(listFile.get("campaignImgFile"));
		System.out.println("youtubeImgFile" +listFile.get("youtubeImgFile"));
		
		map.put("campaignImg", contextPath + listFile.get("campaignImgFile"));
		map.put("youtubeImg", contextPath + listFile.get("youtubeImgFile"));
		map.put("campaignRegister", user.getUsername().toString());
		
		int result = adminService.insertCampaign(map);
		System.out.println("result" + result);
		if(result == 1){
			responseMap.put("KEY", "SUCCESS");
		}else{
			responseMap.put("KEY", "FAIL");
		}
		
		return responseMap;
	}

	/**
	 * 리워드 공통 부분 수정 view controller
	 * @param pathVariables
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{campaignName}/rewardCommonUpdate/{rewardNum}")
	public String rewardCommonUpdate(@PathVariable Map<String, Object> pathVariables, Model model) {
		int rewardNum = Integer.valueOf((String)pathVariables.get("rewardNum"));
		RewardCommonVo rewardCommonVo = adminService.getRewardCommonDetail(rewardNum);
		
		model.addAttribute("rewardCommon", rewardCommonVo);
		return "admin/rewardCommonUpdateView";
	}
	
	/**
	 * 리워드 공통 부분 수정 controller
	 * @param httpServletRequest
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateCommonReward", method=RequestMethod.POST)
	public HashMap<String, Object> updateCommonReward(HttpServletRequest httpServletRequest, @RequestParam Map<String, Object> map) {
		HashMap<String, Object> responseMap = new HashMap<String, Object>(); int result;
		FileUtils fileUtils = new FileUtils(httpServletRequest);
		Map<String, String> listFile = fileUtils.parseInsertFileInfo();
		map.put("rewardImg", contextPath + listFile.get("rewardImgFile")); // rewardImg 이름을 저장
		
		try { result = adminService.updateRewardCommonDetail(map); } 
		catch(Exception e) { result = 0; e.printStackTrace(); }
		
		if (result == 1) { responseMap.put("key", "success"); } 
		else { responseMap.put("key", "fail"); }
		
		System.out.println("============================================");
		System.out.println("campaignName: " + map.get("campaignName"));
		System.out.println("rewardNum: " + Integer.valueOf(map.get("rewardNum").toString()));
		System.out.println("rewardAmount: " + Integer.valueOf(map.get("rewardAmount").toString()));
		System.out.println("rewardTotalCnt: " + Integer.valueOf(map.get("rewardTotalCnt").toString()));
		System.out.println("rewardCurrentCnt: " + Integer.valueOf(map.get("rewardCurrentCnt").toString()));
		System.out.println("rewardImg: " + contextPath + listFile.get("rewardImgFile"));
		System.out.println("============================================");
		
		return responseMap;
	}
	
	/**
	 *  리워드 자식 테이블 부분(언어) 수정 view controller
	 * @param pathVariables
	 * @param model
	 * @return
	 */
	@RequestMapping(value="{campaignName}/rewards_{locale}/{rewardNum}")
	public String rewardChildUpdate(@PathVariable Map<String, Object> pathVariables, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("locale", pathVariables.get("locale"));
		map.put("rewardNum", Integer.valueOf(pathVariables.get("rewardNum").toString()));
		
		model.addAttribute("rewardChildDetail", adminService.getRewardChildDetail(map));
		model.addAttribute("campaignName", pathVariables.get("campaignName"));
		model.addAttribute("locale", pathVariables.get("locale"));
	
		return "admin/rewardChildUpdateView";
	}
	
	/**
	 * 리워드 자식 테이블 부분(언어) 수정 controller
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateRewardChild", method=RequestMethod.POST)
	public HashMap<String, Object> updateRewardChild(@RequestParam Map<String, Object> map) {
		HashMap<String, Object> responseMap = new HashMap<String, Object>(); int result;
		System.out.println("locale: " + map.get("locale"));
		System.out.println("rewardSubject: " + map.get("rewardSubject"));
		System.out.println("rewardContents_editor: " + map.get("rewardContents_editor"));
		try { result = adminService.updateRewardChildDetail(map); } 
		catch(Exception e) { result = 0; e.printStackTrace(); }
		
		if (result == 1) { responseMap.put("key", "success"); } 
		else { responseMap.put("key", "fail"); }
		
		return responseMap;
	}
	
	/**
	 * 캠페인 삭제
	 */
	@RequestMapping(value="deleteCampaign", method=RequestMethod.GET)
	public String deleteCampaign(@RequestParam("campaignName") String campaignName){
		adminService.deleteCampaign(campaignName);
		return "redirect:/admin/manageCampaigns";
	}
	
	@RequestMapping(value="{campaignName}/manageRewards/{rewardNum}/deleteReward", method=RequestMethod.GET)
	public String deleteReward(@PathVariable Map<String, String> pathVariables){
		adminService.deleteReward(pathVariables.get("rewardNum"));
		return "redirect:/admin/" + pathVariables.get("campaignName") +"/manageRewards";
	}
	
	@RequestMapping(value="/ckEditorImageUpload", method=RequestMethod.POST)
	public void ckEditorImageUpload(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Model model) throws IOException {
		HashMap<String, String> responseMap = new HashMap<String, String>();
		//PrintWriter printWriter = httpServletResponse.getWriter();
		
		httpServletResponse.setCharacterEncoding("utf-8");
		httpServletResponse.setContentType("text/html;charset=utf-8");
		
		FileUtils fileUtils = new FileUtils(httpServletRequest);
		responseMap = fileUtils.ckEditorImageUpload();
		System.out.println("CKEditorFuncNum: " + responseMap.get("CKEditorFuncNum"));
		System.out.println("storagePath: " + responseMap.get("storagePath"));
//		TODO: 일단 파일이 올라가긴 하는데 이게 경로 문제 때문에 받아오질 못함.. local로 작성을 하게되니까... 
//		서버에 실제로 올린다음에 http:// url로 테스트 해봐야됨		
//		printWriter.println(""
//				+ "<script src='https://cdn.ckeditor.com/4.6.2/standard/ckeditor.js'></script>"
//				+ "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
//                + responseMap.get("CKEditorFuncNum")
//                + ",'"
//                + responseMap.get("storagePath")
//                + "','Success'"
//                + ")</script>");
//        printWriter.flush();
	}
}

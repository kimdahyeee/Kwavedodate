package com.kwavedonate.kwaveweb;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kwavedonate.kwaveweb.admin.service.AdminService;
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
	public String manageCampaigns() {
		return "admin/manageCampaignsView";
	}
	
	/**
	 * 캠페인 상세 보기 controller
	 * @param
	 * @return
	 */
	@RequestMapping(value="/campaignDetail")
	public String campaignDetail() {
		return "admin/campaignDetailView";
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
		return "admin/paymentDetailView";
	}
	
}

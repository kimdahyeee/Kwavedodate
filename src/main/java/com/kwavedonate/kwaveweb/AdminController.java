package com.kwavedonate.kwaveweb;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="admin")
public class AdminController {
	
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
	public String manageUsers() {
		return "admin/manageUsersView";
	}
	
	/**
	 * 유저 상세보기 controller
	 * @param
	 * @return
	 */
	@RequestMapping(value="/userDetail")
	public String userDetail() {
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
	@RequestMapping(value="/paymentDetail")
	public String paymentDetail() {
		return "admin/paymentDetailView";
	}
}

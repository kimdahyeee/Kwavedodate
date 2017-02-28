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
	@RequestMapping(value="/paymentDetail")
	public String paymentDetail() {
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
	
}

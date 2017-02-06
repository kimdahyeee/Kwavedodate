package com.kwavedonate.kwaveweb.campaign.vo;

public class CampaignVo {

	private String campaignName;
	private String campaignSubject;
	private String campaignSummary;
	private String campaignContents;
	private int gatherMount;
	private int fundingUserCount;
	private String launchDate;
	private String dueDate;
	private String youtubeCode;
	private String youtubeImg;
	private String campaignImg;
	private String duedateToSysdate;
	
	public String getDuedateToSysdate() {
		return duedateToSysdate;
	}
	public void setDuedateToSysdate(String duedateToSysdate) {
		this.duedateToSysdate = duedateToSysdate;
	}
	public String getCampaignName() {
		return campaignName;
	}
	public void setCampaignName(String campaignName) {
		this.campaignName = campaignName;
	}
	public String getCampaignSubject() {
		return campaignSubject;
	}
	public void setCampaignSubject(String campaignSubject) {
		this.campaignSubject = campaignSubject;
	}
	public String getCampaignSummary() {
		return campaignSummary;
	}
	public void setCampaignSummary(String campaignSummary) {
		this.campaignSummary = campaignSummary;
	}
	public String getCampaignContents() {
		return campaignContents;
	}
	public void setCampaignContents(String campaignContents) {
		this.campaignContents = campaignContents;
	}
	public int getGatherMount() {
		return gatherMount;
	}
	public void setGatherMount(int gatherMount) {
		this.gatherMount = gatherMount;
	}
	public int getFundingUserCount() {
		return fundingUserCount;
	}
	public void setFundingUserCount(int fundingUserCount) {
		this.fundingUserCount = fundingUserCount;
	}
	public String getLaunchDate() {
		return launchDate;
	}
	public void setLaunchDate(String launchDate) {
		this.launchDate = launchDate;
	}
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public String getYoutubeCode() {
		return youtubeCode;
	}
	public void setYoutubeCode(String youtubeCode) {
		this.youtubeCode = youtubeCode;
	}
	public String getYoutubeImg() {
		return youtubeImg;
	}
	public void setYoutubeImg(String youtubeImg) {
		this.youtubeImg = youtubeImg;
	}
	public String getCampaignImg() {
		return campaignImg;
	}
	public void setCampaignImg(String campaignImg) {
		this.campaignImg = campaignImg;
	}
	
}

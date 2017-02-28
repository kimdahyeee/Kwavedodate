$(document).ready(function() {	
	
	/* 캠페인 ckEditor plug in 추가 */
	if($("#validateCampaignAdd").length>0) {
		 CKEDITOR.replace( 'campaginKoSummary_editor' );
		 CKEDITOR.replace( 'campaginKoContents_editor' );
		 CKEDITOR.replace( 'campaginEnSummary_editor' );
		 CKEDITOR.replace( 'campaginEnContents_editor' );
		 CKEDITOR.replace( 'campaginChSummary_editor' );
		 CKEDITOR.replace( 'campaginChContents_editor' );
	}
	if($("#validateCampaignKoUpdate").length>0){
		 CKEDITOR.replace( 'campaginKoSummary_editor' );
		 CKEDITOR.replace( 'campaginKoContents_editor' );
	}
	if($("#validateCampaignEnUpdate").length>0){
		 CKEDITOR.replace( 'campaginEnSummary_editor' );
		 CKEDITOR.replace( 'campaginEnContents_editor' );
	}
	if($("#validateCampaignChUpdate").length>0){
		 CKEDITOR.replace( 'campaginChSummary_editor' );
		 CKEDITOR.replace( 'campaginChContents_editor' );
	}
	
	/* 리워드 ckEditor plug in 추가  */
	if($("#validateRewardAdd").length>0){
		 CKEDITOR.replace( 'rewardKoContents_editor' );
		 CKEDITOR.replace( 'rewardEnContents_editor' );
		 CKEDITOR.replace( 'rewardChContents_editor' );
	}
	if($("#validateRewardKoUpdate").length>0){
		 CKEDITOR.replace( 'rewardKoContents_editor' );
	}
	if($("#validateRewardEnUpdate").length>0){
		 CKEDITOR.replace( 'rewardEnContents_editor' );
	}
	if($("#validateRewardEnUpdate").length>0){
		 CKEDITOR.replace( 'rewardEnContents_editor' );
	}
});

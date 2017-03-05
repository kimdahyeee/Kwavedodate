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
	if($("#validateRewardChUpdate").length>0){
		 CKEDITOR.replace( 'rewardChContents_editor' );
	}
	
    // 캠페인 추가 validation
    if($("#validateCampaignAdd").length>0) {
    	var campaignFormData = new FormData($("#validateCampaignAdd"));
        $("#validateCampaignAdd").validate({
        	submitHandler: function(form) {   
        		campaignFormData.append("campaignName", $("#campaignName").val());
        		campaignFormData.append("launchDate", $("#launchDate").val());
        		campaignFormData.append("dueDate", $("#dueDate").val());
        		campaignFormData.append("youtubeCode", $("#youtubeCode").val());
        		campaignFormData.append("campaignImg", $("input[name=campaignImg]")[0].files[0]);
        		campaignFormData.append("youtubeImg", $("input[name=youtubeImg]")[0].files[0]);
        		campaignFormData.append("campaignKoSubject", $("#campaignKoSubject").val());
        		campaignFormData.append("campaginKoSummary_editor", CKEDITOR.instances['campaginKoSummary_editor'].getData());
        		campaignFormData.append("campaginKoContents_editor", CKEDITOR.instances['campaginKoContents_editor'].getData());
        		campaignFormData.append("campaignEnSubject", $("#campaignEnSubject").val());
        		campaignFormData.append("campaginEnSummary_editor", CKEDITOR.instances['campaginEnSummary_editor'].getData());
        		campaignFormData.append("campaginEnContents_editor", CKEDITOR.instances['campaginEnContents_editor'].getData());
        		campaignFormData.append("campaignChSubject", $("#campaignChSubject").val());
        		campaignFormData.append("campaginChSummary_editor", CKEDITOR.instances['campaginChSummary_editor'].getData());
        		campaignFormData.append("campaginChContents_editor", CKEDITOR.instances['campaginChContents_editor'].getData());
                $.ajax({
                    type: "POST",
                    url: "/kwaveweb/admin/insertCampaign", 
                    contentType: false,
                    processData: false,
                    data:campaignFormData,
                    dataType: "json",
                    success: function(data) {
                    	if(data.KEY == "SUCCESS"){
                           alert("캠페인이 저장되었습니다.");
                           location.href = "http://localhost:8181/kwaveweb/admin/manageCampaigns";
                         }else{
                            alert("캠페인이 저장이 실패했습니다.");
                         }
                    }
                });
            },
            errorPlacement: function(error, element) {  
                error.appendTo(element.parent());  
            },
            onkeyup: false,
            onclick: false,
            ignore: [],
            rules: {
            	campaignName: {
                    required: true
                },
                launchDate: {
                    required: true
                },
                dueDate: {
                    required: true
                },
                youtubeCode: { 
                    required: true
                },
                campaignImg: {
                    required: true
                },
                youtubeImg: {
                    required: true
                },
                campaignKoSubject: {
                    required: true
                },
                campaginKoSummary_editor: {
                	required: function() {
                        CKEDITOR.instances.campaginKoSummary_editor.updateElement();
                    }
                },
                campaginKoContents_editor: {
                	required: function() {
                        CKEDITOR.instances.campaginKoContents_editor.updateElement();
                    }
                },
                campaignEnSubject: {
                    required: true
                },
                campaginEnSummary_editor: {
                	required: function() {
                        CKEDITOR.instances.campaginEnSummary_editor.updateElement();
                    }
                },
                campaginEnContents_editor: {
                	required: function() {
                        CKEDITOR.instances.campaginEnContents_editor.updateElement();
                    }
                },
                campaignChSubject: {
                    required: true
                },
                campaginChSummary_editor: {
                	required: function() {
                        CKEDITOR.instances.campaginChSummary_editor.updateElement();
                    }
                },
                campaginChContents_editor: {
                	required: function() {
                        CKEDITOR.instances.campaginChContents_editor.updateElement();
                    }
                }
            },
            messages: {
            	campaignName: {
                    required: "캠페인 이름을 입력해 주세요."
                },
                launchDate: {
                    required: "시작 날짜를 입력해 주세요."
                },
                dueDate: {
                    required: "종료 날짜를 입력해 주세요."
                },
                youtubeCode: { 
                    required: "Youtube코드를 입력해 주세요."
                },
                campaignImg: {
                    required: "이미지를 선택해 주세요."
                },
                youtubeImg: {
                    required: "이미지를 선택해 주세요."
                },
                campaignKoSubject: {
                    required: "캠페인(한국어) 제목을 입력해주세요."
                },
                campaginKoSummary_editor: {
                    required: "캠페인(한국어) 요약 내용을 입력해주세요."
                },
                campaginKoContents_editor: {
                    required: "캠페인(한국어) 상세 내용을 입력해주세요."
                },
                campaignEnSubject: {
                    required: "캠페인(영어) 제목을 입력해주세요."
                },
                campaginEnSummary_editor: {
                    required: "캠페인(영어) 요약 내용을 입력해주세요."
                },
                campaginEnContents_editor: {
                    required: "캠페인(영어) 상세 내용을 입력해주세요."
                },
                campaignChSubject: {
                    required: "캠페인(중국어) 요약 내용을 입력해주세요."
                },
                campaginChSummary_editor: {
                    required: "캠페인(중국어) 요약 내용을 입력해주세요."
                },
                campaginChContents_editor: {
                    required: "캠페인(중국어) 상세 내용을 입력해주세요."
                }
            },
            errorElement: "span",
            highlight: function (element) {
                $(element).parent().removeClass("has-success").addClass("has-error");
                $(element).siblings("label").addClass("hide");
            },
            success: function (element) {
                $(element).parent().removeClass("has-error").addClass("has-success");
                $(element).siblings("label").removeClass("hide");
            }
        });
    }
    
    // 캠페인(공통부분) update validation
    if($("#validateCampaignCommonUpdate").length>0) {
        $("#validateCampaignCommonUpdate").validate({
        	submitHandler: function(form) {   
                $.ajax({
                    type: "POST",
                    url: "", 
                    data: {
                        "campaignName": $("#campaignName").val(),
                        "launchDate": $("#launchDate").val(),
                        "dueDate": $("#dueDate").val(),
                        "youtubeCode": $("#youtubeCode").val(),
                        "campaignImg": $("#campaignImg").val(),
                        "youtubeImg": $("#youtubeImg").val(),
                        "campaignRegister": $("#campaignRegister").val(),
                    },
                    dataType: "json",
                    success: function(data) {
                    	// 성공 시 view 처리
                    	
                    }
                });
            },
            errorPlacement: function(error, element) {  
                error.appendTo(element.parent());  
            },
            onkeyup: false,
            onclick: false,
            ignore: [],
            rules: {
            	campaignName: {
                    required: true
                },
                launchDate: {
                    required: true
                },
                dueDate: {
                    required: true
                },
                youtubeCode: { 
                    required: true
                },
                campaignImg: {
                    required: true
                },
                youtubeImg: {
                    required: true
                }
            },
            messages: {
            	campaignName: {
                    required: "캠페인 이름을 입력해 주세요."
                },
                launchDate: {
                    required: "시작 날짜를 입력해 주세요."
                },
                dueDate: {
                    required: "종료 날짜를 입력해 주세요."
                },
                youtubeCode: { 
                    required: "Youtube코드를 입력해 주세요."
                },
                campaignImg: {
                    required: "이미지를 선택해 주세요."
                },
                youtubeImg: {
                    required: "이미지를 선택해 주세요."
                }
            },
            errorElement: "span",
            highlight: function (element) {
                $(element).parent().removeClass("has-success").addClass("has-error");
                $(element).siblings("label").addClass("hide");
            },
            success: function (element) {
                $(element).parent().removeClass("has-error").addClass("has-success");
                $(element).siblings("label").removeClass("hide");
            }
        });
    }
    
    // 캠페인(한국어) update validation
    if($("#validateCampaignKoUpdate").length>0) {
        $("#validateCampaignKoUpdate").validate({
        	submitHandler: function(form) {   
                $.ajax({
                    type: "POST",
                    url: "", 
                    data: {
                    	"campaignName": $("#campaignName").val(),
                        "campaignKoSubject": $("#campaignKoSubject").val(),
                        "campaginKoSummary_editor": CKEDITOR.instances['campaginKoSummary_editor'].getData(),
                        "campaginKoContents_editor": CKEDITOR.instances['campaginKoContents_editor'].getData()
                    },
                    dataType: "json",
                    success: function(data) {
                    	// 성공 시 view 처리
                    	
                    }
                });
            },
            errorPlacement: function(error, element) {  
                error.appendTo(element.parent());  
            },
            onkeyup: false,
            onclick: false,
            ignore: [],
            rules: {
            	campaignName: {
                    required: true
                },
                campaignKoSubject: {
                    required: true
                },
                campaginKoSummary_editor: {
                	required: function() {
                        CKEDITOR.instances.campaginKoSummary_editor.updateElement();
                    }
                },
                campaginKoContents_editor: {
                	required: function() {
                        CKEDITOR.instances.campaginKoContents_editor.updateElement();
                    }
                }
            },
            messages: {
            	campaignName: {
                    required: "캠페인 이름을 입력해 주세요."
                },
                campaignKoSubject: {
                    required: "캠페인(한국어) 요약 내용을 입력해주세요."
                },
                campaginKoSummary_editor: {
                    required: "캠페인(한국어) 요약 내용을 입력해주세요."
                },
                campaginKoContents_editor: {
                    required: "캠페인(한국어) 상세 내용을 입력해주세요."
                }
            },
            errorElement: "span",
            highlight: function (element) {
                $(element).parent().removeClass("has-success").addClass("has-error");
                $(element).siblings("label").addClass("hide");
            },
            success: function (element) {
                $(element).parent().removeClass("has-error").addClass("has-success");
                $(element).siblings("label").removeClass("hide");
            }
        });
    }
    
    // 캠페인(영어) update validation
    if($("#validateCampaignEnUpdate").length>0) {
        $("#validateCampaignEnUpdate").validate({
        	submitHandler: function(form) {   
                $.ajax({
                    type: "POST",
                    url: "", 
                    data: {
                    	"campaignName": $("#campaignName").val(),
                        "campaignEnSubject": $("#campaignEnSubject").val(),
                        "campaginEnSummary_editor": CKEDITOR.instances['campaginEnSummary_editor'].getData(),
                        "campaginEnContents_editor": CKEDITOR.instances['campaginEnContents_editor'].getData()
                    },
                    dataType: "json",
                    success: function(data) {
                    	// 성공 시 view 처리
                    	
                    }
                });
            },
            errorPlacement: function(error, element) {  
                error.appendTo(element.parent());  
            },
            onkeyup: false,
            onclick: false,
            ignore: [],
            rules: {
            	campaignName: {
                    required: true
                },
                campaignEnSubject: {
                    required: true
                },
                campaginEnSummary_editor: {
                	required: function() {
                        CKEDITOR.instances.campaginEnSummary_editor.updateElement();
                    }
                },
                campaginEnContents_editor: {
                	required: function() {
                        CKEDITOR.instances.campaginEnContents_editor.updateElement();
                    }
                }
            },
            messages: {
            	campaignName: {
                    required: "캠페인 이름을 입력해 주세요."
                },
                campaignEnSubject: {
                    required: "캠페인(영어) 요약 내용을 입력해주세요."
                },
                campaginEnSummary_editor: {
                    required: "캠페인(영어) 요약 내용을 입력해주세요."
                },
                campaginEnContents_editor: {
                    required: "캠페인(영어) 상세 내용을 입력해주세요."
                }
            },
            errorElement: "span",
            highlight: function (element) {
                $(element).parent().removeClass("has-success").addClass("has-error");
                $(element).siblings("label").addClass("hide");
            },
            success: function (element) {
                $(element).parent().removeClass("has-error").addClass("has-success");
                $(element).siblings("label").removeClass("hide");
            }
        });
    }
       
    // 캠페인(중국어) update validation
    if($("#validateCampaignChUpdate").length>0) {
        $("#validateCampaignChUpdate").validate({
        	submitHandler: function(form) {   
                $.ajax({
                    type: "POST",
                    url: "", 
                    data: {
                    	"campaignName": $("#campaignName").val(),
                        "campaignChSubject": $("#campaignChSubject").val(),
                        "campaginChSummary_editor": CKEDITOR.instances['campaginChSummary_editor'].getData(),
                        "campaginChContents_editor": CKEDITOR.instances['campaginChContents_editor'].getData()
                    },
                    dataType: "json",
                    success: function(data) {
                    	// 성공 시 view 처리
                    	
                    }
                });
            },
            errorPlacement: function(error, element) {  
                error.appendTo(element.parent());  
            },
            onkeyup: false,
            onclick: false,
            ignore: [],
            rules: {
            	campaignName: {
                    required: true
                },
                campaignChSubject: {
                    required: true
                },
                campaginChSummary_editor: {
                	required: function() {
                        CKEDITOR.instances.campaginChSummary_editor.updateElement();
                    }
                },
                campaginChContents_editor: {
                	required: function() {
                        CKEDITOR.instances.campaginChContents_editor.updateElement();
                    }
                }
            },
            messages: {
            	campaignName: {
                    required: "캠페인 이름을 입력해 주세요."
                },
                campaignChSubject: {
                    required: "캠페인(중국어) 요약 내용을 입력해주세요."
                },
                campaginChSummary_editor: {
                    required: "캠페인(중국어) 요약 내용을 입력해주세요."
                },
                campaginChContents_editor: {
                    required: "캠페인(중국어) 상세 내용을 입력해주세요."
                }
            },
            errorElement: "span",
            highlight: function (element) {
                $(element).parent().removeClass("has-success").addClass("has-error");
                $(element).siblings("label").addClass("hide");
            },
            success: function (element) {
                $(element).parent().removeClass("has-error").addClass("has-success");
                $(element).siblings("label").removeClass("hide");
            }
        });
    }
    
    // 리워드 추가 validation
    if($("#validateRewardAdd").length>0) {
    	var formData  = new FormData($("#validateRewardAdd"));
        $("#validateRewardAdd").validate({
        	submitHandler: function(form) {   
        		formData.append("campaignName", $("#campaignName").val());
        		formData.append("rewardAmount", $("#rewardAmount").val());
        		formData.append("rewardTotalCnt", $("#rewardTotalCnt").val());
        		formData.append("rewardImg", $("input[name=rewardImg]")[0].files[0]);
        		formData.append("rewardKoSubject", $("#rewardKoSubject").val());
        		formData.append("rewardKoContents_editor", CKEDITOR.instances['rewardKoContents_editor'].getData());
        		formData.append("rewardEnSubject", $("#rewardEnSubject").val());
        		formData.append("rewardEnContents_editor",CKEDITOR.instances['rewardEnContents_editor'].getData());
        		formData.append("rewardChSubject", $("#rewardChSubject").val());
        		formData.append("rewardChContents_editor", CKEDITOR.instances['rewardChContents_editor'].getData());
                $.ajax({
                    type: "POST",
                    url: "/kwaveweb/admin/insertReward", 
                    contentType: false, // ajax 파일 전송 시 꼭 필요!!
                    processData: false, // ajax 파일 전송 시 꼭 필요!!
                    data: formData,
                    dataType: "json",
                    success: function(data) {
                    	// 성공 시 view 처리 해줘야 됨!
                    }
                });
            },
            errorPlacement: function(error, element) {  
                error.appendTo(element.parent());  
            },
            onkeyup: false,
            onclick: false,
            ignore: [],
            rules: {
            	campaignName: {
                    required: true
                },
                rewardAmount: {
                    required: true
                },
                rewardTotalCnt: {
                    required: true
                },
                rewardImg: {
                    required: true
                },
                rewardKoSubject: {
                	required: true
                },
                rewardKoContents_editor: {
                	required: function() {
                        CKEDITOR.instances.rewardKoContents_editor.updateElement();
                    }
                },
                rewardEnSubject: {
                    required: true
                },
                rewardEnContents_editor: {
                	required: function() {
                        CKEDITOR.instances.rewardEnContents_editor.updateElement();
                    }
                },
                rewardChSubject: {
                    required: true
                },
                rewardChContents_editor: {
                	required: function() {
                        CKEDITOR.instances.rewardChContents_editor.updateElement();
                    }
                }
            },
            messages: {
            	campaignName: {
                    required: "캠페인 이름을 입력해 주세요."
                },
                rewardAmount: {
                    required: "리워드 금액을 입력해 주세요."
                },
                rewardTotalCnt: {
                    required: "리워드 수량을 입력해 주세요."
                },
                rewardImg: {
                    required: "리워드 이미지를 입력해 주세요."
                },
                rewardKoSubject: {
                    required: "리워드(한국어) 제목을 입력해 주세요."
                },
                rewardKoContents_editor: {
                    required: "리워드(한국어) 내용을 입력해 주세요."
                },
                rewardEnSubject: {
                    required: "리워드(영어) 제목을 입력해 주세요."
                },
                rewardEnContents_editor: {
                    required: "리워드(영어) 내용을 입력해 주세요."
                },
                rewardChSubject: {
                    required: "리워드(중국어) 제목을 입력해 주세요."
                },
                rewardChContents_editor: {
                    required: "리워드(중국어) 내용을 입력해 주세요."
                }
            },
            errorElement: "span",
            highlight: function (element) {
                $(element).parent().removeClass("has-success").addClass("has-error");
                $(element).siblings("label").addClass("hide");
            },
            success: function (element) {
                $(element).parent().removeClass("has-error").addClass("has-success");
                $(element).siblings("label").removeClass("hide");
            }
        });
    }
    
    // 리워드(공통부분) update validation
    if($("#validateRewardCommonUpdate").length>0) {
    	//사진 변경 시 미리 보기
		var previewImg = document.getElementById('previewImg');
		var rewardImg = document.getElementById('rewardImg');
		checkFileReader();
		loadPreviewImg(previewImg, rewardImg);
    	
        $("#validateRewardCommonUpdate").validate({
        	submitHandler: function(form) {   
                $.ajax({
                    type: "POST",
                    url: "", 
                    data: {
                    	"campaignName": $("#campaignName").val(),
                    	"rewardAmount": $("#rewardAmount").val(),
                        "rewardTotalCnt": $("#rewardTotalCnt").val(),
                        "rewardCurrentCnt": $("#rewardTotalCnt").val(), // 삽입 시 total cnt = cur cnt
                        "rewardImg": $("#rewardImg").val()
                    },
                    dataType: "json",
                    success: function(data) {
                    	// 성공 시 view 처리
                    	
                    }
                });
            },
            errorPlacement: function(error, element) {  
                error.appendTo(element.parent());  
            },
            onkeyup: false,
            onclick: false,
            ignore: [],
            rules: {
            	campaignName: {
                    required: true
                },
                rewardAmount: {
                    required: true
                },
                rewardTotalCnt: {
                    required: true
                },
                rewardImg: {
                    required: true
                }
            },
            messages: {
            	campaignName: {
                    required: "캠페인 이름을 입력해 주세요."
                },
                rewardAmount: {
                    required: "리워드 금액을 입력해 주세요."
                },
                rewardTotalCnt: {
                    required: "리워드 수량을 입력해 주세요."
                },
                rewardImg: {
                    required: "리워드 이미지를 입력해 주세요."
                }
            },
            errorElement: "span",
            highlight: function (element) {
                $(element).parent().removeClass("has-success").addClass("has-error");
                $(element).siblings("label").addClass("hide");
            },
            success: function (element) {
                $(element).parent().removeClass("has-error").addClass("has-success");
                $(element).siblings("label").removeClass("hide");
            }
        });
    }
    
    // 리워드(한국어) update validation
    if($("#validateRewardKoUpdate").length>0) {
        $("#validateRewardKoUpdate").validate({
        	submitHandler: function(form) {   
                $.ajax({
                    type: "POST",
                    url: "", 
                    data: {
                        // + rewardNum 값
                    	"rewardKoSubject": $("#rewardKoSubject").val(),
                        "rewardKoContents_editor": CKEDITOR.instances['rewardKoContents_editor'].getData()
                    },
                    dataType: "json",
                    success: function(data) {
                    	// 성공 시 view 처리
                    }
                });
            },
            errorPlacement: function(error, element) {  
                error.appendTo(element.parent());  
            },
            onkeyup: false,
            onclick: false,
            ignore: [],
            rules: {
                rewardKoSubject: {
                    required: true
                },
                rewardKoContents_editor: {
                	required: function() {
                        CKEDITOR.instances.rewardKoContents_editor.updateElement();
                    }
                }
            },
            messages: {
                rewardKoSubject: {
                    required: "리워드(한국어) 제목을 입력해 주세요."
                },
                rewardKoContents_editor: {
                    required: "리워드(한국어) 내용을 입력해 주세요."
                }
            },
            errorElement: "span",
            highlight: function (element) {
                $(element).parent().removeClass("has-success").addClass("has-error");
                $(element).siblings("label").addClass("hide");
            },
            success: function (element) {
                $(element).parent().removeClass("has-error").addClass("has-success");
                $(element).siblings("label").removeClass("hide");
            }
        });
    }
    
    // 리워드(영어) update validation
    if($("#validateRewardEnUpdate").length>0) {
        $("#validateRewardEnUpdate").validate({
        	submitHandler: function(form) {   
                $.ajax({
                    type: "POST",
                    url: "", 
                    data: {
                        // + rewardNum value
                    	"rewardEnSubject": $("#rewardEnSubject").val(),
                        "rewardEnContents_editor": CKEDITOR.instances['rewardEnContents_editor'].getData()
                    },
                    dataType: "json",
                    success: function(data) {
                    	// 성공 시 view 처리
                    }
                });
            },
            errorPlacement: function(error, element) {  
                error.appendTo(element.parent());  
            },
            onkeyup: false,
            onclick: false,
            ignore: [],
            rules: {
                rewardEnSubject: {
                    required: true
                },
                rewardEnContents_editor: {
                	required: function() {
                        CKEDITOR.instances.rewardEnContents_editor.updateElement();
                    }
                }
            },
            messages: {
                rewardEnSubject: {
                    required: "리워드(영어) 제목을 입력해 주세요."
                },
                rewardEnSubject: {
                    required: "리워드(영어) 내용을 입력해 주세요."
                }
            },
            errorElement: "span",
            highlight: function (element) {
                $(element).parent().removeClass("has-success").addClass("has-error");
                $(element).siblings("label").addClass("hide");
            },
            success: function (element) {
                $(element).parent().removeClass("has-error").addClass("has-success");
                $(element).siblings("label").removeClass("hide");
            }
        });
    }
    
    // 리워드(중국어) update validation
    if($("#validateRewardChUpdate").length>0) {
        $("#validateRewardChUpdate").validate({
        	submitHandler: function(form) {   
                $.ajax({
                    type: "POST",
                    url: "", 
                    data: {
                        // + rewardNum 값
                    	"rewardChSubject": $("#rewardChSubject").val(),
                        "rewardChContents_editor": CKEDITOR.instances['rewardChContents_editor'].getData()
                    },
                    dataType: "json",
                    success: function(data) {
                    	// 성공 시 view 처리
                    }
                });
            },
            errorPlacement: function(error, element) {  
                error.appendTo(element.parent());  
            },
            onkeyup: false,
            onclick: false,
            ignore: [],
            rules: {
                rewardChSubject: {
                    required: true
                },
                rewardChContents_editor: {
                	required: function() {
                        CKEDITOR.instances.rewardChContents_editor.updateElement();
                    }
                }
            },
            messages: {
                rewardChSubject: {
                    required: "리워드(중국어) 제목을 입력해 주세요."
                },
                rewardChContents_editor: {
                    required: "리워드(중국어) 내용을 입력해 주세요."
                }
            },
            errorElement: "span",
            highlight: function (element) {
                $(element).parent().removeClass("has-success").addClass("has-error");
                $(element).siblings("label").addClass("hide");
            },
            success: function (element) {
                $(element).parent().removeClass("has-error").addClass("has-success");
                $(element).siblings("label").removeClass("hide");
            }
        });
    }
    
	/* 이미지 미리보기 함수 */
	function loadPreviewImg(previewImg, fileTypeInputTag) {
		fileTypeInputTag.onchange = function (e) {
			e.preventDefault();
			$('#imgLoaded').hide();
			
			var file = fileTypeInputTag.files[0];
			var reader = new FileReader();
			
			reader.onload = function (event) {
				var img = new Image();
				img.src = event.target.result;
				if (img.width > 300) {
					img.width = 300;
				}
				previewImg.innerHTML = '';
				previewImg.appendChild(img);
			};
			reader.readAsDataURL(file);
			return false;
		};
	}
		
	/* File System을 지원하는 웹 브라우저인지 체크 */
	function checkFileReader() {
		var uploadImgState = document.getElementById("uploadImgState");
		if (typeof window.FileReader === 'undefined') {
			uploadImgState.innerHTML = 'File System을 지원하지 않는 웹 브라우저 입니다.';
		} else {
			uploadImgState.innerHTML  = '이미지 업로드가 가능합니다.';
		}
	}
});



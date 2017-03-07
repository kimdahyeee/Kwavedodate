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
	if($("#validateCampaignChildUpdate").length>0){
		 CKEDITOR.replace( 'campaignSummary_editor' );
		 CKEDITOR.replace( 'campaignContents_editor' );
	}
	
	/* 리워드 ckEditor plug in 추가  */
	if($("#validateRewardAdd").length>0){
		 CKEDITOR.replace( 'rewardKoContents_editor' );
		 CKEDITOR.replace( 'rewardEnContents_editor' );
		 CKEDITOR.replace( 'rewardChContents_editor' );
	}
	if($("#validateRewardChildUpdate").length>0){
		 CKEDITOR.replace( "rewardContents_editor", {
			 filebrowserImageUploadUrl:"/kwaveweb/admin/ckEditorImageUpload"
		 });
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
        		campaignFormData.append("campaignImgFile", $("input[name=campaignImgFile]")[0].files[0]);
        		campaignFormData.append("youtubeImgFile", $("input[name=youtubeImgFile]")[0].files[0]);
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
                           location.href = "/kwaveweb/admin/manageCampaigns";
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
    	var campaignFormData = new FormData($("#validateCampaignCommonUpdate"));
    	/***************사진 미리보기******************/
		var previewCampaignImg = document.getElementById('previewCampaignImg');
		var previewYoutubeImg = document.getElementById('previewYoutubeImg');
		var campaignImgFile = document.getElementById('campaignImgFile');
		var youtubeImgFile = document.getElementById('youtubeImgFile');
		checkFileReader();
		loadPreviewImg(previewCampaignImg, campaignImgFile);
		loadPreviewImg(previewYoutubeImg, youtubeImgFile);
		/***************사진 미리보기 끝****************/
        $("#validateCampaignCommonUpdate").validate({
        	submitHandler: function(form) {   
        		campaignFormData.append("campaignName", $("#campaignName").val());
        		campaignFormData.append("launchDate", $("#launchDate").val());
        		campaignFormData.append("dueDate", $("#dueDate").val());
        		campaignFormData.append("youtubeCode", $("#youtubeCode").val());
        		campaignFormData.append("campaignImg", $("#campaignImg").val());
        		campaignFormData.append("campaignImgFile", $("input[name=campaignImgFile]")[0].files[0]);
        		campaignFormData.append("youtubeImg", $("#youtubeImg").val());
        		campaignFormData.append("youtubeImgFile", $("input[name=youtubeImgFile]")[0].files[0]);
                $.ajax({
                    type: "POST",
                    url: "/kwaveweb/admin/updateCommonCampaign", 
                    contentType: false,
                    processData: false,
                    data:campaignFormData,
                    dataType: "json",
                    success: function(data) {
                    	if(data.KEY == "SUCCESS"){
                           alert($("#campaignName").val() +"캠페인이 수정되었습니다.");
                           location.href = "http://localhost:8181/kwaveweb/admin/campaignDetail/" + $("#campaignName").val();
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
    
    // 캠페인 자식 (언어별로) update validation
    if($("#validateCampaignChildUpdate").length>0) {
        $("#validateCampaignChildUpdate").validate({
        	submitHandler: function(form) {   
                $.ajax({
                    type: "POST",
                    url: "/kwaveweb/admin/updateChildCampaign", 
                    data: {
                    	"locale": $("#locale").val(),
                    	"campaignName": $("#campaignName").val(),
                        "campaignSubject": $("#campaignSubject").val(),
                        "campaignSummary_editor": CKEDITOR.instances['campaignSummary_editor'].getData(),
                        "campaignContents_editor": CKEDITOR.instances['campaignContents_editor'].getData()
                    },
                    dataType: "json",
                    success: function(data) {
                    	if(data.KEY == "SUCCESS") {
                    		alert("캠페인(" + $("#locale").val() +") 내용이 변경되었습니다.");
                    		window.location = "/kwaveweb/admin/campaignDetail/"+ $("#campaignName").val();
                    	} else {
                    		alert("캠페인(" + $("#locale").val() +") 변경에 실패하였습니다. 다시 시도해주세요.");
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
                campaignSubject: {
                    required: true
                },
                campaginSummary_editor: {
                	required: function() {
                        CKEDITOR.instances.campaignSummary_editor.updateElement();
                    }
                },
                campaignContents_editor: {
                	required: function() {
                        CKEDITOR.instances.campaignContents_editor.updateElement();
                    }
                }
            },
            messages: {
            	campaignName: {
                    required: "캠페인 이름을 입력해 주세요."
                },
                campaignSubject: {
                    required: "캠페인 제목을 입력해주세요."
                },
                campaignSummary_editor: {
                    required: "캠페인 요약 내용을 입력해주세요."
                },
                campaignContents_editor: {
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
    
    // 리워드 추가 validation
    if($("#validateRewardAdd").length>0) {
    	var formData  = new FormData($("#validateRewardAdd"));
        $("#validateRewardAdd").validate({
        	submitHandler: function(form) {   
        		formData.append("campaignName", $("#campaignName").val());
        		formData.append("rewardAmount", $("#rewardAmount").val());
        		formData.append("rewardTotalCnt", $("#rewardTotalCnt").val());
        		formData.append("rewardCurrentCnt", $("#rewardTotalCnt").val());
        		formData.append("rewardImgFile", $("input[name=rewardImgFile]")[0].files[0]);
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
                    	if(data.key == "success") {
                    		alert($("#campaignName").val() + "의 리워드가 등록되었습니다.");
                    		window.location = "/kwaveweb/admin/"+ $("#campaignName").val() +"/manageRewards";
                    	} else {
                    		alert("리워드 등록에 실패하였습니다. 다시 시도해주세요.");
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
    	var formData  = new FormData($("#validateRewardCommonUpdate"));
    	/***************사진 미리보기******************/
		var previewImg = document.getElementById('previewImg');
		var rewardImg = document.getElementById('rewardImgFile');
		checkFileReader();
		loadPreviewImg(previewImg, rewardImg);
		/***************사진 미리보기 끝****************/
		
        $("#validateRewardCommonUpdate").validate({
        	submitHandler: function(form) {   
        		formData.append("rewardNum", $("#rewardNum").val());
        		formData.append("campaignName", $("#campaignName").val());
        		formData.append("rewardAmount", $("#rewardAmount").val());
        		formData.append("rewardTotalCnt", $("#rewardTotalCnt").val());
        		formData.append("rewardCurrentCnt", $("#rewardCurrentCnt").val());
        		formData.append("rewardImg", $("#rewardImg").val());
        		formData.append("rewardImgFile", $("input[name=rewardImgFile]")[0].files[0]);
                $.ajax({
                    type: "POST",
                    url: "/kwaveweb/admin/updateCommonReward", 
                    contentType: false, // ajax 파일 전송 시 꼭 필요!!
                    processData: false, // ajax 파일 전송 시 꼭 필요!!
                    data: formData,
                    dataType: "json",
                    success: function(data) {
                    	if(data.key == "success") {
                    		alert($("#campaignName").val() + "의 리워드가 변경되었습니다.");
                    		window.location = "/kwaveweb/admin/"+ $("#campaignName").val() +"/manageRewards/" + $("#rewardNum").val();
                    	} else {
                    		alert("리워드 변경에 실패하였습니다. 다시 시도해주세요.");
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
                rewardAmount: {
                    required: true
                },
                rewardTotalCnt: {
                    required: true
                },
                rewardCurrentCnt: {
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
                rewardCurrentCnt: {
                	required: "리워드 현재 남은 수량을 입력해 주세요."
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
    
    // 리워드 자식 테이블(언어) update validation
    if($("#validateRewardChildUpdate").length>0) {
        $("#validateRewardChildUpdate").validate({
        	submitHandler: function(form) {   
                $.ajax({
                    type: "POST",
                    url: "/kwaveweb/admin/updateRewardChild", 
                    data: {
                        "rewardNum": $("#rewardNum").val(),
                        "locale": $("#locale").val(),
                    	"rewardSubject": $("#rewardSubject").val(),
                        "rewardContents_editor": CKEDITOR.instances['rewardContents_editor'].getData()
                    },
                    dataType: "json",
                    success: function(data) {
                    	if(data.key == "success") {
                    		alert("리워드(언어) 내용이 변경되었습니다.");
                    		window.location = "/kwaveweb/admin/"+ $("#campaignName").val() +"/manageRewards/" + $("#rewardNum").val();
                    	} else {
                    		alert("리워드(언어) 변경에 실패하였습니다. 다시 시도해주세요.");
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
                rewardSubject: {
                    required: true
                },
                rewardContents_editor: {
                	required: function() {
                        CKEDITOR.instances.rewardContents_editor.updateElement();
                    }
                }
            },
            messages: {
                rewardSubject: {
                    required: "리워드 제목을 입력해 주세요."
                },
                rewardContents_editor: {
                    required: "리워드 내용을 입력해 주세요."
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
			if(($('#campaignImgLoaded').length > 0) && (fileTypeInputTag == document.getElementById('campaignImgFile'))){
				$('#campaignImgLoaded').hide();
			} else if(($('#imgLoaded').length > 0) && (fileTypeInputTag == document.getElementById('rewardImgFile')) ){
				$('#imgLoaded').hide();
			} else {
				$('#youtubeImgLoaded').hide();
			}
			
			var file = fileTypeInputTag.files[0];
			var reader = new FileReader();
			
			reader.onload = function (event) {
				var img = new Image();
				img.src = event.target.result;
				img.width = 250;
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



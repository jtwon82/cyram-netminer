	function fn_reload() {
		top.location.reload();
	}
	
	function doAjax(formId, url, msg, func) {
		
		$("form[id=" + formId + "]").ajaxSubmit({
			url : url,
			type : "post",
			success : function(data){
				if(data.trim() == 'SUCCESS') {
					if(msg != '') {
						alert(msg);
					}
					eval(func);
				} else {
					$("#return_message").html(data);
					var str = $("#error_message").html();
					var i = 0;
					
					if(i > -1) {
						str = str.substring(i + 12);
						alert(str);
					} else {
						alert("An error has occurred. Please contact the administrator if the same error still occurs.");
					}
				}
			}
		});
	}

	function doAjaxForReturn(formId, url, msg, func) {
		$("form[id=" + formId + "]").ajaxSubmit({
			url : url,
			type : "post",
			success : function(data){
//				alert(data);
				$("#return_data").text(data);
				eval(func);
			}
		});
	}
	
	function doCommentDeleteModalPopup(eX, eY, wr_comment) {
		var width = 230;
		var height = 130;
		
		var x = eX + document.body.scrollLeft - width;// - ((eX * 2) - 1800);
		var y = eY + document.body.scrollTop - height - 240;

		if(x < 0) {
			x = 0;
		}
		
		if(y < 0) {
			y = 0;
		}
		
		var gray_layer = "<div id='gray_layer' style='position:fixed; left:0px; top:0px; height:100%; width:100%; background:gray; filter:alpha(opacity=10); opacity:0.10;'></div>";
		
		var model_layer = "";
		model_layer += "<div class='board_pop' id='model_layer' style='text-align:center;padding-top:35px;z-index:999; position:absolute; height:" + height + "px; width:" + width + "px; background:white;'>";
//		model_layer += "<div class='board_pop_con'>";
		model_layer += "Please enter a password<br/><br/>";
		model_layer += "<input type='password' name='comment_delete_password' id='comment_delete_password' class='input_w130'/>";
		model_layer += "<br/><br/><span id='comment_delete_close' style='cursor:pointer'><img src='/images/sub/btn_cancel.gif' alt='cancel' width='78' height='26' /><span/>";
		model_layer += " <span id='comment_delete_do'><img src='/images/sub/btn_ok.gif' alt='ok' width='78' height='26' /></span>";
//		model_layer += "</div>";
		model_layer += "</div>";
		
		$("body").append(gray_layer);
		$("form[id=boardModel]").append(model_layer);

		$('#model_layer').css({'top':y + 'px','left': '62%','margin-left':'0'});
		
		$("#comment_delete_do").click(function(){
			if($("#comment_delete_password").val() == '') {
				alert('Please enter a password.');
				return false;
			}
			
			delete_comment(wr_comment);
		});

		$("#gray_layer").click(function(){
			;
		});

		$("#comment_delete_close").click(function(){
			$("#model_layer").remove();
			$("#gray_layer").remove();
		});
		
	}

	function doCommentDeleteModalPopup_old(eX, eY, wr_comment) {
		var width = 250;
		var height = 150;
		
		
		var x = eX + document.body.scrollLeft - width;// - ((eX * 2) - 1800);
		var y = eY + document.body.scrollTop - height - 240;

		alert(((eX * 2) - 50) + " -- eX: " + eX + " document.body.scrollLeft: " + document.body.scrollLeft + " width: " + width + " = " + x);
		
		if(x < 0) {
			x = 0;
		}
		
		if(y < 0) {
			y = 0;
		}
		
		var gray_layer = "<div id='gray_layer' style='position:fixed; left:0px; top:0px; height:100%; width:100%; background:gray; filter:alpha(opacity=10); opacity:0.10;'></div>";
		
		var model_layer = "";
		model_layer += "<div class='board_pop' id='model_layer' style='text-align:center;padding-top:35px;z-index:999; position:absolute; left:" + x + "px; top:" + y + "px; height:" + height + "px; width:" + width + "px; background:white;'>";
//		model_layer += "<div class='board_pop_con'>";
		model_layer += "Are you sure you want to delete?<br/>Please enter a password<br/><br/>";
		model_layer += "<input type='password' name='comment_delete_password' id='comment_delete_password' class='input_w130'/>";
		model_layer += "<br/><br/><span id='comment_delete_close' style='cursor:pointer'><img src='/images/sub/btn_cancel.gif' alt='cancel' width='78' height='26' /><span/>";
		model_layer += " <span id='comment_delete_do'><img src='/images/sub/btn_ok.gif' alt='ok' width='78' height='26' /></span>";
//		model_layer += "</div>";
		model_layer += "</div>";
		
		$("body").append(gray_layer);
		$("form[id=boardModel]").append(model_layer);

		$("#comment_delete_do").click(function(){
			if($("#comment_delete_password").val() == '') {
				alert('Enter your password.');
				return false;
			}
			
			delete_comment(wr_comment);
		});

		$("#gray_layer").click(function(){
			;
		});

		$("#comment_delete_close").click(function(){
			$("#model_layer").remove();
			$("#gray_layer").remove();
		});
		
	}

	function doBoardEditPasswordModalPopup(eX, eY) {
		var width = 230;
		var height = 130;
		
		var x = eX + document.body.scrollLeft - width - 30;
//		var y = eY + document.body.scrollTop - height - 255;
		var y = eY + document.body.scrollTop - height - 240;
		
		if(x < 0) {
			x = 0;
		}
		
		if(y < 0) {
			y = 0;
		}
		
		var edit_gray_layer = "<div id='edit_gray_layer' style='position:fixed; left:0px; top:0px; height:100%; width:100%; background:gray; filter:alpha(opacity=10); opacity:0.10;'></div>";

		var edit_model_layer = "";
		edit_model_layer += "<div class='board_pop' id='edit_model_layer' style='text-align:center;padding-top:35px;z-index:999; position:absolute; height:" + height + "px; width:" + width + "px; background:white;'>";
//		edit_model_layer += "<div class='board_pop_con'>";
		edit_model_layer += "Please enter a password<br/><br/>";
		edit_model_layer += "<input type='password' name='wr_password' id='wr_password' class='input_w130'/>";
		edit_model_layer += "<br/><br/><span id='edit_modal_close' style='cursor:pointer'><img src='/images/sub/btn_cancel.gif' alt='cancel' width='78' height='26' /><span/>";
		edit_model_layer += " <span id='edit_modal_do'><img src='/images/sub/btn_ok.gif' alt='ok' width='78' height='26' /></span>";
//		edit_model_layer += "</div>";
		edit_model_layer += "</div>";

		$("body").append(edit_gray_layer);
		$("form[id=boardModel]").append(edit_model_layer);

		$('#edit_model_layer').css({'top':y + 'px','left': '59%','margin-left':'0'});

		$("#edit_modal_do").click(function(){
			if($("#wr_password").val() == '') {
				alert('Enter your password.');
				return false;
			}
			
			check_edit_password();
		});

		$("#edit_gray_layer").click(function(){
			;
		});

		$("#edit_modal_close").click(function(){
			$("#edit_model_layer").remove();
			$("#edit_gray_layer").remove();
		});
		
	}

	function openPKG_LCS_Popup(url) {
		var option = "width=850px, height=600px, scrollbars=yes, resizable=yes, statusbar=no";
		var sWin = window.open(url, "PKG_LCS_POPUP", option);
		sWin.focus();
	}

	function setErrorMsg(msgId, color, msg) {
		$("#" + msgId).css("color", color);
		$("#" + msgId).html(msg);
	}

	function openPopup4Mail(frm, url) {
		var sWin = window.open("about:blank", "netminer_manager_mail_popup", "menubar=no,toolbar=no,scrollbars=no,resizable=no,width=1100,height=900,status");

		frm.target = "netminer_manager_mail_popup";
		frm.action = url;
		frm.submit();
		sWin.focus();
	}
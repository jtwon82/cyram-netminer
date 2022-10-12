	function top_fn_moveHome() {
		top.location.href = "/manager/main/main-read.do";
	}
	
	function top_fn_logout() {
		doAjax("topModel", "/login/manager_login-delete.do", "", "top_fn_moveHome()");
	}

	function top_fn_setKorByAjax(kor) {
		$("#lang").val(kor);
	
		doAjax("topModel", "/common/layout/top_manager-update.do", "", "fn_reload()");
	}

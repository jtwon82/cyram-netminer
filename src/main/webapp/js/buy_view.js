/* fn_moveEnterprise는 사용하지 않는 듯*/
function fn_moveEnterprise() {
	var buyModel = document.getElementById("buyModel");
	buyModel.action = "/download_buy/buy/buyEnterprise-read.do";
	buyModel.submit();
}

function fn_moveSite() {
	var buyModel = document.getElementById("buyModel");
	buyModel.action = "/download_buy/buy/buySite-read.do";
	buyModel.submit();
}

function fn_moveUpgrage(upgradeType) {

	var buyModel = document.getElementById("buyModel");
	if (upgradeType == '6') {
		buyModel.action = "/download_buy/buy/upgradePackage-read.do";
	} else if (upgradeType == '7') {
		buyModel.action = "/download_buy/buy/upgradeVersion-read.do";
	} else if (upgradeType == '9') {
		buyModel.action = "/download_buy/download/download-readList.do";
	}
	buyModel.submit();
}

function fn_askEstimate() {
	buyModel.action = "/download_buy/buy/buyEnterprise-read.do";
	buyModel.submit();
}

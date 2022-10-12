package com.netminer.download_buy.buy.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;
import com.netminer.download_buy.buy.model.UpgradeModel;
import com.netminer.download_buy.buy.service.UpgradeServiceIf;
import com.netminer.manager.productpackage.model.PackageModel;

@Controller
public class UpgradeController extends CyframeController {

	@Inject
	private UpgradeServiceIf upgradeService;

	@RequestMapping("/download_buy/buy/upgradePackage-create.do")
	public String create_package(UpgradeModel upgradeModel, Model model) throws Exception {
	/*	login 상태일때
	 * if(buyEnterpriseModel.getSessionId()!= null){
			buyEnterpriseService.create(buyEnterpriseModel);
		}*/
		String[] pkgs = upgradeModel.getPackages();
		if(null != pkgs){
			List<PackageModel> pkgsNames = new ArrayList<PackageModel>(pkgs.length);
			for(int i=0; i<pkgs.length; ++i){
				PackageModel pm = new PackageModel();
				pm.setLabel(pkgs[i]);
				pkgsNames.add(i, pm);
			}
			upgradeModel.setPackageModelList(pkgsNames);
		}
		
		upgradeService.create_package(upgradeModel);
		return super.ajaxReturn();
	}

	@RequestMapping("/download_buy/buy/upgradeVersion-create.do")
	public String create_version(UpgradeModel upgradeModel, Model model) throws Exception {
	/*	login 상태일때
	 * if(buyEnterpriseModel.getSessionId()!= null){
			buyEnterpriseService.create(buyEnterpriseModel);
		}*/
		upgradeService.create_version(upgradeModel);
		return super.ajaxReturn();
	}
	
	@RequestMapping("/download_buy/buy/upgradePackage-read.do")
	public String read_package(UpgradeModel upgradeModel, Model model) throws Exception {
		upgradeModel =upgradeService.read_package(upgradeModel);
		model.addAttribute("upgradeModel", upgradeModel);
		
		return super.convertKor("/download_buy/buy/upgradePackage-read");
	}
	
	@RequestMapping("/download_buy/buy/upgradeVersion-read.do")
	public String read_version(UpgradeModel upgradeModel, Model model) throws Exception {
		model.addAttribute("upgradeModel", upgradeModel);
		
		return super.convertKor("/download_buy/buy/upgradeVersion-read");
	}

}


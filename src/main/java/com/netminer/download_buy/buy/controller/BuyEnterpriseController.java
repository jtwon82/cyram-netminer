package com.netminer.download_buy.buy.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;
import com.netminer.download_buy.buy.model.BuyEnterpriseModel;
import com.netminer.download_buy.buy.service.BuyEnterpriseServiceIf;

@Controller
public class BuyEnterpriseController extends CyframeController {

	@Inject
	private BuyEnterpriseServiceIf buyEnterpriseService;

	@RequestMapping("/download_buy/buy/buyEnterprise-create.do")
	public String create(BuyEnterpriseModel buyEnterpriseModel, Model model) throws Exception {
	/*	login 상태일때
	 * if(buyEnterpriseModel.getSessionId()!= null){
			buyEnterpriseService.create(buyEnterpriseModel);
		}*/
		buyEnterpriseService.create(buyEnterpriseModel);
		return super.ajaxReturn();
	}
	
	@RequestMapping("/download_buy/buy/buySite-create.do")
	public String create_site(BuyEnterpriseModel buyEnterpriseModel, Model model) throws Exception {
	
		buyEnterpriseService.create_site(buyEnterpriseModel);
		return super.ajaxReturn();
	}

	@RequestMapping("/download_buy/buy/buyEnterprise-read.do")
	public String read(BuyEnterpriseModel buyEnterpriseModel, Model model) throws Exception {
		model.addAttribute("buyEnterpriseModel", buyEnterpriseModel);
		
		return super.convertKor("/download_buy/buy/buyEnterprise-read");
	}
	
	@RequestMapping("/download_buy/buy/buySite-read.do")
	public String read_site(BuyEnterpriseModel buyEnterpriseModel, Model model) throws Exception {
		model.addAttribute("buyEnterpriseModel", buyEnterpriseModel);
		
		return super.convertKor("/download_buy/buy/buySite-read");
	}

}


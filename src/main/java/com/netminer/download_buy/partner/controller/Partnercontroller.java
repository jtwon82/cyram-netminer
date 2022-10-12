package com.netminer.download_buy.partner.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;



@Controller
public class Partnercontroller extends CyframeController {
	

	
	@RequestMapping("/download_buy/partner/partner-read.do")
	public String read(Model model) throws Exception {
//		model.addAttribute("buyEnterpriseModel", buyEnterpriseModel);
		
		return super.convertKor("/download_buy/partner/partner-read");
//		"/download_buy/partner/partner-read";
	}


}

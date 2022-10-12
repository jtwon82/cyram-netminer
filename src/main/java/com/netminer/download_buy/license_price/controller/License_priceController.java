package com.netminer.download_buy.license_price.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;
import com.cyframe.session.service.SessionServiceIf;

@Controller
public class License_priceController extends CyframeController {

	@Inject
	private SessionServiceIf sessionService;

	@RequestMapping("/download_buy/license_price/license_price.do")
	public String license_price(Model model) throws Exception {
		model.addAttribute("isLogin", sessionService.isLogin());
		model.addAttribute("isBuyer", sessionService.isBuyer());
		
		return super.convertKor("/download_buy/license_price/license_price");
	}

	@RequestMapping("/download_buy/license_price/license_price02.do")
	public String license_price02(Model model) throws Exception {
		model.addAttribute("isLogin", sessionService.isLogin());
		model.addAttribute("isBuyer", sessionService.isBuyer());
		
		return super.convertKor("/download_buy/license_price/license_price02");
	}
	
	@RequestMapping("/download_buy/license_price/license_price03.do")
	public String license_price03(Model model) throws Exception {
		model.addAttribute("isLogin", sessionService.isLogin());
		model.addAttribute("isBuyer", sessionService.isBuyer());
		
		return super.convertKor("/download_buy/license_price/license_price03");
	}
	
	@RequestMapping("/download_buy/license_price/license_price04.do")
	public String license_price04(Model model) throws Exception {
		model.addAttribute("isLogin", sessionService.isLogin());
		model.addAttribute("isBuyer", sessionService.isBuyer());
		
		return super.convertKor("/download_buy/license_price/license_price04");
	}
	
	@RequestMapping("/download_buy/license_price/license_price05.do")
	public String license_price05(Model model) throws Exception {
		model.addAttribute("isLogin", sessionService.isLogin());
		model.addAttribute("isBuyer", sessionService.isBuyer());
		
		return super.convertKor("/download_buy/license_price/license_price05");
	}
	
	@RequestMapping("/download_buy/license_price/license_price06.do")
	public String license_price06(Model model) throws Exception {
		model.addAttribute("isLogin", sessionService.isLogin());
		model.addAttribute("isBuyer", sessionService.isBuyer());
		
		return super.convertKor("/download_buy/license_price/license_price06");
	}
	
	@RequestMapping("/download_buy/license_price/price.do")
	public String price(Model model) throws Exception {
		model.addAttribute("isLogin", sessionService.isLogin());
		model.addAttribute("isBuyer", sessionService.isBuyer());
		
		return super.convertKor("/download_buy/license_price/price");
	}
	
}


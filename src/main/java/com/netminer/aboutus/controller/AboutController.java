package com.netminer.aboutus.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;
import com.cyframe.session.service.SessionServiceIf;

@Controller
public class AboutController extends CyframeController {

	@Inject
	private SessionServiceIf sessionService;

	@RequestMapping("/aboutus/publications.do")
	public String publications(Model model) throws Exception {
		model.addAttribute("isLogin", sessionService.isLogin());
		model.addAttribute("isBuyer", sessionService.isBuyer());
		model.addAttribute("isKor", sessionService.isKor());

		return super.convertKor("/aboutus/publications");
	}
 
	@RequestMapping("/aboutus/aboutus.do")
	public String aboutus(Model model) throws Exception {
		return super.convertKor("/aboutus/aboutus");
	}
	
	@RequestMapping("/aboutus/service.do")
	public String service(Model model) throws Exception {
		return super.convertKor("/aboutus/service");
	}
	
}


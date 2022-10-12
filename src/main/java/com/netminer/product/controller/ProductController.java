package com.netminer.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;

@Controller
public class ProductController extends CyframeController {

	@RequestMapping("/product/overview.do")
	public String overview(Model model) throws Exception {
		return super.convertKor("/product/overview");
	}

	@RequestMapping("/product/features.do")
	public String features(Model model) throws Exception {
		return super.convertKor("/product/features");
	}
	
	@RequestMapping("/product/extensions.do")
	public String extensions(Model model) throws Exception {
		return super.convertKor("/product/extensions");
	}
	
	@RequestMapping("/product/package01.do")
	public String package01(Model model) throws Exception {
		return super.convertKor("/product/package01");
	}
	
	@RequestMapping("/product/package02.do")
	public String package02(Model model) throws Exception {
		return super.convertKor("/product/package02");
	}
	
	@RequestMapping("/product/package03.do")
	public String package03(Model model) throws Exception {
		return super.convertKor("/product/package03");
	}
	
	@RequestMapping("/product/package04.do")
	public String package04(Model model) throws Exception {
		return super.convertKor("/product/package04");
	}
	
	@RequestMapping("/product/package05.do")
	public String package05(Model model) throws Exception {
		return super.convertKor("/product/package05");
	}
	
	@RequestMapping("/product/package06.do")
	public String package06(Model model) throws Exception {
		return super.convertKor("/product/package06");
	}
	
	@RequestMapping("/product/package07.do")
	public String package07(Model model) throws Exception {
		return super.convertKor("/product/package07");
	}
	
	@RequestMapping("/product/package08.do")
	public String package08(Model model) throws Exception {
		return super.convertKor("/product/package08");
	}
	
	@RequestMapping("/product/package09.do")
	public String package09(Model model) throws Exception {
		return super.convertKor("/product/package09");
	}
	
	@RequestMapping("/product/package10.do")
	public String package10(Model model) throws Exception {
		return super.convertKor("/product/package10");
	}
	
	@RequestMapping("/product/package11.do")
	public String package11(Model model) throws Exception {
		return super.convertKor("/product/package11");
	}
	
	@RequestMapping("/product/demo.do")
	public String demo(Model model) throws Exception {
		return "/product/demo";
	}
	
	@RequestMapping("/product/gallery.do")
	public String gallery(Model model) throws Exception {
		return "/product/gallery";
	}
	
	@RequestMapping("/product/systemrequirement.do")
	public String systemrequirement(Model model) throws Exception {
		return super.convertKor("/product/system_requirement");
	}
	
	@RequestMapping("/product/scalability_performance.do")
	public String scalability_performance(Model model) throws Exception {
		return super.convertKor("/product/scalability_performance");
	}
	
}


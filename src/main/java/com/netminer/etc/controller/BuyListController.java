package com.netminer.etc.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;
import com.netminer.manager.sale.model.SaleModel;
import com.netminer.manager.sale.service.SaleServiceIf;

@Controller
public class BuyListController extends CyframeController {

	@Inject
	private SaleServiceIf saleService;

	@RequestMapping("/buy-readList.do")
	public String readList(SaleModel saleModel, Model model) throws Exception {
		
		List<SaleModel> list = saleService.readList_sessionid(saleModel, true);
		
		model.addAttribute("list", list);
		
		return "/etc/buy-readList";
	}
	
}


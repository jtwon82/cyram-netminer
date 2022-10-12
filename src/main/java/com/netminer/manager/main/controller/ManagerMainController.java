package com.netminer.manager.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;
import com.netminer.manager.main.model.MainModel;

@Controller
public class ManagerMainController extends CyframeController {

	@RequestMapping("/manager/main/main-read.do")
	public String read(MainModel mainModel, Model model) throws Exception {
		model.addAttribute("mainModel", mainModel);
		
		return "/manager/main/main-read";
	}
	
}


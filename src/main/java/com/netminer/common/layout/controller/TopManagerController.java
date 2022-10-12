package com.netminer.common.layout.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;
import com.cyframe.model.ConstantModel;
import com.netminer.common.layout.model.TopModel;
import com.netminer.common.layout.service.TopServiceIf;

@Controller
public class TopManagerController extends CyframeController {

	@Inject
	private TopServiceIf topService;

	@RequestMapping("/common/layout/top_manager-read.do")
	public String read(TopModel topModel, Model model) throws Exception {
		model.addAttribute("topModel", topModel);
		return "/common/layout/top_manager-read";
	}

	@RequestMapping("/common/layout/top_manager-update.do")
	public String update(TopModel topModel, Model model) throws Exception {
		topService.update(topModel);

		return ConstantModel.AJAX_RETURN_URL;
	}
}
 

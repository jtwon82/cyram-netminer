package com.netminer.login.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;
import com.cyframe.model.ConstantModel;
import com.netminer.login.service.ManagerLoginServiceIf;
import com.netminer.manager.admin.model.AdminModel;

@Controller
public class ManagerLoginController extends CyframeController {

	@Inject
	private ManagerLoginServiceIf managerLoginService;

	@RequestMapping("/login/manager_login-create.do")
	public String create(AdminModel adminModel, Model model) throws Exception {
		managerLoginService.create(adminModel);
		
		model.addAttribute("adminModel", adminModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/login/manager_login-read.do")
	public String read(AdminModel adminModel, Model model) throws Exception {
		model.addAttribute("adminModel", new AdminModel());
		return "/login/manager_login-read";
	}
	
	@RequestMapping("/login/manager_login-delete.do")
	public String delete(AdminModel adminModel, Model model) throws Exception {
		managerLoginService.delete(adminModel);
		
		model.addAttribute("adminModel", adminModel);

		return ConstantModel.AJAX_RETURN_URL;
	}
}


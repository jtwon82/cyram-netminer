package com.netminer.manager.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;
import com.cyframe.model.ConstantModel;
import com.netminer.manager.admin.model.AdminModel;
import com.netminer.manager.admin.service.AdminServiceIf;

@Controller
public class AdminController extends CyframeController {

	@Inject
	private AdminServiceIf adminService;

	@RequestMapping("/manager/admin/admin-create.do")
	public String create(AdminModel adminModel, Model model) throws Exception {
		adminService.create(adminModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}

	@RequestMapping("/manager/admin/admin-readList.do")
	public String readList(AdminModel adminModel, Model model) throws Exception {
		List<AdminModel> list = adminService.readList(adminModel);
		
		model.addAttribute("list", list);
		
		return "/manager/admin/admin-readList";
	}
	
	@RequestMapping("/manager/admin/admin-read.do")
	public String read(AdminModel adminModel, Model model) throws Exception {
		AdminModel rAdminModel = adminService.read(adminModel);
		
		model.addAttribute("adminModel", rAdminModel);
		
		return "/manager/admin/admin-read";
	}
	
	@RequestMapping("/manager/admin/admin-update.do")
	public String update(AdminModel adminModel, Model model) throws Exception {
		adminService.update(adminModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
}


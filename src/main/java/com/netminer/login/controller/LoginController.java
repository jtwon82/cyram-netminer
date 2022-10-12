package com.netminer.login.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;
import com.cyframe.model.ConstantModel;
import com.cyframe.session.service.SessionServiceIf;
import com.netminer.login.service.LoginServiceIf;
import com.netminer.manager.nmuser.model.NmUserModel;

@Controller
public class LoginController extends CyframeController {

	@Inject
	private LoginServiceIf loginService;

	@Inject
	private SessionServiceIf sessionService;

	@RequestMapping("/login/login-create.do")
	public String create(NmUserModel nmUserModel, Model model) throws Exception {
		loginService.create(nmUserModel);
		
		model.addAttribute("nmUserModel", nmUserModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/login/login-read.do")
	public String read(NmUserModel nmUserModel, Model model) throws Exception {
		model.addAttribute("nmUserModel", new NmUserModel());
		return super.convertKor("/login/login-read");
	}
	
	@RequestMapping("/login/login-delete.do")
	public String delete(NmUserModel nmUserModel, Model model) throws Exception {
		loginService.delete(nmUserModel);
		
		model.addAttribute("nmUserModel", nmUserModel);

		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/login/forgot-password.do")
	public String forgotPassword(NmUserModel nmUserModel, Model model) throws Exception {
		return super.convertKor("/login/forgot-password");
	}
	
	@RequestMapping("/login/newpassword.do")
	public String newPassword(NmUserModel nmUserModel, Model model) throws Exception {
		nmUserModel = loginService.readAuto(nmUserModel);
		sessionService.setKor(nmUserModel.isKor());
		model.addAttribute("nmUserModel", nmUserModel);
		return super.convertKor("/login/newpassword");
	}
}


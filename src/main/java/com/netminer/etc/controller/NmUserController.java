package com.netminer.etc.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;
import com.cyframe.model.ConstantModel;
import com.cyframe.session.service.SessionServiceIf;
import com.netminer.manager.nmuser.model.NmUserModel;
import com.netminer.manager.nmuser.service.NmUserServiceIf;

/**
 * @author 009
 *
 */
@Controller
public class NmUserController extends CyframeController {

	@Inject
	private NmUserServiceIf nmUserService;

	@Inject
	private SessionServiceIf sessionService;
	
	@RequestMapping("/nmuser-create.do")
	public String create(NmUserModel nmUserModel, Model model) throws Exception {
		nmUserService.create(nmUserModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}

	@RequestMapping("/nmuser-read.do")
	public String read(NmUserModel nmUserModel, Model model) throws Exception {
		if(sessionService.isLogin()) {
			nmUserModel.setLoginid(sessionService.getSessionModel().getSessionId());
		}
		
		nmUserModel = nmUserService.read(nmUserModel);
		
		model.addAttribute("nmUserModel", nmUserModel);

		return "/etc/nmuser-read";
	}
	
	@RequestMapping("/nmuser-read-ajax.do")
	public String ajax_read(NmUserModel nmUserModel, Model model) throws Exception {
		nmUserModel.setPwd("");
		nmUserService.ajax_read(nmUserModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/nmuser-update.do")
	public String update(NmUserModel nmUserModel, Model model) throws Exception {
		nmUserService.update(nmUserModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/nmuser-mail-ajax.do")
	public String mail_read(NmUserModel nmUserModel, Model model) throws Exception {
		nmUserModel.setPwd("");
		nmUserService.forgotPassword(nmUserModel);
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	
}


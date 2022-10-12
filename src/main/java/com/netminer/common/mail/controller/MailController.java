package com.netminer.common.mail.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;
import com.cyframe.model.ConstantModel;
import com.netminer.common.mail.model.MailModel;
import com.netminer.common.mail.service.MailServiceIf;

/**
 * @author 009
 *
 */
@Controller
public class MailController extends CyframeController {

	@Inject
	private MailServiceIf mailService;

	@RequestMapping("/common/mail/mail-create.do")
	public String create(MailModel mailModel, Model model) throws Exception {
		mailService.create(mailModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}

	
}


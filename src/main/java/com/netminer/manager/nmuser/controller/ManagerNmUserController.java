package com.netminer.manager.nmuser.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;
import com.cyframe.model.ConstantModel;
import com.cyframe.property.PropertyServiceIf;
import com.netminer.common.util.PageNavigationTagUtil;
import com.netminer.manager.nmuser.model.NmUserModel;
import com.netminer.manager.nmuser.service.NmUserServiceIf;

/**
 * @author 009
 *
 */
@Controller
public class ManagerNmUserController extends CyframeController {

	@Inject
	private NmUserServiceIf nmUserService;

	@Inject
	private PropertyServiceIf propertyService;

	@RequestMapping("/manager/nmuser/nmuser-create.do")
	public String create(NmUserModel nmUserModel, Model model) throws Exception {
		nmUserService.create(nmUserModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}

	@RequestMapping("/manager/nmuser/nmuser-readList.do")
	public String readList(NmUserModel nmUserModel, Model model) throws Exception {
		nmUserModel.setListCount(propertyService.getInt("manager.board.list.count"));
		
		List<NmUserModel> list = nmUserService.readList(nmUserModel);

		model.addAttribute("list", list);
		model.addAttribute("moveLinkPageScript", PageNavigationTagUtil.getMoveLinkPageScript("nmUserModel"));
		model.addAttribute("moveLinkPagePrint", PageNavigationTagUtil.getMoveLinkPagePrint(nmUserModel.getListCount(), propertyService.getInt("manager.board.page.count"), nmUserModel.getTotalCount(), nmUserModel.getPageNo()));
		
		return "/manager/nmuser/nmuser-readList";
	}
	
	@RequestMapping("/manager/nmuser/nmuser-read.do")
	public String read(NmUserModel nmUserModel, Model model) throws Exception {
		NmUserModel rNmUserModel = nmUserService.read(nmUserModel);
		
		model.addAttribute("nmUserModel", rNmUserModel);

		return "/manager/nmuser/nmuser-read";
	}
	
	@RequestMapping("/manager/nmuser/nmuser-update.do")
	public String update(NmUserModel nmUserModel, Model model) throws Exception {
		nmUserService.update(nmUserModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/manager/nmuser/nmuser-delete.do")
	public String delete(NmUserModel nmUserModel, Model model) throws Exception {
		nmUserService.delete(nmUserModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
}


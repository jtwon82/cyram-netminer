package com.netminer.manager.settlement.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;
import com.cyframe.model.ConstantModel;
import com.cyframe.property.PropertyServiceIf;
import com.netminer.common.mail.model.MailModel;
import com.netminer.common.util.DateUtil;
import com.netminer.common.util.PageNavigationTagUtil;
import com.netminer.manager.settlement.model.SettlementModel;
import com.netminer.manager.settlement.service.SettlementServiceIf;

/**
 * @author 009
 *
 */
@Controller
public class SettlementController extends CyframeController {

	@Inject
	private SettlementServiceIf settlementService;

	@Inject
	private PropertyServiceIf propertyService;

	@RequestMapping("/manager/settlement/settlement-create.do")
	public String create(SettlementModel settlementModel, Model model) throws Exception {
		settlementService.create(settlementModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}

	@RequestMapping("/manager/settlement/settlement-readList.do")
	public String readList(SettlementModel settlementModel, Model model) throws Exception {
		String s_year = settlementModel.getS_year();
		
		if(s_year == null || "".equals(s_year)) {
			String today = DateUtil.dailyformat();
			
			settlementModel.setS_year(today.substring(0, 4));
			settlementModel.setS_month(today.substring(4, 6));
			settlementModel.setS_day(today.substring(6, 8));
			
			settlementModel.setE_year(today.substring(0, 4));
			settlementModel.setE_month(today.substring(4, 6));
			settlementModel.setE_day(today.substring(6, 8));
		}

		settlementModel.setListCount(propertyService.getInt("manager.board.list.count"));
		
		List<SettlementModel> list = settlementService.readList(settlementModel);

		model.addAttribute("settlementModel", settlementModel);
		model.addAttribute("list", list);
		model.addAttribute("moveLinkPageScript", PageNavigationTagUtil.getMoveLinkPageScript("settlementModel"));
		model.addAttribute("moveLinkPagePrint", PageNavigationTagUtil.getMoveLinkPagePrint(settlementModel.getListCount(), propertyService.getInt("manager.board.page.count"), settlementModel.getTotalCount(), settlementModel.getPageNo()));
		
		return "/manager/settlement/settlement-readList";
	}
	
	@RequestMapping("/manager/settlement/settlement-read.do")
	public String read(SettlementModel settlementModel, Model model) throws Exception {
		SettlementModel rSettlementModel = settlementService.read(settlementModel);
		
		model.addAttribute("settlementModel", rSettlementModel);

		return "/manager/settlement/settlement-read";
	}
	
	@RequestMapping("/manager/settlement/settlement_mailPayment-popup.do")
	public String popup_sendMailPayment(SettlementModel settlementModel, Model model) throws Exception {
		
		MailModel mailModel = settlementService.popup_sendMailPayment(settlementModel);

		model.addAttribute("mailModel", mailModel);
		
		return "/common/mail/mail-popup";
	}

	@RequestMapping("/manager/settlement/settlement-update.do")
	public String update(SettlementModel settlementModel, Model model) throws Exception {
		settlementService.update(settlementModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/manager/settlement/settlement-delete.do")
	public String delete(SettlementModel settlementModel, Model model) throws Exception {
		settlementService.delete(settlementModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
}


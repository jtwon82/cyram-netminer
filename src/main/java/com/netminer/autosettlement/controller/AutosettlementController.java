package com.netminer.autosettlement.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;
import com.cyframe.model.ConstantModel;
import com.cyframe.property.PropertyServiceIf;
import com.netminer.manager.settlement.model.SettlementModel;
import com.netminer.manager.settlement.service.SettlementServiceIf;

@Controller
public class AutosettlementController extends CyframeController {

	@Inject
	private SettlementServiceIf settlementService;

	@Inject
	private PropertyServiceIf propertyService;

	@RequestMapping("/autosettlement/autosettlement-popup.do")
	public String popup_readList(HttpServletRequest request, SettlementModel settlementModel, Model model) throws Exception {
		settlementModel = settlementService.read_auto(settlementModel);
		
		//as-is 소스 그대로 옮김
		if("domestic".equals(settlementModel.getS_location())) {
			StringBuffer script = new StringBuffer();
			script.append("<script language=\"javascript\" src=\"");
			script.append(request.getScheme() + "://xpay.uplus.co.kr");

			if("test".equals(settlementModel.getCST_PLATFORM())) {
				if("https".equals(request.getScheme())) {
					script.append(":7443");
				} else {
					script.append(":7080");
				}
			} else {
				script.append("");
			}
					
			script.append("/xpay/js/xpay_crossplatform.js\" type=\"text/javascript\">");
			script.append("</script>");
			
			settlementModel.setSCRIPT(script.toString());

			settlementModel.setS_price(String.format("%,d", Integer.parseInt(settlementModel.getS_price())));
			
			model.addAttribute("settlementModel", settlementModel);
			return "/autosettlement/autosettlement-popup_kr";
		} else {
			model.addAttribute("settlementModel", settlementModel);
			return "/autosettlement/autosettlement-popup";
		}
	}
	
	@RequestMapping("/autosettlement/settlementpaidcomplete-popup.do")
	public String popup_read(HttpServletRequest request, SettlementModel settlementModel, Model model) throws Exception {
		request.setAttribute("configPath", propertyService.getString("pay.CONFIG_PATH"));
		request.setAttribute("platform", propertyService.getString("pay.TYPE"));
		request.setAttribute("mid", propertyService.getString("pay.MID"));
		model.addAttribute("settlementModel", settlementModel);
		return "/autosettlement/settlementpaidcomplete-popup_kr";
	}
	
	@RequestMapping("/autosettlement/settlementpaidcomplete-update.do")
	public String popup_update(HttpServletRequest request, SettlementModel settlementModel, Model model) throws Exception {
		settlementService.update_status(settlementModel);

		return ConstantModel.AJAX_RETURN_URL;
	}
	
}


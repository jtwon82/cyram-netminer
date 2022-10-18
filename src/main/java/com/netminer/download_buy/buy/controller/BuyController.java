package com.netminer.download_buy.buy.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cyframe.controller.CyframeController;
import com.cyframe.property.PropertyServiceIf;
import com.netminer.download_buy.buy.model.BuyModel;
import com.netminer.download_buy.buy.service.BuyServiceIf;
import com.netminer.manager.sale.model.SaleModel;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BuyController extends CyframeController {

	@Inject
	private BuyServiceIf buyService;

	@Inject
	private PropertyServiceIf propertyService;

	@RequestMapping("/download_buy/buy/buy-create.do")
	public String create(BuyModel buyModel, Model model) throws Exception {
		String[] saleids = buyService.create(buyModel);
		
		model.addAttribute("saleids", saleids);
		model.addAttribute("buyModel", buyModel);
		
		return "/download_buy/buy/buy_create_return-ajax";
	}

	@RequestMapping("/download_buy/buy/buy-view.do")
	public String view(BuyModel buyModel, Model model) throws Exception {
		
		return super.convertKor("/download_buy/buy/buy-view");
	}
	
	@RequestMapping("/download_buy/buy/buy-read.do")
	public String read(BuyModel buyModel, Model model) throws Exception {
		BuyModel rBuyModel = buyService.read(buyModel);
		
		model.addAttribute("buyModel", rBuyModel);
		
		return super.convertKor("/download_buy/buy/buy-read");
	}
	
	@RequestMapping("/download_buy/buy/buy_package-ajax.do")
	public String package_ajax_read(BuyModel buyModel, Model model) throws Exception {
		BuyModel rBuyModel = buyService.read_package(buyModel);
		
		model.addAttribute("buyModel", rBuyModel);

		return "/download_buy/buy/buy_package-ajax";
	}
	
	@RequestMapping("/download_buy/buy/buy_edition-ajax.do")
	public String edition_ajax_read(BuyModel buyModel, Model model) throws Exception {
		BuyModel rBuyModel = buyService.read_edition(buyModel);
		
		model.addAttribute("buyModel", rBuyModel);

		return "/download_buy/buy/buy_edition-ajax";
	}
	
	@RequestMapping("/download_buy/buy/buy_extension-ajax.do")
	public String extension_ajax_read(BuyModel buyModel, Model model) throws Exception {
		BuyModel rBuyModel = buyService.readExtension(buyModel);
		model.addAttribute("buyModel", rBuyModel);

		return "/download_buy/buy/buy_extension-ajax";
	}
	
	@RequestMapping("/download_buy/buy/buy_editionpackage-ajax.do")
	public String editionPackage_ajax_read(BuyModel buyModel, Model model) throws Exception {
		BuyModel rBuyModel = buyService.read_editionpackage(buyModel);
		
		model.addAttribute("buyModel", rBuyModel);

		return "/download_buy/buy/buy_editionpackage-ajax";
	}
	@RequestMapping("/download_buy/buy/buy_ok_Student_courcework-view.do")
	public String view_ok_Student_courcework(BuyModel buyModel, Model model) throws Exception {
		return super.convertKor("/download_buy/buy/buy_ok_Student_courcework-view");
	}

	@RequestMapping("/download_buy/buy/buy_ok_Research_academic-view.do")
	public String view_ok_Research_academic(BuyModel buyModel, Model model) throws Exception {
		return super.convertKor("/download_buy/buy/buy_ok_Research_academic-view");
	}

	@RequestMapping("/download_buy/buy/buy_ok_commercial-view.do")
	public String view_ok_Research_commercial(BuyModel buyModel, Model model) throws Exception {
		return super.convertKor("/download_buy/buy/buy_ok_commercial-view");
	}

	@RequestMapping("/download_buy/buy/buy_ok_Account_transfer-view.do")
	public String view_ok_Account_transfer(BuyModel buyModel, Model model) throws Exception {
		buyModel.setTotal(String.format("%s", buyModel.getTotal()));
		model.addAttribute("buyModel", buyModel);
		
		return super.convertKor("/download_buy/buy/buy_ok_Account_transfer-view");
	}

	@RequestMapping("/download_buy/buy/buycomplete-popup.do")
	public String buyBuy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("configPath", propertyService.getString("pay.CONFIG_PATH"));
		request.setAttribute("platform", propertyService.getString("pay.TYPE"));
		request.setAttribute("mid", propertyService.getString("pay.MID"));
		return super.convertKor("/download_buy/buy/buycomplete-popup");
	}
	

	@RequestMapping("/download_buy/buy/free-read.do")
	public String readFree(SaleModel saleModel, Model model) throws Exception {
//		SaleModel saleModel = buyService.readFree(saleModel);
		
		model.addAttribute("saleModel", buyService.readFree(saleModel));
		
		return super.convertKor("/download_buy/buy/free-read");
	}
	@RequestMapping("/download_buy/buy/free-read-popup.do")
	public String readFreePopup(SaleModel saleModel, Model model) throws Exception {
		model.addAttribute("popup", "popup");
		model.addAttribute("saleModel", buyService.readFree(saleModel));
		return super.convertKor("/download_buy/buy/free-read");
	}
	@RequestMapping("/download_buy/buy/free-create.do")
	public @ResponseBody String createFree(SaleModel saleModel) throws Exception {
		if("".equals(saleModel.getSessionId())) {
			return "NOT_FOUND_LOGINID";
		}
		else {
			buyService.createFree(saleModel);
		}
		log.info(String.format("saleModel %s", saleModel));
		
		return "SUCCESS";
	}
}


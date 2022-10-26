package com.netminer.manager.sale.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;
import com.cyframe.model.ConstantModel;
import com.cyframe.property.PropertyServiceIf;
import com.netminer.common.mail.model.MailModel;
import com.netminer.common.util.AttachFileTagUtil;
import com.netminer.common.util.DateUtil;
import com.netminer.common.util.MailMessageUtil;
import com.netminer.common.util.PageNavigationTagUtil;
import com.netminer.manager.productpackage.model.ProductpackageModel;
import com.netminer.manager.sale.model.SaleLicenseModel;
import com.netminer.manager.sale.model.SaleModel;
import com.netminer.manager.sale.service.SaleServiceIf;

/**
 * @author 009
 *
 */
@Controller
public class SaleController extends CyframeController {

	@Inject
	private SaleServiceIf saleService;

	@Inject
	private PropertyServiceIf propertyService;

	@RequestMapping("/manager/sale/sale-create.do")
	public String create(SaleModel saleModel, Model model) throws Exception {
		saleService.create(saleModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}

	@RequestMapping("/manager/sale/sale_copy-create.do")
	public String create_copy(SaleModel saleModel, Model model) throws Exception {
		saleService.create_copy(saleModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/manager/sale/sale-readList.do")
	public String readList(SaleModel saleModel, Model model) throws Exception {
		String s_year = saleModel.getS_year();
		
		if(s_year == null || "".equals(s_year)) {
			String today = DateUtil.dailyformat();
			
			saleModel.setS_year(today.substring(0, 4));
			saleModel.setS_month(today.substring(4, 6));
			saleModel.setS_day(today.substring(6, 8));
			
			saleModel.setE_year(today.substring(0, 4));
			saleModel.setE_month(today.substring(4, 6));
			saleModel.setE_day(today.substring(6, 8));
		}

		saleModel.setListCount(propertyService.getInt("manager.board.list.count"));
		
		List<SaleModel> list = saleService.readList(saleModel);

		model.addAttribute("saleModel", saleModel);
		model.addAttribute("list", list);
		model.addAttribute("moveLinkPageScript", PageNavigationTagUtil.getMoveLinkPageScript("saleModel"));
		model.addAttribute("moveLinkPagePrint", PageNavigationTagUtil.getMoveLinkPagePrint(saleModel.getListCount(), propertyService.getInt("manager.board.page.count"), saleModel.getTotalCount(), saleModel.getPageNo()));
		
		return "/manager/sale/sale-readList";
	}
	
	@RequestMapping("/manager/sale/sale-read.do")
	public String read(SaleModel saleModel, Model model) throws Exception {
		SaleModel rSaleModel = saleService.read(saleModel);
		
		model.addAttribute("saleModel", rSaleModel);

		return "/manager/sale/sale-read";
	}

	
	@RequestMapping("/manager/sale/productPackage-ajax.do")
	public String productPackage_read(SaleModel saleModel, Model model) throws Exception {
		SaleModel rSaleModel = saleService.getProductpackagePriceList(saleModel);
		
		model.addAttribute("saleModel", rSaleModel);

		return "/manager/sale/productPackage-ajax";
	}
	
	@RequestMapping("/manager/sale/sale_mailLicense-popup.do")
	public String popup_sendMailLicense(SaleModel saleModel, Model model) throws Exception {

		String[] pkgs = saleModel.getPackages();
		if(null != pkgs) {
			List<ProductpackageModel> pkgsNames = new ArrayList<ProductpackageModel>(pkgs.length);
			for(int i = 0; i < pkgs.length; ++i) {
				ProductpackageModel pm = new ProductpackageModel();
				pm.setSubcategory(getPackageName(pkgs[i]));
				pkgsNames.add(i, pm);
			}
			saleModel.setSalePackageModelList(pkgsNames);
		}
		
		MailModel mailModel = saleService.popup_sendMailLicense(saleModel);
		
		model.addAttribute("mailModel", mailModel);
		model.addAttribute("attachFileButton", AttachFileTagUtil.getAttachFileButton());
		model.addAttribute("attachFileScript", AttachFileTagUtil.getAttachFileScript());
		
		return "/common/mail/mail-popup";
	}
	
	
	private String getPackageName(String pkg) {
		if(pkg.equals("0") || pkg.equals("1")) {
			return "Framework";
		}
		if(pkg.equals("2") || pkg.equals("3") || pkg.equals("4")) {
			return "Basic Package";
		}
		if(pkg.equals("5") || pkg.equals("6") || pkg.equals("7")) {
			return "Analysis";
		}
		if(pkg.equals("30") || pkg.equals("50") || pkg.equals("70") || pkg.equals("90") || pkg.equals("110") || pkg.equals("130") || pkg.equals("150") || pkg.equals("170") || pkg.equals("190") || pkg.equals("210") || pkg.equals("230") || pkg.equals("250") || pkg.equals("270") || pkg.equals("290")) {
			return "Framework & Basic Packages";
		}
		if(pkg.equals("35") || pkg.equals("55") || pkg.equals("75") || pkg.equals("95") || pkg.equals("115") || pkg.equals("135") || pkg.equals("155") || pkg.equals("175") || pkg.equals("195") || pkg.equals("215") || pkg.equals("235") || pkg.equals("255") || pkg.equals("275") || pkg.equals("295")) {
			return "Script";
		}
		if(pkg.equals("36") || pkg.equals("56") || pkg.equals("76") || pkg.equals("96") || pkg.equals("116") || pkg.equals("136") || pkg.equals("156") || pkg.equals("176") || pkg.equals("196") || pkg.equals("216") || pkg.equals("236") || pkg.equals("256") || pkg.equals("276") || pkg.equals("296")) {
			return "Advanced Analysis";
		}
		if(pkg.equals("8") || pkg.equals("9") || pkg.equals("39") || pkg.equals("59") || pkg.equals("79") || pkg.equals("99") || pkg.equals("119") || pkg.equals("139") || pkg.equals("159") || pkg.equals("179") || pkg.equals("199") || pkg.equals("219") || pkg.equals("239") || pkg.equals("259") || pkg.equals("279") || pkg.equals("299")) {
			return "Exploration";
		}
		if(pkg.equals("10") || pkg.equals("12") || pkg.equals("13")) {
			return "Visualization";
		}
		if(pkg.equals("41") || pkg.equals("61") || pkg.equals("81") || pkg.equals("101") || pkg.equals("121") || pkg.equals("141") || pkg.equals("161") || pkg.equals("181") || pkg.equals("201") || pkg.equals("221") || pkg.equals("241") || pkg.equals("261") || pkg.equals("281") || pkg.equals("301")) {
			return "Advanced Visualization";
		}
		if(pkg.equals("14") || pkg.equals("15")) {
			return "Statistics";
		}
		if(pkg.equals("44") || pkg.equals("64") || pkg.equals("84") || pkg.equals("104") || pkg.equals("124") || pkg.equals("144") || pkg.equals("164") || pkg.equals("184") || pkg.equals("204") || pkg.equals("224") || pkg.equals("244") || pkg.equals("264") || pkg.equals("284") || pkg.equals("304")) {
			return "Statistics & Mining";
		}
		if(pkg.equals("16") || pkg.equals("21") || pkg.equals("23") || pkg.equals("46") || pkg.equals("66") || pkg.equals("86") || pkg.equals("106") || pkg.equals("126") || pkg.equals("146") || pkg.equals("166") || pkg.equals("186") || pkg.equals("206") || pkg.equals("226") || pkg.equals("246") || pkg.equals("266") || pkg.equals("286") || pkg.equals("306")) {
			return "Tools";
		}
		if(pkg.equals("24")) {
			return "Manual";
		}
		if(pkg.equals("49") || pkg.equals("69") || pkg.equals("89") || pkg.equals("109") || pkg.equals("129") || pkg.equals("149") || pkg.equals("169") || pkg.equals("189") || pkg.equals("209") || pkg.equals("229") || pkg.equals("249") || pkg.equals("269") || pkg.equals("289") || pkg.equals("309")) {
			return "Database";
		}
		return "";
	}
	
	@RequestMapping("/manager/sale/sale_mailApproval-popup.do")
	public String popup_sendMailApproval(SaleModel saleModel, Model model) throws Exception {
		
		MailModel mailModel = saleService.popup_sendMailApproval(saleModel);

		model.addAttribute("mailModel", mailModel);
		
		return "/common/mail/mail-popup";
	}
	
	@RequestMapping("/manager/sale/sale-update.do")
	public String update(SaleModel saleModel, Model model) throws Exception {
		saleService.update(saleModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/manager/sale/sale_license-update.do")
	public String update_license(SaleModel saleModel, Model model) throws Exception {
		saleService.update_license(saleModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/manager/sale/sale_license-create.do")
	public String create_license(SaleModel saleModel, Model model) throws Exception {
//		saleService.create_license(saleModel);
		SaleLicenseModel licenseModel = saleService.create_license(saleModel);
		System.out.println("licenseModel : "+licenseModel.getLicense());
		
		model.addAttribute("saleLicenseModel", licenseModel);
		return "/manager/sale/license-return";
//		return "/manager/sale/sale-read";
	}
	
	@RequestMapping("/manager/sale/editionPackage-ajax.do")
	public String editonPackage_read(SaleModel saleModel, Model model) throws Exception {
		SaleModel smodel =saleService.editionPackage_read(saleModel);
		model.addAttribute("saleModel", smodel);
		return "/manager/sale/editionPackage-ajax";
	}
	
	@RequestMapping("/manager/sale/sale_hardwareRegist-update.do")
	public String update_hardwareRegist(SaleModel saleModel, Model model) throws Exception {
		saleService.update_hardwareRegist(saleModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/manager/sale/sale_hardwareReset-update.do")
	public String update_hardwareReset(SaleModel saleModel, Model model) throws Exception {
		saleService.update_hardwareReset(saleModel);
		saleService.delete_hardwareReset(saleModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/manager/sale/sale-delete.do")
	public String delete(SaleModel saleModel, Model model) throws Exception {
		saleService.delete(saleModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	

	@RequestMapping("/manager/sale/free-readList.do")
	public String readFreeList(SaleModel saleModel, Model model) throws Exception {
		String s_year = saleModel.getS_year();
		
		if(s_year == null || "".equals(s_year)) {
			String today = DateUtil.dailyformat();
			
			saleModel.setS_year(today.substring(0, 4));
			saleModel.setS_month(today.substring(4, 6));
			saleModel.setS_day(today.substring(6, 8));
			
			saleModel.setE_year(today.substring(0, 4));
			saleModel.setE_month(today.substring(4, 6));
			saleModel.setE_day(today.substring(6, 8));
		}

		saleModel.setListCount(propertyService.getInt("manager.board.list.count"));
		
		List<SaleModel> list = saleService.readFreeList(saleModel);

		model.addAttribute("saleModel", saleModel);
		model.addAttribute("list", list);
		model.addAttribute("moveLinkPageScript", PageNavigationTagUtil.getMoveLinkPageScript("saleModel"));
		model.addAttribute("moveLinkPagePrint", PageNavigationTagUtil.getMoveLinkPagePrint(saleModel.getListCount(), propertyService.getInt("manager.board.page.count"), saleModel.getTotalCount(), saleModel.getPageNo()));
		
		return "/manager/sale/free-readList";
	}
	

	@RequestMapping(value="/common/download_excel-read.do")
	public void readFreeListExcel(SaleModel saleModel
			, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String s_year = saleModel.getS_year();
		
		if(s_year == null || "".equals(s_year)) {
			String today = DateUtil.dailyformat();
			
			saleModel.setS_year(today.substring(0, 4));
			saleModel.setS_month(today.substring(4, 6));
			saleModel.setS_day(today.substring(6, 8));
			
			saleModel.setE_year(today.substring(0, 4));
			saleModel.setE_month(today.substring(4, 6));
			saleModel.setE_day(today.substring(6, 8));
		}

		saleModel.setListCount(100000);
		
		List<SaleModel> list = saleService.readFreeList(saleModel);
		StringBuffer listSb= new StringBuffer();
		for(SaleModel row: list) {
			listSb.append("<tr height='50'>");
			listSb.append(String.format("<td>%s</td>", row.getSaledate()));
			listSb.append(String.format("<td>%s</td>", row.getAPPLCNT_NM()));
			listSb.append(String.format("<td>%s</td>", row.getNATION_NAME_KR()));
			listSb.append(String.format("<td>%s</td>", row.getPSITN_INSTT()));
			listSb.append(String.format("<td>%s</td>", row.getPSITN_SUBJCT()));
			listSb.append(String.format("<td>%s</td>", row.getCHARGER_EMAIL()));
			listSb.append(String.format("<td>%s</td>", row.getLCTRE_NM()));
			listSb.append(String.format("<td>%s</td>", row.getATNLC_NMPR()));
			listSb.append(String.format("<td>%s</td>", row.getLCTRE_INTRCN()));
			listSb.append(String.format("<td>%s</td>", row.getOrgname()));
			listSb.append(String.format("<td>%s</td>", row.getAgree3()));
			listSb.append(String.format("<td>%s</td>", row.getRESULT()));
			listSb.append("</tr>");
		}
		saleModel.setExcelcontent(listSb.toString());

		String content= MailMessageUtil
				.generateContents(saleModel, propertyService.getString("mail.template.Path") + "excel-free-readList");
		
		response.setHeader("Content-Disposition", String.format("attachment; filename=free-readList.%s.xls", DateUtil.getDate("yyyy-MM-dd", new Date())));
		response.setHeader("Content-Type", "application/vnd.ms-excel; charset=utf-8");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
		response.setContentLength(content.length());
		response.setCharacterEncoding("UTF-8");
        
        IOUtils.copy(new ByteArrayInputStream(content.getBytes("UTF-8")), response.getOutputStream());
	}
	
	@RequestMapping("/manager/sale/free-read.do")
	public String readFree(SaleModel saleModel, Model model) throws Exception {
		SaleModel rSaleModel = saleService.readFree(saleModel);
		
		model.addAttribute("saleModel", rSaleModel);

		return "/manager/sale/free-read";
	}
	
	@RequestMapping("/manager/sale/free-update.do")
	public String updateFree(SaleModel saleModel, Model model) throws Exception {
		saleService.updateFree(saleModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/manager/sale/free-delete.do")
	public String deleteFree(SaleModel saleModel, Model model) throws Exception {
		saleService.deleteFree(saleModel);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
}


package com.netminer.download_buy.download.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;
import com.cyframe.property.PropertyServiceIf;
import com.netminer.common.util.FileDownloadUtil;
import com.netminer.download_buy.download.model.DownloadModel;
import com.netminer.manager.sale.model.SaleModel;
import com.netminer.manager.sale.service.SaleServiceIf;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DownloadController extends CyframeController {

	@Inject
	private PropertyServiceIf propertyService;
	
	@Inject
	private SaleServiceIf saleService;

	@RequestMapping("/download_buy/download/download-readList.do")
	public String readList(DownloadModel downloadModel, Model model) throws Exception {
		SaleModel saleModel = new SaleModel();
		saleModel.setSessionId(downloadModel.getSessionId());
		
		List<SaleModel> list = saleService.readList_sessionid(saleModel, false);
		
		//구매내역이 있는 사람만 32,64
		if(list != null && list.size() > 0) {
			downloadModel.setAccount(true);
		}
		model.addAttribute("downloadModel", downloadModel);

		return super.convertKor("/download_buy/download/download-readList");
	}
	
	@RequestMapping("/download_buy/download/download-read.do")
	public void read(DownloadModel downloadModel, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String fileName = downloadModel.getFileName();
		log.debug("biblio name : ", propertyService.getString("netminer.file.bibliocollector"));
		if("viewer".equals(fileName)) {
			FileDownloadUtil.download(request, response, propertyService.getString("license.file.Path") + propertyService.getString("netminer.file.viewer"), propertyService.getString("netminer.file.viewer"));
		} else if("eva".equals(fileName)) {
			if(downloadModel.isAskMail()) {
				saleService.setTutorialMail(downloadModel);
			}
			FileDownloadUtil.download(request, response, propertyService.getString("license.file.Path") + propertyService.getString("netminer.file.eva"), propertyService.getString("netminer.file.eva"));
		} else if("32".equals(fileName)) {
			FileDownloadUtil.download(request, response, propertyService.getString("license.file.Path") + propertyService.getString("netminer.file.32"), propertyService.getString("netminer.file.32"));
		} else if("64".equals(fileName)) {
			FileDownloadUtil.download(request, response, propertyService.getString("license.file.Path") + propertyService.getString("netminer.file.64"), propertyService.getString("netminer.file.64"));
		}else if("ko_eva".equals(fileName)) {
			if(downloadModel.isAskMail()) {
				saleService.setTutorialMail(downloadModel);
			}
			FileDownloadUtil.download(request, response, propertyService.getString("license.ko_file.Path") + propertyService.getString("netminer.file.ko_eva"), propertyService.getString("netminer.file.ko_eva"));
		}else if("ko_32".equals(fileName)) {
			FileDownloadUtil.download(request, response, propertyService.getString("license.ko_file.Path") + propertyService.getString("netminer.file.ko_32"), propertyService.getString("netminer.file.ko_32"));
		}else if("ko_64".equals(fileName)) {
			FileDownloadUtil.download(request, response, propertyService.getString("license.ko_file.Path") + propertyService.getString("netminer.file.ko_64"), propertyService.getString("netminer.file.ko_64"));
		}else if("sns".equals(fileName)) {
			saleService.saveSdcRecord(downloadModel);
			FileDownloadUtil.download(request, response, propertyService.getString("license.file.Path") + propertyService.getString("netminer.file.snscollector"), propertyService.getString("netminer.file.snscollector"));
		} else if ("sns64".equals(fileName)) {
			saleService.saveSdcRecord(downloadModel);
			FileDownloadUtil.download(request, response,
					propertyService.getString("license.file.Path")
							+ propertyService.getString("netminer.file.snscollector64"),
					propertyService.getString("netminer.file.snscollector64"));
		} else if ("bibl".equals(fileName)) {
			saleService.saveSdcRecord(downloadModel);
			FileDownloadUtil.download(request, response,
					propertyService.getString("license.file.Path")
							+ propertyService.getString("netminer.file.bibliocollector"),
					propertyService.getString("netminer.file.bibliocollector"));
		} else if ("bibl64".equals(fileName)) {
			saleService.saveSdcRecord(downloadModel);
			FileDownloadUtil.download(request, response,
					propertyService.getString("license.file.Path")
							+ propertyService.getString("netminer.file.bibliocollector64"),
					propertyService.getString("netminer.file.bibliocollector64"));
		}
	}
}


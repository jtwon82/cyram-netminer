package com.netminer.download_buy.buy.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;
import com.cyframe.property.PropertyServiceIf;
import com.netminer.download_buy.buy.model.BuyModel;

@Controller
public class PayController extends CyframeController {

	@Inject
	private PropertyServiceIf propertyService;

	@RequestMapping("/download_buy/buy/lg-popup.do")
	public String read_lg(BuyModel buyModel, Model model) throws Exception {
		buyModel.setPlatform(propertyService.getString("pay.TYPE"));
		model.addAttribute("buyModel", buyModel);
		return "/download_buy/buy/lg-popup2";
	}

	@RequestMapping("/download_buy/buy/paypal-popup.do")
	public String read_paypal(BuyModel buyModel, Model model) throws Exception {
		buyModel.setEncrypted_ret_url(propertyService.getString("server.url"));
		model.addAttribute("buyModel", buyModel);
		
		return "/download_buy/buy/paypal-popup";
	}
	
	@RequestMapping("/download_buy/buy/lg_success-popup.do")
	public String read_lg_success(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//test code
//		String key = "";
//		String[] values = null;
//		Map.Entry<?, ?> entry = null;
//
//		Map<?,?> map = request.getParameterMap();
//		
//		Set<?> set = map.entrySet();
//		Iterator<?> it = set.iterator();
//		
//		while(it.hasNext()) {
//			entry = (Map.Entry<?, ?>) it.next();
//			key = (String) entry.getKey();
//			values = (String[]) entry.getValue();
//			
//			for(String value : values) {
//				System.out.println(key + " -- " + value);
//			}
//		}
		
		return "/download_buy/buy/lg_success-popup";
	}
	
	@RequestMapping("/download_buy/buy/lg_fail-popup.do")
	public String read_lg_fail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//test code
//		String key = "";
//		String[] values = null;
//		Map.Entry<?, ?> entry = null;
//		
//		Map<?,?> map = request.getParameterMap();
//		
//		Set<?> set = map.entrySet();
//		Iterator<?> it = set.iterator();
//		
//		while(it.hasNext()) {
//			entry = (Map.Entry<?, ?>) it.next();
//			key = (String) entry.getKey();
//			values = (String[]) entry.getValue();
//			
//			for(String value : values) {
//				System.out.println(key + " -- " + value);
//			}
//		}
		
		//TODO 실패 시 다시 하게끔 유도해야 함
		
		return "/download_buy/buy/lg_success-popup";
	}
	
	@RequestMapping("/download_buy/buy/paypal_success-popup.do")
	public String read_paypal_success(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//test code
//		String key = "";
//		String[] values = null;
//		Map.Entry<?, ?> entry = null;
//
//		Map<?,?> map = request.getParameterMap();
//		
//		Set<?> set = map.entrySet();
//		Iterator<?> it = set.iterator();
//		
//		while(it.hasNext()) {
//			entry = (Map.Entry<?, ?>) it.next();
//			key = (String) entry.getKey();
//			values = (String[]) entry.getValue();
//			
//			for(String value : values) {
//				System.out.println(key + " -- " + value);
//			}
//		}
		
		return "/download_buy/buy/paypal_success-popup";
	}
	
	@RequestMapping("/download_buy/buy/paypal_fail-popup.do")
	public String read_paypal_fail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//test code
//		String key = "";
//		String[] values = null;
//		Map.Entry<?, ?> entry = null;
//		
//		Map<?,?> map = request.getParameterMap();
//		
//		Set<?> set = map.entrySet();
//		Iterator<?> it = set.iterator();
//		
//		while(it.hasNext()) {
//			entry = (Map.Entry<?, ?>) it.next();
//			key = (String) entry.getKey();
//			values = (String[]) entry.getValue();
//			
//			for(String value : values) {
//				System.out.println(key + " -- " + value);
//			}
//		}
		
		//TODO 실패 시 다시 하게끔 유도해야 함
		
		return "/download_buy/buy/paypal_success-popup";
	}
	
}


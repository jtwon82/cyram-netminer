package com.netminer.community.faq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.netminer.common.board.controller.BoardController;
import com.netminer.common.board.model.BoardModel;

@Controller
public class FaqController extends BoardController {

	@Override
	protected int setBoardListCount() {
		return 10;
	}

	@Override
	protected int setBoardPageCount() {
		return 10;
	}
	
	
	
	@RequestMapping("/community/faq/faq-readList.do")
	public String readList(BoardModel boardModel, Model model) throws Exception {
		boardModel.setOrderby("wr_id ASC");
		super._readList(boardModel, model);
		
		return "/community/faq/faq-readList";
	}
	
//	@RequestMapping("/product/features.do")
//	public String features(Model model) throws Exception {
//		return super.convertKor("/product/features");
//	}
//	
//	@RequestMapping("/download_buy/buy/buy-read.do")
//	public String read(BuyModel buyModel, Model model) throws Exception {
//		BuyModel rBuyModel = buyService.read(buyModel);
//		
//		model.addAttribute("buyModel", rBuyModel);
//		
//		return super.convertKor("/download_buy/buy/buy-read");
//	}

	
}


package com.netminer.product.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;
import com.netminer.common.board.model.BoardModel;
import com.netminer.common.board.service.BoardServiceIf;
import com.netminer.common.util.PageNavigationTagUtil;

@Controller
public class ProductHistoryController extends CyframeController {

	@Inject
	private BoardServiceIf boardService;

	private int boardListCount = 10;
	private int boardPageCount = 10;

	@RequestMapping("/product/history-readList.do")
	public String history(BoardModel boardModel, Model model) throws Exception {
		boardModel.setListCount(this.boardListCount);
		
		boardModel.setController("history");
		List<BoardModel> list = boardService.readList(boardModel);
		
		model.addAttribute("list", list);
		model.addAttribute("moveLinkPageScript", PageNavigationTagUtil.getMoveLinkPageScript("boardModel"));
		model.addAttribute("moveLinkPagePrint", PageNavigationTagUtil.getMoveLinkPagePrint(boardModel.getListCount(), this.boardPageCount, boardModel.getTotalCount(), boardModel.getPageNo()));

		return "/product/history-readList";
	}
	
}


package com.netminer.aboutus.notice;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.netminer.common.board.controller.BoardController;
import com.netminer.common.board.model.BoardModel;
import com.netminer.common.util.AttachFileTagUtil;

@Controller
public class NoticeController extends BoardController {

	@Override
	protected int setBoardListCount() {
		return 10;
	}

	@Override
	protected int setBoardPageCount() {
		return 10;
	}
	
	@RequestMapping("/aboutus/notice/notice-readList.do")
	public String readList(BoardModel boardModel, Model model) throws Exception {
		super._readList(boardModel, model);
		
		return "/aboutus/notice/notice-readList";
	}
	
	@RequestMapping("/aboutus/notice/notice-view.do")
	public String view(BoardModel boardModel, Model model) throws Exception {
		BoardModel rBoardModel = super._read(boardModel, model);

		model.addAttribute("attachFilePrint", AttachFileTagUtil.getAttachFilePrint(rBoardModel, false, false));
		
		return "/aboutus/notice/notice-view";
	}
	
}


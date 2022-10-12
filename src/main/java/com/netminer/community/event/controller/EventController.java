package com.netminer.community.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.model.ConstantModel;
import com.netminer.common.board.controller.BoardController;
import com.netminer.common.board.model.BoardModel;
import com.netminer.common.util.AttachFileTagUtil;

@Controller
public class EventController extends BoardController {

	@Override
	protected int setBoardListCount() {
		return 20;
	}

	@Override
	protected int setBoardPageCount() {
		return 20;
	}
	
	@RequestMapping("/community/event/event-create.do")
	public String create(BoardModel boardModel, Model model) throws Exception {
			
		super._create(boardModel, model);
	
		return ConstantModel.AJAX_RETURN_URL;
	}

	@RequestMapping("/community/event/event_comment-create.do")
	public String create_comment(BoardModel boardModel, Model model) throws Exception {
		super._create_comment(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/community/event/event-readList.do")
	public String readList(BoardModel boardModel, Model model) throws Exception {
		super._readList(boardModel, model);
//		
//		BoardModel rBoardModel = super._read(boardModel, model);
//		model.addAttribute("attachFilePrint", AttachFileTagUtil.getAttachFilePrint(rBoardModel, true, true));
//		
		return "/community/event/event-readList";
	}
	
	@RequestMapping("/community/event/event-read.do")
	public String read(BoardModel boardModel, Model model) throws Exception {
		BoardModel rBoardModel = super._read(boardModel, model);
		
		model.addAttribute("attachFileButton", AttachFileTagUtil.getAttachFileButton());
		model.addAttribute("attachFileScript", AttachFileTagUtil.getAttachFileScript());
		model.addAttribute("attachFilePrint", AttachFileTagUtil.getAttachFilePrint(rBoardModel, true, true));

		return "/community/event/event-read";
	}
	
	@RequestMapping("/community/event/event-view.do")
	public String view(BoardModel boardModel, Model model) throws Exception {
		BoardModel rBoardModel = super._read(boardModel, model);

		model.addAttribute("attachFilePrint", AttachFileTagUtil.getAttachFilePrint(rBoardModel, false, false));
		
		return "/community/event/event-view";
	}
	
	@RequestMapping("/community/event/event-update.do")
	public String update(BoardModel boardModel, Model model) throws Exception {
		super._update(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/community/event/event-delete.do")
	public String delete(BoardModel boardModel, Model model) throws Exception {
		super._delete(boardModel, model);

		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/community/event/event_comment-delete.do")
	public String delete_comment(BoardModel boardModel, Model model) throws Exception {
		super._delete_comment(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
}


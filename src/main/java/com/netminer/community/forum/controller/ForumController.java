package com.netminer.community.forum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.model.ConstantModel;
import com.netminer.common.board.controller.BoardController;
import com.netminer.common.board.model.BoardModel;
import com.netminer.common.util.AttachFileTagUtil;

@Controller
public class ForumController extends BoardController {

	@Override
	protected int setBoardListCount() {
		return 10;
	}

	@Override
	protected int setBoardPageCount() {
		return 10;
	}
	
	@RequestMapping("/community/forum/forum-create.do")
	public String create(BoardModel boardModel, Model model) throws Exception {
		super._create(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}

	@RequestMapping("/community/forum/forum_comment-create.do")
	public String create_comment(BoardModel boardModel, Model model) throws Exception {
		super._create_comment(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/community/forum/forum-readList.do")
	public String readList(BoardModel boardModel, Model model) throws Exception {
		super._readList(boardModel, model);
		
		return "/community/forum/forum-readList";
	}
	
	@RequestMapping("/community/forum/forum-read.do")
	public String read(BoardModel boardModel, Model model) throws Exception {
		BoardModel rBoardModel = super._read(boardModel, model);
		
		model.addAttribute("attachFileButton", AttachFileTagUtil.getAttachFileButton());
		model.addAttribute("attachFileScript", AttachFileTagUtil.getAttachFileScript());
		model.addAttribute("attachFilePrint", AttachFileTagUtil.getAttachFilePrint(rBoardModel, true, true));

		return "/community/forum/forum-read";
	}
	
	@RequestMapping("/community/forum/forum-view.do")
	public String view(BoardModel boardModel, Model model) throws Exception {
		BoardModel rBoardModel = super._read(boardModel, model);

		model.addAttribute("attachFilePrint", AttachFileTagUtil.getAttachFilePrint(rBoardModel, false, false));
		
		return "/community/forum/forum-view";
	}
	
	@RequestMapping("/community/forum/forum-update.do")
	public String update(BoardModel boardModel, Model model) throws Exception {
		super._update(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/community/forum/forum-delete.do")
	public String delete(BoardModel boardModel, Model model) throws Exception {
		super._delete(boardModel, model);

		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/community/forum/forum_comment-delete.do")
	public String delete_comment(BoardModel boardModel, Model model) throws Exception {
		super._delete_comment(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
}


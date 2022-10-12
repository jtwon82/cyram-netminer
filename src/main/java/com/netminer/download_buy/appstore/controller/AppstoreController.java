package com.netminer.download_buy.appstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.model.ConstantModel;
import com.netminer.common.board.controller.BoardController;
import com.netminer.common.board.model.BoardModel;
import com.netminer.common.util.AttachFileTagUtil;

@Controller
public class AppstoreController extends BoardController {

	@Override
	protected int setBoardListCount() {
		return 5;
	}

	@Override
	protected int setBoardPageCount() {
		return 10;
	}
	
	@RequestMapping("/download_buy/appstore/appstore-create.do")
	public String create(BoardModel boardModel, Model model) throws Exception {
		super._create(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}

	@RequestMapping("/download_buy/appstore/appstore_comment-create.do")
	public String create_comment(BoardModel boardModel, Model model) throws Exception {
		super._create_comment(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/download_buy/appstore/appstore-readList.do")
	public String readList(BoardModel boardModel, Model model) throws Exception {
		super._readList(boardModel, model);
		
		return "/download_buy/appstore/appstore-readList";
	}
	
	@RequestMapping("/download_buy/appstore/appstore-read.do")
	public String read(BoardModel boardModel, Model model) throws Exception {
		BoardModel rBoardModel = super._read(boardModel, model);
		
		model.addAttribute("attachFileButton", AttachFileTagUtil.getAttachFileButton());
		model.addAttribute("attachFileScript", AttachFileTagUtil.getAttachFileScript());
		model.addAttribute("attachFilePrint", AttachFileTagUtil.getAttachFilePrint(rBoardModel, true, true));

		return "/download_buy/appstore/appstore-read";
	}
	
	@RequestMapping("/download_buy/appstore/appstore-view.do")
	public String view(BoardModel boardModel, Model model) throws Exception {
		BoardModel rBoardModel = super._read(boardModel, model);

		model.addAttribute("attachFilePrint", AttachFileTagUtil.getAttachFilePrint(rBoardModel, false, false));

		boardService.setBase64(rBoardModel);
		model.addAttribute("base64FileList", boardModel.getBase64FileList());
		
		return "/download_buy/appstore/appstore-view";
	}
	
	@RequestMapping("/download_buy/appstore/appstore-update.do")
	public String update(BoardModel boardModel, Model model) throws Exception {
		super._update(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/download_buy/appstore/appstore-delete.do")
	public String delete(BoardModel boardModel, Model model) throws Exception {
		super._delete(boardModel, model);

		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/download_buy/appstore/appstore_comment-delete.do")
	public String delete_comment(BoardModel boardModel, Model model) throws Exception {
		super._delete_comment(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}

}


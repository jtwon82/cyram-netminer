package com.netminer.manager.qna.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.model.ConstantModel;
import com.cyframe.property.PropertyServiceIf;
import com.netminer.common.board.controller.BoardController;
import com.netminer.common.board.model.BoardModel;
import com.netminer.common.util.AttachFileTagUtil;

/**
 * @author 009
 *
 */
@Controller
public class ManagerQnAController extends BoardController {

	@Inject
	private PropertyServiceIf propertyService;

	@Override
	protected int setBoardListCount() {
		return propertyService.getInt("manager.board.list.count");
	}

	@Override
	protected int setBoardPageCount() {
		return propertyService.getInt("manager.board.page.count");
	}
	
	@RequestMapping("/manager/qna/qna-create.do")
	public String create(BoardModel boardModel, Model model) throws Exception {
		super._create(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}

	@RequestMapping("/manager/qna/qna-readList.do")
	public String readList(BoardModel boardModel, Model model) throws Exception {
		super._readList(boardModel, model);

		return "/manager/qna/qna-readList";
	}
	
	@RequestMapping("/manager/qna/qna-read.do")
	public String read(BoardModel boardModel, Model model) throws Exception {
		BoardModel rBoardModel = super._read(boardModel, model);
		
		model.addAttribute("attachFileButton", AttachFileTagUtil.getAttachFileButton());
		model.addAttribute("attachFileScript", AttachFileTagUtil.getAttachFileScript());
		model.addAttribute("attachFilePrint", AttachFileTagUtil.getAttachFilePrint(rBoardModel, true, true));
		
		return "/manager/qna/qna-read";
	}
	
	@RequestMapping("/manager/qna/qna-update.do")
	public String update(BoardModel boardModel, Model model) throws Exception {
		super._update(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/manager/qna/qna-delete.do")
	public String delete(BoardModel boardModel, Model model) throws Exception {
		super._delete(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/manager/qna/qna_comment-delete.do")
	public String delete_comment(BoardModel boardModel, Model model) throws Exception {
		super._delete_comment(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}

}


package com.netminer.manager.notice.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.model.ConstantModel;
import com.cyframe.property.PropertyServiceIf;
import com.netminer.common.board.controller.BoardController;
import com.netminer.common.board.model.BoardModel;
import com.netminer.common.board.service.BoardServiceIf;
import com.netminer.common.util.AttachFileTagUtil;

/**
 * @author 009
 *
 */
@Controller
public class ManagerNoticeController extends BoardController {

	@Inject
	private BoardServiceIf boardService;

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
	
	@RequestMapping("/manager/notice/notice-create.do")
	public String create(BoardModel boardModel, Model model) throws Exception {
		super._create(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}

	@RequestMapping("/manager/notice/notice-readList.do")
	public String readList(BoardModel boardModel, Model model) throws Exception {
		super._readList(boardModel, model);

		//new 목록 추가
		List<BoardModel> newList = boardService.readList_new(boardModel);
		model.addAttribute("newList", newList);
		
		return "/manager/notice/notice-readList";
	}
	
	@RequestMapping("/manager/notice/notice-read.do")
	public String read(BoardModel boardModel, Model model) throws Exception {
		BoardModel rBoardModel = super._read(boardModel, model);
		
		model.addAttribute("attachFileButton", AttachFileTagUtil.getAttachFileButton());
		model.addAttribute("attachFileScript", AttachFileTagUtil.getAttachFileScript());
		model.addAttribute("attachFilePrint", AttachFileTagUtil.getAttachFilePrint(rBoardModel, true, true));
		
		return "/manager/notice/notice-read";
	}
	
	@RequestMapping("/manager/notice/notice-update.do")
	public String update(BoardModel boardModel, Model model) throws Exception {
		super._update(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/manager/notice/notice_new-update.do")
	public String update_new(BoardModel boardModel, Model model) throws Exception {
		super._update_new(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/manager/notice/notice-delete.do")
	public String delete(BoardModel boardModel, Model model) throws Exception {
		super._delete(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
}


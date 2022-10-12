package com.netminer.manager.appstore.controller;

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
public class ManagerAppstoreController extends BoardController {

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
	
	@RequestMapping("/manager/appstore/appstore-create.do")
	public String create(BoardModel boardModel, Model model) throws Exception {
		super._create(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}

	@RequestMapping("/manager/appstore/appstore-readList.do")
	public String readList(BoardModel boardModel, Model model) throws Exception {
		super._readList(boardModel, model);
		
		return "/manager/appstore/appstore-readList";
	}
	
	@RequestMapping("/manager/appstore/appstore-read.do")
	public String read(BoardModel boardModel, Model model) throws Exception {
		BoardModel rBoardModel = super._read(boardModel, model);
		
		model.addAttribute("attachFileButton", AttachFileTagUtil.getAttachFileButton());
		model.addAttribute("attachFileScript", AttachFileTagUtil.getAttachFileScript());
		model.addAttribute("attachFilePrint", AttachFileTagUtil.getAttachFilePrint(rBoardModel, true, true));
		
		return "/manager/appstore/appstore-read";
	}
	
	@RequestMapping("/manager/appstore/appstore-update.do")
	public String update(BoardModel boardModel, Model model) throws Exception {
		super._update(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/manager/appstore/appstore-delete.do")
	public String delete(BoardModel boardModel, Model model) throws Exception {
		super._delete(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/manager/appstore/appstore_comment-delete.do")
	public String delete_comment(BoardModel boardModel, Model model) throws Exception {
		super._delete_comment(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
}


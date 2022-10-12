package com.netminer.manager.history.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.model.ConstantModel;
import com.cyframe.property.PropertyServiceIf;
import com.netminer.common.board.controller.BoardController;
import com.netminer.common.board.model.BoardModel;

/**
 * @author 009
 *
 */
@Controller
public class HistoryController extends BoardController {

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
	
	@RequestMapping("/manager/history/history-create.do")
	public String create(BoardModel boardModel, Model model) throws Exception {
		super._create(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}

	@RequestMapping("/manager/history/history-readList.do")
	public String readList(BoardModel boardModel, Model model) throws Exception {
		super._readList(boardModel, model);

		return "/manager/history/history-readList";
	}
	
	@RequestMapping("/manager/history/history-read.do")
	public String read(BoardModel boardModel, Model model) throws Exception {
		super._read(boardModel, model);
		
		return "/manager/history/history-read";
	}
	
	@RequestMapping("/manager/history/history-update.do")
	public String update(BoardModel boardModel, Model model) throws Exception {
		super._update(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/manager/history/history_new-update.do")
	public String update_new(BoardModel boardModel, Model model) throws Exception {
		super._update_new(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/manager/history/history-delete.do")
	public String delete(BoardModel boardModel, Model model) throws Exception {
		super._delete(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
}


package com.netminer.manager.faq.controller;

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
public class ManagerFaqController extends BoardController {

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
	
	@RequestMapping("/manager/faq/faq-create.do")
	public String create(BoardModel boardModel, Model model) throws Exception {
		super._create(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}

	@RequestMapping("/manager/faq/faq-readList.do")
	public String readList(BoardModel boardModel, Model model) throws Exception {
		super._readList(boardModel, model);

		return "/manager/faq/faq-readList";
	}
	
	@RequestMapping("/manager/faq/faq-read.do")
	public String read(BoardModel boardModel, Model model) throws Exception {
		super._read(boardModel, model);
		
		return "/manager/faq/faq-read";
	}
	
	@RequestMapping("/manager/faq/faq-update.do")
	public String update(BoardModel boardModel, Model model) throws Exception {
		super._update(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
	@RequestMapping("/manager/faq/faq-delete.do")
	public String delete(BoardModel boardModel, Model model) throws Exception {
		super._delete(boardModel, model);
		
		return ConstantModel.AJAX_RETURN_URL;
	}
	
}


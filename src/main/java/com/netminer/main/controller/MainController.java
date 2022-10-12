package com.netminer.main.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;
import com.netminer.common.board.model.BoardModel;
import com.netminer.main.model.MainModel;
import com.netminer.main.service.MainServiceIf;

@Controller
public class MainController extends CyframeController {

	@Inject
	private MainServiceIf mainService;

	@RequestMapping("/main/main-read.do")
	public String read(MainModel mainModel, Model model) throws Exception {
		mainModel = mainService.read(mainModel);
		List<BoardModel> noticeList =  mainModel.getNoticeList();
		
		model.addAttribute("mainModel", mainModel);
		model.addAttribute("noticeList", noticeList);
		
		return "/main/main-read";
	}
	
	@RequestMapping("/index.php")
	public String redirect(MainModel mainModel, Model model) throws Exception {
		return("redirect:/main/main-read.do");
	}
}


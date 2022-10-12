package com.netminer.common.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.ui.Model;

import com.cyframe.controller.CyframeController;
import com.netminer.common.board.model.BoardModel;
import com.netminer.common.board.service.BoardServiceIf;
import com.netminer.common.util.AttachFileTagUtil;
import com.netminer.common.util.PageNavigationTagUtil;

public abstract class BoardController extends CyframeController {

	@Inject
	protected BoardServiceIf boardService;

	protected int boardListCount = 0;
	protected int boardPageCount = 0;
	
	protected abstract int setBoardListCount();
	protected abstract int setBoardPageCount();
	
	public void _create(BoardModel boardModel, Model model) throws Exception {
	
		if(boardModel.getSessionId() != null /* 세션아이디가 있음 */ || /* 또는 */  boardModel.getSessionAdminId() != null /* 세션어드민아이디가 있음 */ ){		
		boardService.create(boardModel);
		}
	}

	public void _create_comment(BoardModel boardModel, Model model) throws Exception {
		boardService.create_comment(boardModel);
	}
	
	public void _readList(BoardModel boardModel, Model model) throws Exception {
		this.boardListCount = this.setBoardListCount();
		this.boardPageCount = this.setBoardPageCount();
		
		boardModel.setListCount(this.boardListCount);
		
		List<BoardModel> list = boardService.readList(boardModel);
		
		model.addAttribute("list", list);
		model.addAttribute("moveLinkPageScript", PageNavigationTagUtil.getMoveLinkPageScript("boardModel"));
		model.addAttribute("moveLinkPagePrint", PageNavigationTagUtil.getMoveLinkPagePrint(boardModel.getListCount(), this.boardPageCount, boardModel.getTotalCount(), boardModel.getPageNo()));
		model.addAttribute("attachFilePrint", AttachFileTagUtil.getAttachFilePrint(boardModel, true, true));
	}
	
	public BoardModel _read(BoardModel boardModel, Model model) throws Exception {
		BoardModel rBoardModel = boardService.read(boardModel);
		
		model.addAttribute("boardModel", rBoardModel);
		
		return rBoardModel;
	}
	
	public void _update(BoardModel boardModel, Model model) throws Exception {
		boardService.update(boardModel);
	}
	
	public void _update_new(BoardModel boardModel, Model model) throws Exception {
		// 한국어, 공지인 경우 controller를 변경해 준다.
		if(boardModel.isKor() && boardModel.getController().equals("notice")) {
			boardModel.setController("notice_kr");
		}
		boardService.update_new(boardModel);
	}
	
	public void _delete(BoardModel boardModel, Model model) throws Exception {
		boardService.delete(boardModel);
	}

	public void _delete_comment(BoardModel boardModel, Model model) throws Exception {
		boardService.delete_comment(boardModel);
	}
	
}


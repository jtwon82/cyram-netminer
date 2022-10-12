package com.netminer.main.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.netminer.common.board.model.BoardModel;
import com.netminer.common.board.service.BoardServiceIf;
import com.netminer.main.model.MainModel;

@Service
public class MainService implements MainServiceIf {

	@Inject
	private BoardServiceIf boardService;

	@Override
	public MainModel read(MainModel mainModel) throws Exception {
		BoardModel boardModel = new BoardModel();
		boardModel.setController("notice");
		boardModel.setKor(mainModel.isKor());
		
		List<BoardModel> noticeList = boardService.readList_new(boardModel);
		
		mainModel.setNoticeList(noticeList);
		return mainModel;
	}

}

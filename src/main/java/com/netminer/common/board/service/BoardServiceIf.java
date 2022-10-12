package com.netminer.common.board.service;

import java.util.List;

import com.netminer.common.board.model.BoardModel;

public interface BoardServiceIf {

	public void create(BoardModel model) throws Exception;
	public void create_comment(BoardModel model) throws Exception;
	public List<BoardModel> readList(BoardModel model) throws Exception;
	public List<BoardModel> readList_new(BoardModel model) throws Exception;
	public BoardModel read(BoardModel model) throws Exception;
	public void update(BoardModel model) throws Exception;
	public void update_new(BoardModel model) throws Exception;
	public void delete(BoardModel model) throws Exception;
	public void delete_comment(BoardModel model) throws Exception;
	public void setBase64(BoardModel model) throws Exception;
	
}

package com.netminer.common.attachfile.service;

import com.netminer.common.board.model.BoardModel;


/**
 * 파일정보의 관리를 위한 서비스 인터페이스
 * 
 */
public interface AttachFileServiceIf {

	public void create(BoardModel boardModel) throws Exception;

	public void readList(BoardModel boardModel) throws Exception;

	public void update(BoardModel boardModel) throws Exception;

	public void delete(BoardModel boardModel) throws Exception;

}

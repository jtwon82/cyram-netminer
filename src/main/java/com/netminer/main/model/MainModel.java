package com.netminer.main.model;

import java.util.List;

import com.cyframe.model.CyframeModel;
import com.netminer.common.board.model.BoardModel;

public class MainModel extends CyframeModel {

	private static final long serialVersionUID = 1L;

	private int wr_id = 0;
	private List<BoardModel> noticeList;

	public List<BoardModel> getNoticeList() {
		return noticeList;
	}

	public void setNoticeList(List<BoardModel> noticeList) {
		this.noticeList = noticeList;
	}

	public int getWr_id() {
		return wr_id;
	}

	public void setWr_id(int wr_id) {
		this.wr_id = wr_id;
	}

}
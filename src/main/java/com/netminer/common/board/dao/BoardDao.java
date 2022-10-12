package com.netminer.common.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cyframe.dao.IbatisAbstractDAO;
import com.netminer.common.board.model.BoardModel;

@Repository
public class BoardDao extends IbatisAbstractDAO {

	public int create(BoardModel model) throws Exception {
		return (Integer) create ("BoardDao.create", model);
	}
	
	public int create_comment(BoardModel model) throws Exception {
		return (Integer) create ("BoardDao.create.comment", model);
	}
	
	public void create_new(BoardModel model) throws Exception {
		create ("BoardDao.create.new", model);
	}
	
	@SuppressWarnings("unchecked")
	public List<BoardModel> readList(BoardModel model) throws Exception {
		return (List<BoardModel>) readList("BoardDao.readList", model);
	}

	@SuppressWarnings("unchecked")
	public List<BoardModel> readList_new(BoardModel model) throws Exception {
		return (List<BoardModel>) readList("BoardDao.readList.new", model);
	}
	
	@SuppressWarnings("unchecked")
	public List<BoardModel> readList_comment(BoardModel model) throws Exception {
		return (List<BoardModel>) readList("BoardDao.readList.comment", model);
	}

	public int readTotal(BoardModel model) throws Exception {
		return (Integer) read("BoardDao.readTotal", model);
	}
	
	public BoardModel read(BoardModel model) throws Exception {
		return (BoardModel) read("BoardDao.read", model);
	}

	public void update(BoardModel model) throws Exception {
		update ("BoardDao.update", model);
	}
	
	public void update_new(BoardModel model) throws Exception {
		update ("BoardDao.update_new", model);
	}
	
	public void update4Hit(BoardModel model) throws Exception {
		update ("BoardDao.hit.update", model);
	}
	
	public void update4Parent(BoardModel model) throws Exception {
		update ("BoardDao.parent.update", model);
	}
	
	public void update4Comment(BoardModel model) throws Exception {
		update ("BoardDao.comment.update", model);
	}
	
	public void delete(BoardModel model) throws Exception {
		delete ("BoardDao.delete", model);
	}
	
	public int delete_comment(BoardModel model) throws Exception {
		return delete ("BoardDao.delete.comment", model);
	}
	
	public void delete_new(BoardModel model) throws Exception {
		delete ("BoardDao.delete.new", model);
	}
	
}

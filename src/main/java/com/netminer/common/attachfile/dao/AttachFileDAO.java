package com.netminer.common.attachfile.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cyframe.dao.IbatisAbstractDAO;
import com.netminer.common.attachfile.model.AttachFileModel;

@Repository
public class AttachFileDAO extends IbatisAbstractDAO {

	public void create(AttachFileModel attachFileModel) throws Exception {
		create("attachFileDAO.create", attachFileModel);
	}

	@SuppressWarnings("unchecked")
	public List<AttachFileModel> readList(AttachFileModel attachFileModel) throws Exception {
		return (List<AttachFileModel>) readList("attachFileDAO.readList", attachFileModel);
	}

	public void delete(AttachFileModel attachFileModel) throws Exception {
		delete("attachFileDAO.delete", attachFileModel);
	}
	
}

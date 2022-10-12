package com.netminer.manager.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cyframe.dao.IbatisAbstractDAO;
import com.netminer.manager.admin.model.AdminModel;

@Repository
public class AdminDao extends IbatisAbstractDAO {

	public void create(AdminModel model) throws Exception {
		create ("AdminDao.create", model);
	}
	
	@SuppressWarnings("unchecked")
	public List<AdminModel> readList(AdminModel model) throws Exception {
		return (List<AdminModel>) readList("AdminDao.readList", model);
	}

	public AdminModel read(AdminModel model) throws Exception {
		return (AdminModel) read("AdminDao.read", model);
	}

	public void update(AdminModel model) throws Exception {
		update ("AdminDao.update", model);
	}
	
}

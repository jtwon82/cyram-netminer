package com.netminer.manager.nmuser.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cyframe.dao.IbatisAbstractDAO;
import com.netminer.manager.nmuser.model.NmUserModel;

@Repository
public class NmUserDao extends IbatisAbstractDAO {

	public void create(NmUserModel model) throws Exception {
		create ("NmUserDao.create", model);
	}
	
	@SuppressWarnings("unchecked")
	public List<NmUserModel> readList(NmUserModel model) throws Exception {
		return (List<NmUserModel>) readList("NmUserDao.readList", model);
	}

	public int readTotal(NmUserModel model) throws Exception {
		return (Integer) read("NmUserDao.readTotal", model);
	}
	
	public NmUserModel read(NmUserModel model) throws Exception {
		return (NmUserModel) read("NmUserDao.read", model);
	}

	public void update(NmUserModel model) throws Exception {
		update ("NmUserDao.update", model);
	}
	
	public void update_email(NmUserModel model) throws Exception {
		update ("NmUserDao.update.email", model);
	}
	
	public void delete(NmUserModel model) throws Exception {
		delete ("NmUserDao.delete", model);
	}
	
}

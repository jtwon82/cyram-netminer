package com.netminer.manager.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.netminer.manager.admin.dao.AdminDao;
import com.netminer.manager.admin.model.AdminModel;

@Service
public class AdminService implements AdminServiceIf {

	@Inject
	private AdminDao adminDao;

	@Override
	public void create(AdminModel model) throws Exception {
		adminDao.create(model);
	}

	@Override
	public List<AdminModel> readList(AdminModel model) throws Exception {
		return adminDao.readList(model);
	}

	@Override
	public AdminModel read(AdminModel model) throws Exception {
		AdminModel adminModel = adminDao.read(model);
		
		if(adminModel == null) {
			adminModel = new AdminModel();
		}
		
		return adminModel;
	}
	
	@Override
	public void update(AdminModel model) throws Exception {
		adminDao.update(model);
	}

}

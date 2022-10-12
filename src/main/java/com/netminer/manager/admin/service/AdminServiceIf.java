package com.netminer.manager.admin.service;

import java.util.List;

import com.netminer.manager.admin.model.AdminModel;

public interface AdminServiceIf {

	public void create(AdminModel model) throws Exception;
	public List<AdminModel> readList(AdminModel model) throws Exception;
	public AdminModel read(AdminModel model) throws Exception;
	public void update(AdminModel model) throws Exception;
	
}

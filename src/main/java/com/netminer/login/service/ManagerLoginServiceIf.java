package com.netminer.login.service;

import com.netminer.manager.admin.model.AdminModel;

public interface ManagerLoginServiceIf {
	
	public void create(AdminModel model) throws Exception;
	public void delete(AdminModel model) throws Exception;
	
}

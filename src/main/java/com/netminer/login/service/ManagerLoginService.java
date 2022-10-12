package com.netminer.login.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cyframe.model.ConstantModel;
import com.cyframe.session.service.SessionServiceIf;
import com.netminer.manager.admin.model.AdminModel;
import com.netminer.manager.admin.service.AdminServiceIf;

@Service
public class ManagerLoginService implements ManagerLoginServiceIf {

	@Inject
	private SessionServiceIf sessionService;

	@Inject
	private AdminServiceIf adminService;
	
	@Override
	public void create(AdminModel model) throws Exception {
		//DB 체크
		AdminModel rModel = adminService.read(model);
		
		if(rModel.getAdminid() == null || "".equals(rModel.getAdminid())) {
			throw new Exception(ConstantModel.CYRAM_ERROR + "Sign-in failed.");
		}
		
		sessionService.loginAdmin(rModel);
	}

	@Override
	public void delete(AdminModel model) throws Exception {
		sessionService.logoutAdmin();
	}

}

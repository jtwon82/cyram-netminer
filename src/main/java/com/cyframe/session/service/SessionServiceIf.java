package com.cyframe.session.service;

import com.cyframe.session.model.SessionModel;
import com.netminer.manager.admin.model.AdminModel;
import com.netminer.manager.nmuser.model.NmUserModel;

public interface SessionServiceIf {
	
	public SessionModel getSessionModel() throws Exception;
	
	public void login(NmUserModel model) throws Exception;
	
	public void logout() throws Exception;
	
	public boolean isLogin() throws Exception;

	public void loginAdmin(AdminModel model) throws Exception;
	
	public void logoutAdmin() throws Exception;
	
	public boolean isLoginAdmin() throws Exception;
	
	public boolean isKor() throws Exception;
	
	public void setKor(boolean kor) throws Exception;
	
	public boolean isBuyer() throws Exception;
}

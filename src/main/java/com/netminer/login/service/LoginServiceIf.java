package com.netminer.login.service;

import com.netminer.manager.nmuser.model.NmUserModel;

public interface LoginServiceIf {
	
	public void create(NmUserModel model) throws Exception;
	public void delete(NmUserModel model) throws Exception;
	public NmUserModel readAuto(NmUserModel nmUserModel) throws Exception;
	
}

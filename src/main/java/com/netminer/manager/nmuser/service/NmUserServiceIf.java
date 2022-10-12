package com.netminer.manager.nmuser.service;

import java.util.List;

import com.netminer.manager.nmuser.model.NmUserModel;

public interface NmUserServiceIf {

	public void create(NmUserModel model) throws Exception;

	public List<NmUserModel> readList(NmUserModel model) throws Exception;

	public NmUserModel read(NmUserModel model) throws Exception;
	
	public void ajax_read(NmUserModel model) throws Exception;
	public void forgotPassword(NmUserModel model) throws Exception;
	
	public void update(NmUserModel model) throws Exception;
	public void update_email(NmUserModel model) throws Exception;
	
	public void delete(NmUserModel model) throws Exception;

}

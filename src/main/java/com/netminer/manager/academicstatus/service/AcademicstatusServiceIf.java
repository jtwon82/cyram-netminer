package com.netminer.manager.academicstatus.service;

import com.netminer.manager.academicstatus.model.AcademicstatusModel;

public interface AcademicstatusServiceIf {

	public void create(AcademicstatusModel model) throws Exception;

	public AcademicstatusModel read(AcademicstatusModel model) throws Exception;
	
	public void update(AcademicstatusModel model) throws Exception;
	
	public void delete(AcademicstatusModel model) throws Exception;

}

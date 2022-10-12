package com.netminer.manager.academicstatus.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.netminer.manager.academicstatus.dao.AcademicstatusDao;
import com.netminer.manager.academicstatus.model.AcademicstatusModel;

@Service
public class AcademicstatusService implements AcademicstatusServiceIf {

	@Inject
	private AcademicstatusDao academicstatusDao;

	@Override
	public void create(AcademicstatusModel model) throws Exception {
		academicstatusDao.create(model);
	}

	@Override
	public AcademicstatusModel read(AcademicstatusModel model) throws Exception {
		return academicstatusDao.read(model);
	}
	
	@Override
	public void update(AcademicstatusModel model) throws Exception {
		academicstatusDao.update(model);
	}

	@Override
	public void delete(AcademicstatusModel model) throws Exception {
		academicstatusDao.delete(model);
	}

}

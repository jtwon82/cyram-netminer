package com.netminer.manager.academicstatus.dao;

import org.springframework.stereotype.Repository;

import com.cyframe.dao.IbatisAbstractDAO;
import com.netminer.manager.academicstatus.model.AcademicstatusModel;

@Repository
public class AcademicstatusDao extends IbatisAbstractDAO {

	public void create(AcademicstatusModel model) throws Exception {
		create ("AcademicstatusDao.create", model);
	}
	
	public AcademicstatusModel read(AcademicstatusModel model) throws Exception {
		return (AcademicstatusModel) read("AcademicstatusDao.read", model);
	}

	public void update(AcademicstatusModel model) throws Exception {
		update ("AcademicstatusDao.update", model);
	}
	
	public void delete(AcademicstatusModel model) throws Exception {
		delete ("AcademicstatusDao.delete", model);
	}
	
}

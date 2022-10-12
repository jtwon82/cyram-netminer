package com.netminer.manager.license.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cyframe.dao.IbatisAbstractDAO;
import com.cyframe.model.SelectBoxModel;
import com.netminer.manager.license.model.LicenseModel;

@Repository
public class LicenseDao extends IbatisAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<SelectBoxModel> readList_usages(String productId) throws Exception {
		return (List<SelectBoxModel>) readList("LicenseDao.readList.usages", productId);
	}

	@SuppressWarnings("unchecked")
	public List<SelectBoxModel> readList_terms(String productId) throws Exception {
		return (List<SelectBoxModel>) readList("LicenseDao.readList.terms", productId);
	}
	
	@SuppressWarnings("unchecked")
	public List<SelectBoxModel> readList_sizes(String productId) throws Exception {
		return (List<SelectBoxModel>) readList("LicenseDao.readList.sizes", productId);
	}
	
	@SuppressWarnings("unchecked")
	public List<SelectBoxModel> readList_termsByType(LicenseModel model) throws Exception {
		return (List<SelectBoxModel>) readList("LicenseDao.readList.terms.type", model);
	}
	
	@SuppressWarnings("unchecked")
	public List<SelectBoxModel> readList_sizesByType(LicenseModel model) throws Exception {
		return (List<SelectBoxModel>) readList("LicenseDao.readList.sizes.type", model);
	}
	
	public LicenseModel read_factor(LicenseModel model) throws Exception {
		return (LicenseModel) read("LicenseDao.readList.factor", model);
	}
	
}

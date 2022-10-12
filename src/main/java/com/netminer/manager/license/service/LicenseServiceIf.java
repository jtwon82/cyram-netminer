package com.netminer.manager.license.service;

import java.util.List;

import com.cyframe.model.SelectBoxModel;
import com.netminer.manager.license.model.LicenseModel;

public interface LicenseServiceIf {

	public List<SelectBoxModel> readList_usages(String productId) throws Exception;
	public List<SelectBoxModel> readList_terms(String productId) throws Exception;
	public List<SelectBoxModel> readList_sizes(String productId) throws Exception;
	public List<SelectBoxModel> readList_termsByType(LicenseModel model) throws Exception;
	public List<SelectBoxModel> readList_sizesByType(LicenseModel model) throws Exception;
	public LicenseModel read_factor(LicenseModel model) throws Exception;

}

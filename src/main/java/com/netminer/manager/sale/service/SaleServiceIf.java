package com.netminer.manager.sale.service;

import java.util.List;

import com.cyframe.model.SelectBoxModel;
import com.netminer.common.mail.model.MailModel;
import com.netminer.download_buy.download.model.DownloadModel;
import com.netminer.manager.sale.model.SaleLicenseModel;
import com.netminer.manager.sale.model.SaleModel;

public interface SaleServiceIf {

	public String create(SaleModel model) throws Exception;
	public void create_copy(SaleModel model) throws Exception;

	public List<SaleModel> readList(SaleModel model) throws Exception;
	public List<SaleModel> readList_sessionid(SaleModel model, boolean isWithSalePackage) throws Exception;

	public SaleModel read(SaleModel model) throws Exception;
	public SaleModel editionPackage_read(SaleModel model) throws Exception;
	public MailModel popup_sendMailLicense(SaleModel model) throws Exception;
	public MailModel popup_sendMailApproval(SaleModel model) throws Exception;

	public void update(SaleModel model) throws Exception;
	public void update_license(SaleModel model) throws Exception;
	public SaleLicenseModel create_license(SaleModel model) throws Exception;
	
	public void update_hardwareRegist(SaleModel model) throws Exception;
	public void update_hardwareReset(SaleModel model) throws Exception;
	public void delete_hardwareReset(SaleModel model) throws Exception;
	
	public void delete(SaleModel model) throws Exception;

	
	public List<SelectBoxModel> readList_country() throws Exception;
	public SaleModel getProductpackagePriceList(SaleModel model) throws Exception;
	public void setTutorialMail(DownloadModel downloadModel) throws Exception;
	public void saveSdcRecord(DownloadModel downloadModel) throws Exception;
	

	public List<SaleModel> readFreeList(SaleModel model) throws Exception;
	public SaleModel readFree(SaleModel model) throws Exception;
	public void updateFree(SaleModel model) throws Exception;
	public void deleteFree(SaleModel model) throws Exception;

}

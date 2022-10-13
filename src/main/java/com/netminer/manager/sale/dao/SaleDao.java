package com.netminer.manager.sale.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cyframe.dao.IbatisAbstractDAO;
import com.cyframe.model.SelectBoxModel;
import com.netminer.download_buy.download.model.DownloadModel;
import com.netminer.manager.extension.model.ExtensionQueryModel;
import com.netminer.manager.sale.model.SaleModel;
import com.netminer.manager.sale.model.SalePackageModel;

@Repository
public class SaleDao extends IbatisAbstractDAO {

	public String create(SaleModel model) throws Exception {
		return (String) create ("SaleDao.create", model);
	}
	
	public void create_salepackage(SalePackageModel model) throws Exception {
		create ("SaleDao.salepackage.create", model);
	}
	
	@SuppressWarnings("unchecked")
	public List<SaleModel> readList(SaleModel model) throws Exception {
		return (List<SaleModel>) readList("SaleDao.readList", model);
	}

	@SuppressWarnings("unchecked")
	public List<SaleModel> readList_sessionid(SaleModel model) throws Exception {
		return (List<SaleModel>) readList("SaleDao.readList.sessionid", model);
	}
	
	@SuppressWarnings("unchecked")
	public List<SalePackageModel> readList_salePackage(SaleModel model) throws Exception {
		return (List<SalePackageModel>) readList("SaleDao.readList.salePackage", model);
	}
	
	public int readTotal(SaleModel model) throws Exception {
		return (Integer) read("SaleDao.readTotal", model);
	}
	
	public SaleModel read(SaleModel model) throws Exception {
		return (SaleModel) read("SaleDao.read", model);
	}

	public SaleModel read_next_productserial() throws Exception {
		return (SaleModel) read("SaleDao.read.next_productserial", null);
	}
	
	public SaleModel read_next_hardwarekey(SaleModel model) throws Exception {
		return (SaleModel) read("SaleDao.read.next_hardwarekey", model);
	}
	
	public void update(SaleModel model) throws Exception {
		update ("SaleDao.update", model);
	}
	
	public void update_license(SaleModel model) throws Exception {
		update ("SaleDao.license.update", model);
	}
	
	public void update_hardwareRegist(SaleModel model) throws Exception {
		update ("SaleDao.hardwareRegist.update", model);
	}
	
	public void update_hardwareReset(SaleModel model) throws Exception {
		update ("SaleDao.hardwareReset.update", model);
	}
	
	public void delete_hardwareReset(SaleModel model) throws Exception {
		delete ("SaleDao.hardwareReset.delete", model);
	}
	
	public void update_replacedid(SaleModel model) throws Exception {
		update ("SaleDao.replacedid.update", model);
	}
	
	public void delete(SaleModel model) throws Exception {
		delete ("SaleDao.delete", model);
	}
	
	public void delete_salepackage(SaleModel model) throws Exception {
		delete ("SaleDao.salepackage.delete", model);
	}

	@SuppressWarnings("unchecked")
	public List<SelectBoxModel> readList_country() throws Exception {
		return (List<SelectBoxModel>) readList("SaleDao.readList.country", null);
	}

	public boolean isTutorialRegistered(DownloadModel model) {
		return 0 < (Integer) read("SaleDao.read.tutorial_mail", model);
	}
	
	public void registerTutorial(DownloadModel model) throws Exception {
		create ("SaleDao.tutorial.create", model);
	}

	public void createSaleExtension(ExtensionQueryModel model) throws Exception {
		create ("SaleDao.saleextension.create", model);
	}

	public void delete_extensions(SaleModel model) {
		delete ("SaleDao.extension.delete", model);
	}

	public void createExtensionsSNSCollector(ExtensionQueryModel extensionQueryModel) throws Exception {
		create ("SaleDao.extensions.create.fcbk", extensionQueryModel);
		create ("SaleDao.extensions.create.twtr", extensionQueryModel);
		create ("SaleDao.extensions.create.ytub", extensionQueryModel);
		create ("SaleDao.extensions.create.isgm", extensionQueryModel);
	}
	
	public void createExtensionsBiblioCollector(ExtensionQueryModel extensionQueryModel) throws Exception {
		create ("SaleDao.extensions.create.bibl", extensionQueryModel);
	}

	public void saveSdcRecord(DownloadModel downloadModel) throws Exception {
		create("SaleDao.extensions.record", downloadModel);
	}



	
	public int readFreeTotal(SaleModel model) throws Exception {
		return (Integer) read("SaleDao.readFreeTotal", model);
	}
	public List<SaleModel> readFreeList(SaleModel model) throws Exception {
		return (List<SaleModel>) readList("SaleDao.readFreeList", model);
	}
	public SaleModel readFree(SaleModel model) throws Exception {
		return (SaleModel) read("SaleDao.readFree", model);
	}
	public String createFree(SaleModel model) throws Exception {
		return (String) create ("SaleDao.createFree", model);
	}
}

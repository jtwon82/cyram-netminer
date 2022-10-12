package com.netminer.manager.settlement.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cyframe.dao.IbatisAbstractDAO;
import com.netminer.manager.settlement.model.SettlementModel;

@Repository
public class SettlementDao extends IbatisAbstractDAO {

	public void create(SettlementModel model) throws Exception {
		create ("SettlementDao.create", model);
	}
	
	@SuppressWarnings("unchecked")
	public List<SettlementModel> readList(SettlementModel model) throws Exception {
		return (List<SettlementModel>) readList("SettlementDao.readList", model);
	}

	public int readTotal(SettlementModel model) throws Exception {
		return (Integer) read("SettlementDao.readTotal", model);
	}
	
	public SettlementModel read(SettlementModel model) throws Exception {
		return (SettlementModel) read("SettlementDao.read", model);
	}

	public void update(SettlementModel model) throws Exception {
		update ("SettlementDao.update", model);
	}
	
	public void update_status(SettlementModel model) throws Exception {
		update ("SettlementDao.status.update", model);
	}
	
	public void delete(SettlementModel model) throws Exception {
		delete ("SettlementDao.delete", model);
	}
	
}

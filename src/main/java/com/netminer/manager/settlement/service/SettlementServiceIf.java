package com.netminer.manager.settlement.service;

import java.util.List;

import com.netminer.common.mail.model.MailModel;
import com.netminer.manager.settlement.model.SettlementModel;

public interface SettlementServiceIf {

	public void create(SettlementModel model) throws Exception;

	public List<SettlementModel> readList(SettlementModel model) throws Exception;

	public SettlementModel read(SettlementModel model) throws Exception;
	public SettlementModel read_auto(SettlementModel model) throws Exception;
	public MailModel popup_sendMailPayment(SettlementModel model) throws Exception;

	public void update_status(SettlementModel model) throws Exception;
	
	public void update(SettlementModel model) throws Exception;
	
	public void delete(SettlementModel model) throws Exception;

}

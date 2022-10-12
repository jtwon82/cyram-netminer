package com.netminer.manager.payment.dao;

import org.springframework.stereotype.Repository;

import com.cyframe.dao.IbatisAbstractDAO;
import com.netminer.manager.payment.model.PaymentModel;

@Repository
public class PaymentDao extends IbatisAbstractDAO {

	public void create(PaymentModel model) throws Exception {
		create ("PaymentDao.create", model);
	}
	
	public PaymentModel read(PaymentModel model) throws Exception {
		return (PaymentModel) read("PaymentDao.read", model);
	}

	public void update(PaymentModel model) throws Exception {
		update ("PaymentDao.update", model);
	}
	
	public void delete(PaymentModel model) throws Exception {
		delete ("PaymentDao.delete", model);
	}
	
}

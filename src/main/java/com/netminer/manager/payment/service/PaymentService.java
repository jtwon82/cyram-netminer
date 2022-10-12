package com.netminer.manager.payment.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.netminer.manager.payment.dao.PaymentDao;
import com.netminer.manager.payment.model.PaymentModel;

@Service
public class PaymentService implements PaymentServiceIf {

	@Inject
	private PaymentDao paymentDao;

	@Override
	public void create(PaymentModel model) throws Exception {
		paymentDao.create(model);
	}

	@Override
	public PaymentModel read(PaymentModel model) throws Exception {
		return paymentDao.read(model);
	}

	@Override
	public void update(PaymentModel model) throws Exception {
		paymentDao.update(model);
	}

	@Override
	public void delete(PaymentModel model) throws Exception {
		paymentDao.delete(model);
	}

}

package com.netminer.manager.payment.service;

import com.netminer.manager.payment.model.PaymentModel;

public interface PaymentServiceIf {

	public void create(PaymentModel model) throws Exception;

	public PaymentModel read(PaymentModel model) throws Exception;

	public void update(PaymentModel model) throws Exception;

	public void delete(PaymentModel model) throws Exception;
}

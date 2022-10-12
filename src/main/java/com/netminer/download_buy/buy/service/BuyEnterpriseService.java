package com.netminer.download_buy.buy.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cyframe.batch.MailSender;
import com.cyframe.property.PropertyServiceIf;
import com.netminer.common.mail.model.MailModel;
import com.netminer.common.util.MailMessageUtil;
import com.netminer.download_buy.buy.model.BuyEnterpriseModel;

@Service
public class BuyEnterpriseService implements BuyEnterpriseServiceIf {

	@Inject
	private MailSender mailSender;
	
	@Inject
	private PropertyServiceIf propertyService;

	@Override
	public void create(BuyEnterpriseModel model) throws Exception {
		MailModel mailModel = new MailModel();
		mailModel.setKor(false);
		mailModel.setHtml(false);

		mailModel.setToEmail(propertyService.getString("mail.id"));
		mailModel.setSubject(MailMessageUtil.generateSubject(model, propertyService.getString("mail.subject.Path"), "Payment_Enterprise"));
		mailModel.setMessage(MailMessageUtil.generateContents(model, propertyService.getString("mail.template.Path") + "Payment_Enterprise"));
		
		mailSender.notify(mailModel);
	}
	
	@Override
	public void create_site(BuyEnterpriseModel model) throws Exception {
		MailModel mailModel = new MailModel();
		mailModel.setKor(false);
		mailModel.setHtml(false);

		mailModel.setToEmail(propertyService.getString("mail.id"));
		mailModel.setSubject(MailMessageUtil.generateSubject(model, propertyService.getString("mail.subject.Path"), "Payment_Site"));
		mailModel.setMessage(MailMessageUtil.generateContents(model, propertyService.getString("mail.template.Path") + "Payment_Site"));
		
		mailSender.notify(mailModel);
	}

}

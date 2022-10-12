package com.netminer.download_buy.buy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cyframe.batch.MailSender;
import com.cyframe.property.PropertyServiceIf;
import com.netminer.common.mail.model.MailModel;
import com.netminer.common.util.MailMessageUtil;
import com.netminer.download_buy.buy.model.UpgradeModel;
import com.netminer.manager.productpackage.model.PackageModel;
import com.netminer.manager.productpackage.service.PackageServiceIf;

@Service
public class UpgradeService implements UpgradeServiceIf {

	@Inject
	private MailSender mailSender;
	
	@Inject
	private PropertyServiceIf propertyService;

	@Inject
	private PackageServiceIf packageService;
	
	@Override
	public void create_package(UpgradeModel model) throws Exception {
		MailModel mailModel = new MailModel();
		mailModel.setKor(false);
		mailModel.setHtml(false);

		mailModel.setToEmail(propertyService.getString("mail.id"));
		mailModel.setSubject(MailMessageUtil.generateSubject(model, propertyService.getString("mail.subject.Path"), "Upgrade_Package"));
		mailModel.setMessage(MailMessageUtil.generateContents(model, propertyService.getString("mail.template.Path") + "Upgrade_Package"));
		
		mailSender.notify(mailModel);
	}
	

	@Override
	public void create_version(UpgradeModel model) throws Exception {
		MailModel mailModel = new MailModel();
		mailModel.setKor(false);
		mailModel.setHtml(false);

		mailModel.setToEmail(propertyService.getString("mail.id"));
		mailModel.setSubject(MailMessageUtil.generateSubject(model, propertyService.getString("mail.subject.Path"), "Upgrade_Version"));
		mailModel.setMessage(MailMessageUtil.generateContents(model, propertyService.getString("mail.template.Path") + "Upgrade_Version"));
		
		mailSender.notify(mailModel);
	}
	
	@Override
	public UpgradeModel read_package(UpgradeModel model) throws Exception {
		
		List<PackageModel> packageModel = packageService.readList();
		model.setPackageModelList(packageModel);
		
		return model;
		
	}
}

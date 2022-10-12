package com.netminer.manager.nmuser.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Service;

import com.cyframe.batch.MailSender;
import com.cyframe.property.PropertyServiceIf;
import com.netminer.common.mail.model.MailModel;
import com.netminer.common.util.MailMessageUtil;
import com.netminer.common.util.ModelConverterUtil;
import com.netminer.manager.nmuser.dao.NmUserDao;
import com.netminer.manager.nmuser.model.NmUserModel;

@Service
public class NmUserService implements NmUserServiceIf {

	@Inject
	private NmUserDao nmUserDao;

	@Inject
	private MailSender mailSender;
	
	@Inject
	private PropertyServiceIf propertyService;

	@Override
	public void create(NmUserModel model) throws Exception {
		nmUserDao.create(model);
		
		this.sendMail(model);
	}

	/**
	 * 메일 발송
	 * @param model
	 */
	private void sendMail(NmUserModel model) {
		// 관리자에게 메일을 발송하는 기능을 막아둠.
		// TODO : 가입자에게 메일 발송 필요 - 템플릿 완성 이후.
		/*
		try {
			MailModel mailModel = new MailModel();

			mailModel.setKor(false);
			mailModel.setHtml(false);

			mailModel.setToEmail(propertyService.getString("manager.mail.id"));
			mailModel.setSubject(MailMessageUtil.generateSubject(model, propertyService.getString("mail.subject.Path"), "SignUp"));
			mailModel.setMessage(MailMessageUtil.generateContents(model, propertyService.getString("mail.template.Path") + "SignUp"));

			mailSender.notify(mailModel);
		} catch(Exception e) {
			e.printStackTrace();
		}
		*/
	}
	
	@Override
	public List<NmUserModel> readList(NmUserModel model) throws Exception {
		List<NmUserModel> list = null;
		
		int totalCount = nmUserDao.readTotal(model);
		
		if(totalCount > 0) {
			model.setTotalCount(totalCount);
			
			list = nmUserDao.readList(model);
		}

		return list;
	}

	@Override
	public NmUserModel read(NmUserModel model) throws Exception {
		NmUserModel rModel = null;
		
		if(model.getLoginid() != null && !"".equals(model.getLoginid())) {
			rModel = nmUserDao.read(model);
		}
		
		if(rModel == null) {
			rModel = new NmUserModel();
		} else {
			rModel = (NmUserModel) ModelConverterUtil.convert(model, rModel);
		}
		
		return rModel;
	}
	
	@Override
	public void ajax_read(NmUserModel model) throws Exception {
		NmUserModel rModel = this.read(model);
		
		if(rModel.getLoginid() != null && !"".equals(rModel.getLoginid())) {
			throw new Exception();
		}
	}

	@Override
	public void update(NmUserModel model) throws Exception {
		nmUserDao.update(model);
	}

	@Override
	public void update_email(NmUserModel model) throws Exception {
		nmUserDao.update_email(model);
	}
	
	@Override
	public void delete(NmUserModel model) throws Exception {
		nmUserDao.delete(model);
	}

	@Override
	public void forgotPassword(NmUserModel model) throws Exception {
		NmUserModel rModel = this.read(model);
		if(rModel.getEmail() == null || "".equals(rModel.getEmail())) {
			throw new Exception();
		}
		sendPasswordMail(rModel);
	}

	/**
	 * 비밀번호 찾기 메일 발송
	 * @param model
	 */
	private void sendPasswordMail(NmUserModel model) {
		try {
			MailModel mailModel = new MailModel();

			mailModel.setKor(model.isKor());
			mailModel.setHtml(model.isKor());
			String lang = "en";
			if(model.isKor()) {
				lang = "ko";
			}
			String ems = Base64.encodeBase64String((lang + "**" + model.getLoginid()).getBytes());
			String url = propertyService.getString("server.url") + "/login/newpassword.do?ems=" + ems;
		 	mailModel.setMailURL(url);
			
			mailModel.setToEmail(model.getEmail());
			mailModel.setSubject(MailMessageUtil.generateSubject(model, propertyService.getString("mail.subject.Path"), "NewPassword"));
			mailModel.setMessage(MailMessageUtil.generateContents(mailModel, propertyService.getString("mail.template.Path") + "NewPassword"));

			mailSender.notify(mailModel);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}

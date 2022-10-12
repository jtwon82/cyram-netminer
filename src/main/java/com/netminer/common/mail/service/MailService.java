package com.netminer.common.mail.service;

import java.io.File;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.inject.Inject;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.stereotype.Service;

import com.cyframe.model.MultipartModel;
import com.cyframe.property.PropertyServiceIf;
import com.netminer.common.mail.model.CyramAuthenticator;
import com.netminer.common.mail.model.MailModel;
import com.netminer.common.util.FileUtil;

@Service
public class MailService implements MailServiceIf {
	private String propertyFilePathKey = "license.file.Path";

	@Inject
	protected PropertyServiceIf propertyService;

	@Override
	public void create(MailModel model) throws Exception {
		
		//관리자가 메일 팝업으로 보내는 경우
		if(model.getToEmail() == null) {
			if(model.getUiMail() != null && !"".equals(model.getUiMail())) {
				model.setToEmail(model.getUiMail());
			}
		}
		
		MultipartModel[] attaches = model.getAttach_files();
		if(null != attaches && attaches.length > 0) {
			createLocalFile(attaches);
		}
		
		//메일 발송
		this.send(model);
		
		// 첨부파일 삭제
		try {
			if(model.getFilename() != null && !"".equals(model.getFilename())) {
				File file = new File(model.getFilename());
				if(file.exists()) {
					file.delete();
				}
			}
			
			if(null != attaches && attaches.length > 0) {
				for (MultipartModel multipartModel : attaches) {
					File file = new File(propertyService.getString("license.file.Path") + multipartModel.getFile_name());
					if(file.exists()) {
						file.delete();
					}
				}
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private void createLocalFile(MultipartModel[] attaches) throws Exception {
		try {
		String localFilePath = propertyService.getString(propertyFilePathKey);

		FileUtil.checkDirectory(localFilePath);

		for (MultipartModel multipartModel : attaches) {
			multipartModel.setFile_name(multipartModel.getFile_org_name());
			FileUtil.createFile(multipartModel, localFilePath);
		}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 메일 발송
	 * @param model
	 * @throws Exception
	 */
	private void send(MailModel model) throws Exception {

		Properties properties = this.getProperties();
		
		Session session = this.getSession(properties, model);
		
        MimeMessage mimemessage = this.getMessage(model, properties, session);
        
		Transport.send(mimemessage);			
	}

	/**
	 * Properties set
	 * @return
	 * @throws Exception
	 */
	private Properties getProperties() throws Exception {
		Properties properties = System.getProperties();

		properties.put("mail.smtp.debug", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.host", propertyService.getString("mail.smtp.host"));
        properties.put("mail.smtp.user", propertyService.getString("mail.id"));
        properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.socketFactory.fallback", "false");
		
		return properties;
	}

	/**
	 * 메일 session set
	 * @param properties
	 * @return
	 * @throws Exception
	 */
	private Session getSession(Properties properties, MailModel model) throws Exception {
		CyramAuthenticator authenticator;
		if(null != model.getFromEmail() && model.getFromEmail().equals(propertyService.getString("edu.mail.id"))){
			 authenticator = new CyramAuthenticator(propertyService.getString("edu.mail.id"), propertyService.getString("edu.mail.pw"));
		}else{
			 authenticator = new CyramAuthenticator(propertyService.getString("mail.id"), propertyService.getString("mail.pw"));
		}
        Session session = Session.getInstance(properties, authenticator);
        session.setDebug(true);
        return session;
	}
	
	/**
	 * message set
	 * @param model
	 * @param properties
	 * @param session
	 * @return
	 * @throws Exception
	 */
	private MimeMessage getMessage(MailModel model, Properties properties, Session session) throws Exception {
        MimeMessage mimemessage = new MimeMessage(session);
        if(model.getFromEmail() == null) {
        	mimemessage.setSender(new InternetAddress(propertyService.getString("mail.id")));
        	mimemessage.setFrom(new InternetAddress(propertyService.getString("mail.id")));
        }
        mimemessage.setRecipients(javax.mail.Message.RecipientType.TO, model.getToEmail());
        mimemessage.setSubject(model.getSubject(), "utf-8");

		MimeBodyPart textPart = new MimeBodyPart();
		
		String charset = "utf-8";
		
		if(model.isHtml()) {
			charset = "text/html; charset=utf-8";
			textPart.setContent(model.getMessage(), charset);
		} else {
			textPart.setText(model.getMessage(), charset);
		}
		
        Multipart mp = new MimeMultipart();
		mp.addBodyPart(textPart);

		if(model.getFilename() != null && !"".equals(model.getFilename())) {
			MimeBodyPart filePart = new MimeBodyPart();
			FileDataSource fds = new FileDataSource(model.getFilename());
			filePart.setDataHandler(new DataHandler(fds));
			filePart.setFileName(fds.getName());
	        mp.addBodyPart(filePart);
		}
		
		if(null != model.getAttach_files() && model.getAttach_files().length > 0) {
			MultipartModel[] attaches = model.getAttach_files();
			for (MultipartModel multipartModel : attaches) {
				MimeBodyPart filePart = new MimeBodyPart();
				FileDataSource fds = new FileDataSource(propertyService.getString("license.file.Path") + multipartModel.getFile_name());
				filePart.setDataHandler(new DataHandler(fds));
				filePart.setFileName(fds.getName());
		        mp.addBodyPart(filePart);
			}
		}
		
        mimemessage.setContent(mp);

        return mimemessage;
	}

}

package com.netminer.common.mail.model;

import javax.mail.Address;
import javax.mail.internet.InternetAddress;

import com.cyframe.model.CyframeModel;
import com.cyframe.model.MultipartModel;

public class MailModel extends CyframeModel {

	private static final long serialVersionUID = 2L;

	private Address[] toEmail;
	private String fromEmail;
	private String subject;
	private String message;
	private String filename;
	private String uiMail;
	private boolean html;
	private String mailURL = "";
	private MultipartModel[] attach_files;

	public String getFromEmail() {
		return fromEmail;
	}

	public void setFromEmail(String fromEmail) throws Exception {
		this.fromEmail = fromEmail;
	}

	public boolean isHtml() {
		return html;
	}

	public void setHtml(boolean html) {
		this.html = html;
	}

	public Address[] getToEmail() {
		return toEmail;
	}

	public void setToEmail(String toEmail) throws Exception {
		this.toEmail = InternetAddress.parse(toEmail);
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getUiMail() {
		return uiMail;
	}

	public void setUiMail(String uiMail) {
		this.uiMail = uiMail;
	}

	public String getMailURL() {
		return mailURL;
	}

	public void setMailURL(String mailURL) {
		this.mailURL = mailURL;
	}
	
	public MultipartModel[] getAttach_files() {
		return attach_files;
	}

	public void setAttach_files(MultipartModel[] attach_files) {
		this.attach_files = attach_files;
	}

}
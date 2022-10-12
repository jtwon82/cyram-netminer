package com.netminer.download_buy.download.model;

import com.cyframe.model.CyframeModel;

public class DownloadModel extends CyframeModel {

	private static final long serialVersionUID = 1L;

	private boolean account;
	private String fileName;
	private boolean askMail = true;
	private String language;

	public boolean isAskMail() {
		return askMail;
	}

	public void setAskMail(boolean askMail) {
		this.askMail = askMail;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public boolean isAccount() {
		return account;
	}

	public void setAccount(boolean account) {
		this.account = account;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

}

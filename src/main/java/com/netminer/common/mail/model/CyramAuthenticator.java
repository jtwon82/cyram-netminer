package com.netminer.common.mail.model;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class CyramAuthenticator extends Authenticator {
	
	private PasswordAuthentication passwordAuthentication;

    public CyramAuthenticator(String mailId, String mailPw) {
		passwordAuthentication = new PasswordAuthentication(mailId, mailPw);
    }

    // @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return passwordAuthentication;
    }

}

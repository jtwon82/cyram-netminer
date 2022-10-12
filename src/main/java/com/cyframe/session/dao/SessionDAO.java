package com.cyframe.session.dao;

import java.io.Serializable;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.cyframe.session.model.SessionModel;

@Repository
@Scope(value = "session", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class SessionDAO implements Serializable {

	private static final long serialVersionUID = 1L;

	private SessionModel sessionModel;
	
	public SessionModel getSessionModel() throws Exception {
		if(sessionModel == null) {
			sessionModel = new SessionModel();
		}
		return sessionModel;
	}

	public void setSessionModel(SessionModel sessionModel) throws Exception {
		this.sessionModel = sessionModel;
	}
	
	public boolean isLogin() throws Exception {
		return this.getSessionModel().isLogin();
	}

	public void setLogin(boolean login) throws Exception {
		this.getSessionModel().setLogin(login);
	}

	public boolean isLoginAdmin() throws Exception {
		return this.getSessionModel().isLoginAdmin();
	}
	
	public void setLoginAdmin(boolean loginAdmin) throws Exception {
		this.getSessionModel().setLoginAdmin(loginAdmin);
	}
	
	public boolean isKor() throws Exception {
		return this.getSessionModel().isKor();
	}

	public void setKor(boolean isKor) throws Exception {
		this.getSessionModel().setKor(isKor);
	}

	public void setBuyer(boolean buyer) throws Exception {
		this.getSessionModel().setBuyer(buyer);
	}
	
	public boolean isBuyer() throws Exception {
		return this.getSessionModel().isBuyer();
	}
	
}

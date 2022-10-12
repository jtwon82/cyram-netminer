package com.cyframe.session.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cyframe.session.dao.SessionDAO;
import com.cyframe.session.model.SessionModel;
import com.netminer.manager.admin.model.AdminModel;
import com.netminer.manager.nmuser.model.NmUserModel;

@Service
public class SessionService implements SessionServiceIf {
	
	@Inject
	private SessionDAO sessionDAO;
	
	@Override
	public SessionModel getSessionModel() throws Exception {
		return sessionDAO.getSessionModel();
	}

	@Override
	public void login(NmUserModel model) throws Exception {
		SessionModel sessionModel = this.getSessionModel();
		sessionModel.setSessionId(model.getLoginid());
		sessionModel.setSessionFirstname(model.getFirstname());
		sessionModel.setSessionLastname(model.getLastname());

		sessionDAO.setSessionModel(sessionModel);
		sessionDAO.setLogin(true);
		if(model.getBuyer().equals("true")) {
			sessionDAO.setBuyer(true);
		}
	}

	@Override
	public void logout() throws Exception {
		SessionModel sessionModel = this.getSessionModel();
		sessionModel.setSessionId("");
		sessionModel.setSessionFirstname("");
		sessionModel.setSessionLastname("");

		sessionDAO.setSessionModel(sessionModel);
		sessionDAO.setLogin(false);
		sessionDAO.setBuyer(false);
	}

	@Override
	public boolean isLogin() throws Exception {
		return sessionDAO.isLogin();
	}

	@Override
	public boolean isKor() throws Exception {
		return sessionDAO.isKor();
	}

	@Override
	public void setKor(boolean kor) throws Exception {
		sessionDAO.setKor(kor);
	}

	@Override
	public void loginAdmin(AdminModel model) throws Exception {
		SessionModel sessionModel = this.getSessionModel();
		sessionModel.setSessionAdminId(model.getAdminid());
		sessionModel.setSessionAdminName(model.getAdminname());

		sessionDAO.setSessionModel(sessionModel);
		sessionDAO.setLoginAdmin(true);
	}

	@Override
	public void logoutAdmin() throws Exception {
		SessionModel sessionModel = this.getSessionModel();
		sessionModel.setSessionAdminId("");
		sessionModel.setSessionAdminName("");

		sessionDAO.setSessionModel(sessionModel);
		sessionDAO.setLoginAdmin(false);
	}

	@Override
	public boolean isLoginAdmin() throws Exception {
		return sessionDAO.isLoginAdmin();
	}

	@Override
	public boolean isBuyer() throws Exception {
		return sessionDAO.isBuyer();
	}

}

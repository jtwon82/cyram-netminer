package com.cyframe.model;


public interface CyframeModelIf {

	public void setKor(boolean kor);
	
	public void setLogin(boolean login);

	public void setSessionId(String sessionId);

	public void setSessionFirstname(String sessionFirstname);
	
	public void setSessionLastname(String sessionLastname);

	public void setController(String controller);
	
	public void setLoginAdmin(boolean login);

	public void setSessionAdminId(String sessionAdminId);
	
	public void setSessionAdminName(String sessionAdminName);

}

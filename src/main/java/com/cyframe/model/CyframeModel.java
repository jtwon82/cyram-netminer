package com.cyframe.model;

import java.io.Serializable;

public abstract class CyframeModel implements Serializable, CyframeModelIf {

	private static final long serialVersionUID = 1L;

	private boolean kor = false;
	private boolean login = false;
	private boolean loginAdmin = false;
	private boolean buyer = false;
	private String controller;
	private String sessionId;
	private String sessionFirstname;
	private String sessionLastname;
	
	private String sessionAdminId;
	private String sessionAdminName;

	private int totalCount = 0;
	private int pageNo = 0;
	private int listCount = 0;
	private String searchKind;
	private String searchWord;
	private String orderby;
	
	public String getOrderby() {
		return orderby;
	}
	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	public String getSearchKind() {
		return searchKind;
	}
	public void setSearchKind(String searchKind) {
		this.searchKind = searchKind;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getSessionFirstname() {
		return sessionFirstname;
	}

	public void setSessionFirstname(String sessionFirstname) {
		this.sessionFirstname = sessionFirstname;
	}

	public String getSessionLastname() {
		return sessionLastname;
	}

	public void setSessionLastname(String sessionLastname) {
		this.sessionLastname = sessionLastname;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public String getSessionAdminId() {
		return sessionAdminId;
	}

	public void setSessionAdminId(String sessionAdminId) {
		this.sessionAdminId = sessionAdminId;
	}

	public String getSessionAdminName() {
		return sessionAdminName;
	}
	public void setSessionAdminName(String sessionAdminName) {
		this.sessionAdminName = sessionAdminName;
	}
	
	public boolean isLoginAdmin() {
		return loginAdmin;
	}

	public void setLoginAdmin(boolean loginAdmin) {
		this.loginAdmin = loginAdmin;
	}

	public boolean isKor() {
		return kor;
	}
	
	public void setKor(boolean kor) {
		this.kor = kor;
	}

	public String getController() {
		return controller;
	}

	public void setController(String controller) {
		this.controller = controller;
	}

	public boolean isLogin() {
		return login;
	}

	public void setLogin(boolean login) {
		this.login = login;
	}
	
	public void setBuyer(boolean buyer) {
		this.buyer = buyer;
	}
	
	public boolean isBuyer() {
		return buyer;
	}


}

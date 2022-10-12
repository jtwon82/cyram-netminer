package com.cyframe.controller;

import javax.inject.Inject;

import com.cyframe.model.ConstantModel;
import com.cyframe.session.service.SessionServiceIf;

public abstract class CyframeController {

	@Inject
	protected SessionServiceIf sessionService;

	/**
	 * 한영 페이지 치환
	 * @param returnURL
	 * @return
	 * @throws Exception
	 */
	protected String convertKor(String returnURL) throws Exception {
		String kor = "";
		
		if(sessionService.isKor()) {
			kor = ConstantModel.KOR_DELIMITER;
		}
		
		return returnURL + kor;
	}

	/**
	 * ajax 반환 파일
	 * @return
	 * @throws Exception
	 */
	protected String ajaxReturn() throws Exception {
		return ConstantModel.AJAX_RETURN_URL;
	}
	
}


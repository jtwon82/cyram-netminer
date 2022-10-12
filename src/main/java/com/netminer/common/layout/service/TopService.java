package com.netminer.common.layout.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cyframe.session.service.SessionServiceIf;
import com.netminer.common.layout.model.TopModel;

@Service
public class TopService implements TopServiceIf {

	@Inject
	private SessionServiceIf sessionService;

	@Override
	public void update(TopModel model) throws Exception {
		sessionService.setKor(model.isLang());
	}
}

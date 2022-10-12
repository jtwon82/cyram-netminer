package com.netminer.login.service;

import javax.inject.Inject;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Service;

import com.cyframe.model.ConstantModel;
import com.cyframe.session.service.SessionServiceIf;
import com.netminer.manager.nmuser.model.NmUserModel;
import com.netminer.manager.nmuser.service.NmUserServiceIf;

@Service
public class LoginService implements LoginServiceIf {

	@Inject
	private SessionServiceIf sessionService;

	@Inject
	private NmUserServiceIf nmUserService;
	
	@Override
	public void create(NmUserModel model) throws Exception {
		//DB 체크
		NmUserModel rModel = nmUserService.read(model);
		
		if(rModel.getLoginid() == null || "".equals(rModel.getLoginid())) {
			throw new Exception(ConstantModel.CYRAM_ERROR + "Sign-in failed.");
		}
		
		sessionService.login(rModel);
	}

	@Override
	public void delete(NmUserModel model) throws Exception {
		sessionService.logout();
	}

	@Override
	public NmUserModel readAuto(NmUserModel model) throws Exception {
		String ems = model.getEms();
		if(ems == null) {
			throw new Exception("Please connect with proper way.");
		}
		String decodedQuery = new String(Base64.decodeBase64(ems));
		String[] idLocation = decodedQuery.split("\\*\\*", 2);
		model.setKor(idLocation[0].equals("ko") ? true : false);
		model.setLoginid(idLocation[1]);
		model = nmUserService.read(model);
		
		// 비밀번호를 책정한 다음 update해준다.
		String newPassword = RandomStringUtils.randomAlphanumeric(8);
		model.setPwd(newPassword);
		nmUserService.update(model);
		
		return model;
	}

}

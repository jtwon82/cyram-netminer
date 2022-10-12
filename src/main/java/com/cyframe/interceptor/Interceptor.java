package com.cyframe.interceptor;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.validation.support.BindingAwareModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import com.cyframe.model.CyframeModelIf;
import com.cyframe.property.MessageServiceIf;
import com.cyframe.property.PropertyServiceIf;
import com.cyframe.session.model.SessionModel;
import com.cyframe.session.service.SessionServiceIf;
import com.netminer.manager.admin.model.AdminModel;
import com.netminer.manager.nmuser.model.NmUserModel;

@Aspect
@Component
public class Interceptor {

	private Logger log = Logger.getLogger(this.getClass());

	@Inject
	private SessionServiceIf sessionService;

	@Inject
	protected PropertyServiceIf propertyService;

	@Inject
	protected MessageServiceIf messageService;
	
	@Pointcut("execution(* com.netminer..*Controller.*(..))")
	public void pointcut4Call() {}

	@Pointcut("execution(* com.netminer..*Controller.*(..))")
	public void pointcut4throwing() {}
	
	@Autowired
	  private HttpServletRequest context;
	
	@Before("pointcut4Call()")
	public void before(JoinPoint joinPoint) throws Exception {
		CyframeModelIf model = this.getCyframeModel(joinPoint.getArgs());
		log.info(String.format("model %s", model));
		
		if(model != null) {
			String target = joinPoint.getTarget().getClass().getName();
			String controller = joinPoint.getTarget().getClass().getSimpleName().replace("Controller", "");
			controller = controller.replace("Manager", "");
			
			String method = joinPoint.getSignature().getName();

			//session 泥댄겕
			this.checkSession(target, controller, method);
			
			//set kor(�븳�쁺 援щ텇)
			this.setKor(model);
			
			//set user(�궗�슜�옄 �젙蹂�)
			this.setUser(model);
			
			//set controller(�뀒�씠釉붾챸 �벑�쑝濡� �궗�슜�맖)
			model.setController(controller.toLowerCase());
		}
	}
	
	@AfterReturning("pointcut4Call()")
	public void after(JoinPoint joinPoint) throws Exception {
		
		CyframeModelIf model = this.getCyframeModel(joinPoint.getArgs());

		if(model != null) {
			//set kor(�븳�쁺 援щ텇)
			this.setKor(model);
			
			//set user(�궗�슜�옄 �젙蹂�)
			this.setUser(model);
		}
		
		this.setMessage(joinPoint);
	}

	@AfterThrowing(pointcut = "pointcut4throwing()", throwing = "error")
	public void throwing(JoinPoint joinPoint, Throwable error) throws Exception {
	}

	/**
	 * Cyframe 紐⑤뜽 異붿텧
	 * @param args
	 * @return
	 * @throws Exception
	 */
	private CyframeModelIf getCyframeModel(Object[] args) throws Exception {
		for (Object arg : args) {
			if(arg instanceof CyframeModelIf) {
				return (CyframeModelIf) arg;
			}
		}
		return null;
	}

	/**
	 * ModelAndView 異붿텧
	 * @param args
	 * @return
	 * @throws Exception
	 */
	private BindingAwareModelMap getModelMap(Object[] args) throws Exception {
		for (Object arg : args) {
			if(arg instanceof BindingAwareModelMap) {
				return (BindingAwareModelMap) arg;
			}
		}
		return null;
	}
	
	/**
	 * 濡쒓렇�씤 �뿬遺� 泥댄겕
	 * @param target
	 * @param controller
	 * @param method
	 * @throws Exception
	 */
	private void checkSession(String target, String controller, String method) throws Exception {

		/* �꽭�뀡 泥� �젒�냽�씤 寃쎌슦 �뼵�뼱瑜� �뙋蹂꾪븳�떎 */
		if(null == context.getSession().getAttribute("first")) {
			if(context.getLocale().getLanguage().equals("ko")) {
				sessionService.setKor(true);
			} else {
				sessionService.setKor(false);
			}
			context.getSession().setAttribute("first", "false");
		}
		
		if(target.contains("com.netminer.manager")) {
			if(!sessionService.isLoginAdmin()) {
				ModelAndView mv = new ModelAndView("/login/manager_login-read", (Map<String, ?>) (new ModelMap()));
				mv.addObject("adminModel", new AdminModel());
				throw new ModelAndViewDefiningException(mv);
			}
		} else {
			if(sessionService.isLogin()) {
				return;
			}
			
			@SuppressWarnings("unchecked")
			List<String> authControllerList = (List<String>) propertyService.getAuthController();
			
			if(authControllerList != null) {
				String authController = null;
				String[] methods = null;
				
				for(String authControllerStr : authControllerList) {
					authController = this.getController(authControllerStr);
					
					if(controller.equalsIgnoreCase(authController)) {
						methods = this.getMethods(authControllerStr);
						
						for(String methodStr : methods) {
							if(method.equalsIgnoreCase(methodStr)) {
								//濡쒓렇�씤 �럹�씠吏�濡� �씠�룞
								ModelAndView mv = new ModelAndView("/login/login-read", (Map<String, ?>) (new ModelMap()));
								mv.addObject("nmUserModel", new NmUserModel());
								throw new ModelAndViewDefiningException(mv);
							}
						}
					}
				}
			}
		}
	}
	
	/**
	 * �븳�쁺 set
	 * @param model
	 * @throws Exception
	 */
	private void setKor(CyframeModelIf model) throws Exception {
		//荑쇰━/�솕硫� �벑�뿉 �궗�슜�릺�뼱�빞 �븯湲� �븣臾몄뿉 紐⑤뜽�뿉 �꽭�똿�븳�떎.
		model.setKor(sessionService.isKor());
	}
	
	/**
	 * �궗�슜�옄 �젙蹂� set
	 * @param model
	 * @throws Exception
	 */
	private void setUser(CyframeModelIf model) throws Exception {
		//荑쇰━/�솕硫� �벑�뿉 �궗�슜�릺�뼱�빞 �븯湲� �븣臾몄뿉 紐⑤뜽�뿉 �꽭�똿�븳�떎.
		SessionModel sessionModel = sessionService.getSessionModel();
		
		model.setLogin(sessionService.isLogin());
		
		model.setSessionId(sessionModel.getSessionId());
		model.setSessionFirstname(sessionModel.getSessionFirstname());
		model.setSessionLastname(sessionModel.getSessionLastname());

		model.setLoginAdmin(sessionService.isLoginAdmin());
		model.setSessionAdminId(sessionModel.getSessionAdminId());
		model.setSessionAdminName(sessionModel.getSessionAdminName());
		
	}

	/**
	 * 硫붿꽭吏� set
	 * @param joinPoint
	 * @throws Exception
	 */
	private void setMessage(JoinPoint joinPoint) throws Exception {
		String kor = "";
		String value = "";

		if(sessionService.isKor()) {
			kor = ".kor";
		} else {
			kor = ".eng";
		}

		BindingAwareModelMap map = this.getModelMap(joinPoint.getArgs());

		if(map != null) {
			//kor �꽭�똿(css �븣臾몄뿉 異붽�)
			if(sessionService.isKor()) {
				map.put("IS_KOR", "true");
			} else {
				map.put("IS_KOR", "false");
			}
			
			List<String> keyList = messageService.getKeyList();
	
			for(String key : keyList) {
				if(key.endsWith(kor)) {
					value = messageService.getString(key);
					key = key.replace(kor, "");
					map.put(key, value);
				}
			}
		}
	}
	
	/**
	 * Controller (�샇異� �봽濡쒓렇�옩) set
	 * @param authController
	 * @return
	 * @throws Exception
	 */
	private String getController(String authController) throws Exception {
		if(authController.indexOf("[") > 0) {
			return authController.substring(0, authController.indexOf("["));
		}
		
		return authController;
	}
	
	/**
	 * Methods (�샇異� �봽濡쒓렇�옩�씠 湲곕뒫) set
	 * @param authController
	 * @return
	 * @throws Exception
	 */
	private String[] getMethods(String authController) throws Exception {
		if(authController.indexOf("[") > 0) {
			String methodStr = authController.substring(authController.indexOf("[") + 1, authController.indexOf("]"));
			String[] methods = methodStr.split(",");
			
			for(int i = 0; i < methods.length; i++) {
				methods[i] = methods[i].trim();
			}
			return methods;
		}
		
		return null;
	}
	
}
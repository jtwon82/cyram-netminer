package com.cyframe.batch;

import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.springframework.stereotype.Component;

import com.netminer.common.mail.model.MailModel;
import com.netminer.common.mail.service.MailServiceIf;

@Component
public class MailSender {
	
	@Inject
	private MailServiceIf mailService;

	/**
	 * 보낼 메일을 임시저장하는 Queue이다.
	 */
	private final Queue<MailModel> queue4Mail = new Queue<MailModel>();

	/**
	 * 배치에 사용되는 Timer이다.
	 */
	private final Timer timer = new Timer("Mail::Timer");
	
	/**
	 * Timer의 Delay 시간이다.
	 */
	private final int delay = 1000;//1초

	/**
	 * @Comment : 초기화 처리를 한다.
	 */
	@PostConstruct
	public void init() {
		timer.schedule(new senderTimer(), 0, delay);
	}

	/**
	 * @Comment : Queue에 담는다.
	 * @param model
	 */
	public void notify(MailModel model) {
		if(model != null) {
			queue4Mail.push(model);
		}
	}

	/**
	 * @Comment : Timer에 의해 구동되는 실행 컴포넌트이다.
	 */
	public class senderTimer extends TimerTask {
		
		@Override
		public void run() {
			try {
				List<MailModel> list = queue4Mail.flush();
				
				if (list.size() == 0) {
					return;
				}

				for (MailModel model : list) {
					mailService.create(model);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}

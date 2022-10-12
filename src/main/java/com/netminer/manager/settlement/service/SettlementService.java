package com.netminer.manager.settlement.service;

import java.security.MessageDigest;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.apache.commons.codec.binary.Base64;

import com.cyframe.property.PropertyServiceIf;
import com.netminer.common.mail.model.MailModel;
import com.netminer.common.util.MailMessageUtil;
import com.netminer.common.util.ModelConverterUtil;
import com.netminer.manager.settlement.dao.SettlementDao;
import com.netminer.manager.settlement.model.SettlementModel;

@Service
public class SettlementService implements SettlementServiceIf {

	@Inject
	private SettlementDao settlementDao;

	@Inject
	private PropertyServiceIf propertyService;
	
	@Override
	public void create(SettlementModel model) throws Exception {
		settlementDao.create(model);
	}

	@Override
	public List<SettlementModel> readList(SettlementModel model) throws Exception {
		List<SettlementModel> list = null;

		int totalCount = settlementDao.readTotal(model);
		
		if(totalCount > 0) {
			model.setTotalCount(totalCount);
			
			list = settlementDao.readList(model);
		}

		return list;
	}

	@Override
	public SettlementModel read(SettlementModel model) throws Exception {
		SettlementModel rModel = settlementDao.read(model);
		
		if(rModel == null) {
			rModel = new SettlementModel();
		} else {
			rModel = (SettlementModel) ModelConverterUtil.convert(model, rModel);
		}
		return rModel;
	}
	
	@Override
	public SettlementModel read_auto(SettlementModel model) throws Exception {
		String ems = model.getEms();
		
		if(ems == null) {
			throw new Exception("I'm not a NetMiner Community Member yet.");
		}
		
		String decodedQuery = new String(Base64.decodeBase64(ems));
		String[] IdPw = decodedQuery.split("\\*\\*", 3);

		model.setS_idx(IdPw[0]);
		model.setS_sid(IdPw[1]);
		model.setS_spw(IdPw[2]);
		
		SettlementModel rModel = settlementDao.read(model);
		
		if("domestic".equals(rModel.getS_location())) {
			this.getMD5(rModel);
		}
		
		return rModel;
	}
	
	private void getMD5(SettlementModel model) throws Exception {
	    /*
	     * [결제 인증요청 페이지(STEP2-1)]
	     *
	     * 샘플페이지에서는 기본 파라미터만 예시되어 있으며, 별도로 필요하신 파라미터는 연동메뉴얼을 참고하시어 추가 하시기 바랍니다.
	     */

	    /*
	     * 1. 기본결제 인증요청 정보 변경
	     *
	     * 기본정보를 변경하여 주시기 바랍니다.(파라미터 전달시 POST를 사용하세요)
	     */
		
	    String CST_PLATFORM         = propertyService.getString("pay.TYPE");                 //LG유플러스 결제서비스 선택(test:테스트, service:서비스)
	    String CST_MID              = propertyService.getString("pay.MID");                 //LG유플러스로 부터 발급받으신 상점아이디를 입력하세요.
	    String LGD_MID              = ("test".equals(CST_PLATFORM.trim())?"t":"")+CST_MID;  //테스트 아이디는 't'를 제외하고 입력하세요.
	                                                                                        //상점아이디(자동생성)
	    String LGD_OID              = model.getS_idx();                      //주문번호(상점정의 유니크한 주문번호를 입력하세요)
	    String LGD_AMOUNT           = model.getS_price();                   //결제금액("," 를 제외한 결제금액을 입력하세요)
	    String LGD_MERTKEY          = "a1a22546283b8d27657744196476c66a";  									//상점MertKey(mertkey는 상점관리자 -> 계약정보 -> 상점정보관리에서 확인하실수 있습니다)
	    String LGD_BUYER            = model.getS_sid();                    //구매자명
	    String LGD_PRODUCTINFO      = "Cyram NetMiner Settlement Payment";              //상품명
	    String LGD_BUYEREMAIL       = "";               //구매자 이메일
	    String LGD_TIMESTAMP        = String.valueOf(System.currentTimeMillis());                //타임스탬프
	    String LGD_CUSTOM_USABLEPAY  = "SC0010";          //상점정의 초기결제수단
	    String LGD_CUSTOM_SKIN      = "red";                                                //상점정의 결제창 스킨(red, purple, yellow)
	    String LGD_WINDOW_VER       = "2.5";                                                //결제창 버젼정보

	    /*
	     * 가상계좌(무통장) 결제 연동을 하시는 경우 아래 LGD_CASNOTEURL 을 설정하여 주시기 바랍니다. 
	     */    
	    //String LGD_CASNOTEURL		= "http://상점URL/cas_noteurl.jsp";
	    
	    /*
	     * LGD_RETURNURL 을 설정하여 주시기 바랍니다. 반드시 현재 페이지와 동일한 프로트콜 및  호스트이어야 합니다. 아래 부분을 반드시 수정하십시요.
	     */
	    String LGD_RETURNURL		= propertyService.getString("server.url") + "/autosettlement/settlementpaidcomplete-popup.do";// FOR MANUAL

	    /*
	     *************************************************
	     * 2. MD5 해쉬암호화 (수정하지 마세요) - BEGIN
	     *
	     * MD5 해쉬암호화는 거래 위변조를 막기위한 방법입니다.
	     *************************************************
	     *
	     * 해쉬 암호화 적용( LGD_MID + LGD_OID + LGD_AMOUNT + LGD_TIMESTAMP + LGD_MERTKEY )
	     * LGD_MID          : 상점아이디
	     * LGD_OID          : 주문번호
	     * LGD_AMOUNT       : 금액
	     * LGD_TIMESTAMP    : 타임스탬프
	     * LGD_MERTKEY      : 상점MertKey (mertkey는 상점관리자 -> 계약정보 -> 상점정보관리에서 확인하실수 있습니다)
	     *
	     * MD5 해쉬데이터 암호화 검증을 위해
	     * LG유플러스에서 발급한 상점키(MertKey)를 환경설정 파일(lgdacom/conf/mall.conf)에 반드시 입력하여 주시기 바랍니다.
	     */
	    StringBuffer sb = new StringBuffer();
	    sb.append(LGD_MID);
	    sb.append(LGD_OID);
	    sb.append(LGD_AMOUNT);
	    sb.append(LGD_TIMESTAMP);
	    sb.append(LGD_MERTKEY);

	    byte[] bNoti = sb.toString().getBytes();
	    MessageDigest md = MessageDigest.getInstance("MD5");
	    byte[] digest = md.digest(bNoti);

	    StringBuffer strBuf = new StringBuffer();
	    for (int i=0 ; i < digest.length ; i++) {
	        int c = digest[i] & 0xff;
	        if (c <= 15){
	            strBuf.append("0");
	        }
	        strBuf.append(Integer.toHexString(c));
	    }

	    String LGD_HASHDATA = strBuf.toString();
	    String LGD_CUSTOM_PROCESSTYPE = "TWOTR";
	    /*
	     *************************************************
	     * 2. MD5 해쉬암호화 (수정하지 마세요) - END
	     *************************************************
	     */
	    
		model.setCST_PLATFORM(CST_PLATFORM);
		model.setCST_MID(CST_MID);
		model.setLGD_MID(LGD_MID);
		model.setLGD_OID(LGD_OID);
		model.setLGD_BUYER(LGD_BUYER);
		model.setLGD_PRODUCTINFO(LGD_PRODUCTINFO);
		model.setLGD_AMOUNT(LGD_AMOUNT);
		model.setLGD_BUYEREMAIL(LGD_BUYEREMAIL);
		model.setLGD_CUSTOM_SKIN(LGD_CUSTOM_SKIN);
		model.setLGD_CUSTOM_PROCESSTYPE(LGD_CUSTOM_PROCESSTYPE);
		model.setLGD_TIMESTAMP(LGD_TIMESTAMP);
		model.setLGD_HASHDATA(LGD_HASHDATA);
		model.setLGD_PAYKEY("");
		model.setLGD_RESPCODE("");
		model.setLGD_RESPMSG("");
		model.setLGD_CUSTOM_USABLEPAY(LGD_CUSTOM_USABLEPAY);
		model.setLGD_WINDOW_VER(LGD_WINDOW_VER);
		model.setLGD_RETURNURL(LGD_RETURNURL);
	}
	
	@Override
	public MailModel popup_sendMailPayment(SettlementModel model) throws Exception {
		MailModel mailModel = new MailModel();
		mailModel.setKor(model.isKor());
		mailModel.setHtml(model.isKor());
		
		if("프로그램".equals(model.getS_licenseinfo_1())) {
			model.setMailMemo("NetMiner에");
			mailModel.setFromEmail(propertyService.getString("manager.mail.id"));
		} else if("교육".equals(model.getS_licenseinfo_1())) {
			model.setMailMemo("사이람 교육에");
			mailModel.setFromEmail(propertyService.getString("edu.mail.id"));
		} else if("컨설팅".equals(model.getS_licenseinfo_1())) {
			model.setMailMemo("사이람에");
			mailModel.setFromEmail(propertyService.getString("edu.mail.id"));
		} else {
			model.setMailMemo("사이람에");
			mailModel.setFromEmail(propertyService.getString("manager.mail.id"));
		}

		try {
			model.setS_price(String.format("%,d", Integer.parseInt(model.getS_price())));
		} catch(Exception e) {
			model.setS_price("0");
		}
		System.out.println("model.getS_idx().concat(**).concat(model.getS_sid()).concat(**).concat(model.getS_spw()).getBytes() : "+ (model.getS_idx().concat("**").concat(model.getS_sid()).concat("**").concat(model.getS_spw()).getBytes()));
		System.out.println("encode : "+Base64.encodeBase64String(model.getS_idx().concat("**").concat(model.getS_sid()).concat("**").concat(model.getS_spw()).getBytes()));
		
		String url = propertyService.getString("server.url") + "/autosettlement/autosettlement-popup.do?ems=";
	 	url = url
	 			+ Base64.encodeBase64String(model.getS_idx().concat("**").concat(model.getS_sid()).concat("**").concat(model.getS_spw()).getBytes());
	 	model.setMailURL(url);
		
		mailModel.setSubject(MailMessageUtil.generateSubject(model, propertyService.getString("mail.subject.Path"), "Settlement_Request"));
		mailModel.setMessage(MailMessageUtil.generateContents(model, propertyService.getString("mail.template.Path") + "Settlement_Request"));
		return mailModel;
	}

	@Override
	public void update_status(SettlementModel model) throws Exception {
		settlementDao.update_status(model);
	}

	@Override
	public void update(SettlementModel model) throws Exception {
		settlementDao.update(model);
	}

	@Override
	public void delete(SettlementModel model) throws Exception {
		settlementDao.delete(model);
	}

}

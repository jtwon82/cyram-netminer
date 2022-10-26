package com.netminer.download_buy.buy.service;

import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cyframe.batch.MailSender;
import com.cyframe.model.MultipartModel;
import com.cyframe.model.SelectBoxModel;
import com.cyframe.property.PropertyServiceIf;
import com.cyframe.session.service.SessionServiceIf;
import com.netminer.common.mail.model.MailModel;
import com.netminer.common.nation.service.NationServiceIf;
import com.netminer.common.util.DateUtil;
import com.netminer.common.util.FileUtil;
import com.netminer.common.util.MailMessageUtil;
import com.netminer.common.util.ModelConverterUtil;
import com.netminer.download_buy.buy.model.BuyModel;
import com.netminer.download_buy.buy.model.DacomEncryptSettlement;
import com.netminer.manager.edition.model.EditionModel;
import com.netminer.manager.edition.model.EditionpackageModel;
import com.netminer.manager.edition.service.EditionServiceIf;
import com.netminer.manager.extension.model.ExtensionModel;
import com.netminer.manager.extension.service.ExtensionServiceIf;
import com.netminer.manager.license.model.LicenseModel;
import com.netminer.manager.license.service.LicenseServiceIf;
import com.netminer.manager.nmuser.model.NmUserModel;
import com.netminer.manager.nmuser.service.NmUserServiceIf;
import com.netminer.manager.productpackage.model.ProductpackageModel;
import com.netminer.manager.productpackage.service.ProductpackageServiceIf;
import com.netminer.manager.sale.dao.SaleDao;
import com.netminer.manager.sale.model.SaleModel;
import com.netminer.manager.sale.service.SaleServiceIf;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BuyService implements BuyServiceIf {

	@Inject
	private LicenseServiceIf licenseService;

	@Inject
	private SessionServiceIf sessionService;

	@Inject
	private ProductpackageServiceIf productpackageService;

	@Inject
	private SaleServiceIf saleService;

	@Inject
	private NmUserServiceIf nmUserService;

	@Inject
	private MailSender mailSender;

	@Inject
	private PropertyServiceIf propertyService;

	@Inject
	private EditionServiceIf editionService;

	@Inject
	private ExtensionServiceIf extensionService;
	
	@Inject
	private NationServiceIf nationService;

	@Inject
	private SaleDao saleDao;
	
	@Override
	public String[] create(BuyModel model) throws Exception {
		SaleModel saleModel = (SaleModel) ModelConverterUtil.convert(model, SaleModel.class);
		int qty = Integer.parseInt(model.getQty());
		String[] saleids = new String[qty];

		// 수량 만큼 saleid 생성
		for (int i = 0; i < qty; i++) {
			saleids[i] = saleService.create(saleModel);
		}

		saleModel.setSaleid(saleids[0]);
		saleModel = saleService.read(saleModel);

		// 카드일때만 결제 정보 세팅
		if ("2".equals(model.getPay())) {
			this.setSettlement(model, saleModel);
		}

//		사용자 정보 업데이트(이메일)
		if (model.getUser_update() != null && "Y".equalsIgnoreCase(model.getUser_update())) {
			this.setUserEmail(model);
		}

//		사용자 정보 업데이트(이메일)
//		if(model.getUser_update() != null && "Y".equalsIgnoreCase(model.getUser_update())) {
//			this.setUserEmail(model);
//		}
//		
		// 완료 메일 발송
		this.sendMail(model, saleids[0]);

		return saleids;
	}

	/**
	 * lg+과 연동하기 위한 데이터 set
	 * 
	 * @param model
	 * @param saleModel
	 * @throws Exception
	 */
	private void setSettlement(BuyModel model, SaleModel saleModel) throws Exception {
		String mid = propertyService.getString("pay.MID");
		String LGD_MID = ("test".equals(propertyService.getString("pay.TYPE")) ? "t" : "") + mid;
		DacomEncryptSettlement dacomSettlement = new DacomEncryptSettlement(LGD_MID,
				propertyService.getString("pay.MERTKEY"));
		dacomSettlement.setAmount(model.getTotal());
		dacomSettlement.setBuyer(saleModel.getFullname());
		dacomSettlement.setOid(saleModel.getOid());
		dacomSettlement.setProductinfo(saleModel.getFilename());
		dacomSettlement.setFail_url(propertyService.getString("pay.PAGE_FAILED"));
		dacomSettlement.setRet_url(propertyService.getString("pay.PAGE_SUCCEED"));
		dacomSettlement.setHashdata();

		// 반환을 위해 모델에 세팅한다.
		model.setMid(dacomSettlement.getMid());
		model.setEncrypted_oid(dacomSettlement.getOid());
		model.setBuyer(dacomSettlement.getBuyer());
		model.setProductinfo(dacomSettlement.getProductinfo());
		model.setCurrency(dacomSettlement.getCurrency());
		model.setEncrypted_amount(dacomSettlement.getAmount());
		model.setHome_url(dacomSettlement.getHome_url());
		model.setEncrypted_ret_url(dacomSettlement.getRet_url());
		model.setEncrypted_fail_url(dacomSettlement.getFail_url());
		model.setEncrypted_note_url(dacomSettlement.getNote_url());
		model.setTimestamp(dacomSettlement.getTimestamp());
		model.setHashdata(dacomSettlement.getHashdata());
		model.setReturnurl(propertyService.getString("server.url") + "/download_buy/buy/buycomplete-popup.do");
	}

	/**
	 * 메일 set
	 * 
	 * @param model
	 * @throws Exception
	 */
	private void setUserEmail(BuyModel model) throws Exception {
		NmUserModel nmUserModel = new NmUserModel();
		nmUserModel.setLoginid(model.getSessionId());
		nmUserModel.setEmail(model.getEmail());
		nmUserService.update_email(nmUserModel);
	}

	@Override
	public BuyModel read(BuyModel model) throws Exception {
		LicenseModel licenseModel = new LicenseModel();
		licenseModel.setLicensetype(model.getLicenseusage());
		List<SelectBoxModel> termsList = licenseService.readList_termsByType(licenseModel);
		List<SelectBoxModel> sizesList = licenseService.readList_sizesByType(licenseModel);

		model.setLicensetermsList(termsList);
		model.setLicensesizesList(sizesList);

		List<SelectBoxModel> countryList = saleService.readList_country();
		model.setCountryList(countryList);

		NmUserModel nmUserModel = new NmUserModel();
		nmUserModel.setLoginid(sessionService.getSessionModel().getSessionId());
		nmUserModel = nmUserService.read(nmUserModel);
		model.setEmail(nmUserModel.getEmail());

		if ("2".equals(model.getLicenseusage())) {
			model.setQtyList(30);
		} else {
			model.setQtyList(1);
		}
		return model;
	}

	@Override
	public BuyModel read_package(BuyModel model) throws Exception {
		ProductpackageModel productpackageModel = new ProductpackageModel();
		productpackageModel.setProduct(propertyService.getString("product.id"));
		productpackageModel.setLicenseusage(model.getLicenseusage());
		productpackageModel.setLicenseterm(model.getLicenseterm());
		productpackageModel.setLicensesize(model.getLicensesize());

		List<ProductpackageModel> productpackageModelList = productpackageService.readList(productpackageModel);

		model.setProductpackageModelList(productpackageModelList);

		return model;
	}

	@Override
	public BuyModel read_edition(BuyModel model) throws Exception {
		ProductpackageModel productpackageModel = new ProductpackageModel();

		productpackageModel.setProduct(propertyService.getString("product.id"));
		System.out.println("edition model.getProductid() : " + productpackageModel.getProduct());
		productpackageModel.setLicenseusage(model.getLicenseusage());
		productpackageModel.setLicenseterm(model.getLicenseterm());

		List<EditionModel> editionModelList = editionService.readList_editionDetail(productpackageModel);

		model.setEditionModelList(editionModelList);

		return model;
	}

	@Override
	public BuyModel readExtension(BuyModel model) throws Exception {
		ProductpackageModel productpackageModel = new ProductpackageModel();
		productpackageModel.setLicenseusage(model.getLicenseusage());
		productpackageModel.setKor(model.isKor());

		List<ExtensionModel> extensionModelList = extensionService.readExtensionDetailList(productpackageModel);
		/* Description을 적지 않아 Null인 익스텐션 모델은 화면에서 제외하도록 합니다.
		 * 이는 NDC를 한국어판으로만 배포하는 작업에서 시작되었습니다.
		 */
		List<ExtensionModel> selectedExtensions = extensionModelList.stream().filter(m -> {
			return (model.isKor() && m.getDescriptionKr() != null) || (!model.isKor() && m.getDescription() != null);
		}).collect(Collectors.toList());

		model.setExtensionModelList(selectedExtensions);

		return model;
	}

	@Override
	public BuyModel read_editionpackage(BuyModel model) throws Exception {

		EditionpackageModel editionpackageModel = new EditionpackageModel();
		if (model.getEdition() == null || model.getEdition().equals("")) {
			if (model.getLicenseusage().equals(SaleModel.LICENSEUSAGE_STUDENT)
					|| model.getLicenseusage().equals(SaleModel.LICENSEUSAGE_ACADEMIC)
					|| model.getLicenseusage().equals(SaleModel.LICENSEUSAGE_COMMERCIAL)) {
				model.setEdition(SaleModel.EDITION_PREMIUM);
			} else {
				model.setEdition("1");
			}
		}

		editionpackageModel.setEditionid(model.getEdition());

		List<EditionpackageModel> editionpackageModelList = editionService.readList_editionpackage(editionpackageModel);

		model.setEditionpackageList(editionpackageModelList);

		return model;
	}

	/**
	 * 메일 발송
	 * 
	 * @param model
	 * @param saleid
	 */
	private void sendMail(BuyModel model, String saleid) {

		try {
			String file = "";

			SaleModel saleModel = new SaleModel();
			saleModel.setSaleid(saleid);

			saleModel = saleService.read(saleModel);
			saleModel.setKor(model.isKor());

			try {
				saleModel.setTotal(String.format("%,d", Integer.parseInt(saleModel.getTotal())));// total comma
			} catch (Exception e) {
				saleModel.setTotal("0");
			}

			MailModel mailModel = new MailModel();
			mailModel.setKor(model.isKor());
			mailModel.setHtml(model.isKor());

			mailModel.setToEmail(saleModel.getEmail());

			// 무료
			if ("0".equals(model.getLicenseusage())) {
				file = "Payment_Student_courcework";

			} else {// 유료
				if ("1".equals(model.getPay())) {
					file = "Payment_Account_transfer";
					saleModel.setPay("계좌이체");

				} else {
					if(model.getLicenseusage().equals(SaleModel.LICENSEUSAGE_COMMERCIAL)) {
						file = "Payment_Commercial";
					} else {
						file = "Payment_Research";
					}
					saleModel.setPay("카드결제");
				}
			}

			mailModel.setSubject(
					MailMessageUtil.generateSubject(saleModel, propertyService.getString("mail.subject.Path"), file));
			mailModel.setMessage(MailMessageUtil.generateContents(saleModel,
					propertyService.getString("mail.template.Path") + file));

			mailSender.notify(mailModel);

			// 관리자에게
			mailModel = new MailModel();
			mailModel.setKor(false);
			mailModel.setHtml(false);

			if ("0".equals(model.getShipping())) {
				saleModel.setShipping("ESD");
			} else if ("1".equals(model.getShipping())) {
				if ("2".equals(model.getLicenseterm())) {
					saleModel.setShipping("택배");
				} else {
					saleModel.setShipping("CD");
				}
			}
			String payman = "Payment_Manager";
			String manual = model.getManual();
			if (null != manual && !manual.equals("0")) {
				payman = "Payment_Manager_Manual";
			}

			saleModel.setNote(model.getQty());

			mailModel.setToEmail(propertyService.getString("manager.mail.id"));
			mailModel.setSubject(MailMessageUtil.generateSubject(saleModel,
					propertyService.getString("mail.subject.Path"), "Payment_Manager"));
			mailModel.setMessage(MailMessageUtil.generateContents(saleModel,
					propertyService.getString("mail.template.Path") + payman));
			mailSender.notify(mailModel);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
	}
	private void sendMailFree(SaleModel model, String saleid) {

		try {
			SaleModel saleModel = new SaleModel();
			saleModel.setSaleid(saleid);

			saleModel = saleService.readFree(saleModel);
			saleModel.setKor(model.isKor());

			MailModel mailModel = new MailModel();
			mailModel.setKor(model.isKor());
			mailModel.setHtml(model.isKor());

			// 관리자에게
			mailModel = new MailModel();
			mailModel.setKor(false);
			mailModel.setHtml(false);

			mailModel.setToEmail(propertyService.getString("manager.mail.id"));
			
			mailModel.setSubject(MailMessageUtil.generateSubject(saleModel,
					propertyService.getString("mail.subject.Path"), "ApplyFreeEdition"));
			
			mailModel.setMessage(MailMessageUtil.generateContents(saleModel,
					propertyService.getString("mail.template.Path") + "ApplyFreeEdition"));
			
			mailSender.notify(mailModel);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
	}


	@Override
	public SaleModel readFree(SaleModel model) throws Exception {
		
		if("".equals(model.getSaleid())) {
			model.setNationList(nationService.readList(model));
			
		} else {
			model= saleService.readFree(model);
		}
		
		return model;
	}
	@Override
	public SaleModel createFree(SaleModel model) throws Exception {
		
		log.info(String.format("free create 1 model %s", model));
		
		if(model.getAttach_files() != null) {
			String fileName = this.getFileName(model);
			
			for(MultipartModel multipartModel : model.getAttach_files()) {
				multipartModel.setFile_name(fileName);
				
				model.setOrgname(multipartModel.getFile_org_name());
				model.setFilename(multipartModel.getFile_name());
			}
			
			this.createLocalFile(model.getAttach_files());
			
		}
//		else {
//			if(model.getLCTRE_INTRCN() != null && !"".equals(model.getLCTRE_INTRCN())) {
//				model = new AcademicstatusModel();
//				model.setOid(model.getOid());
//				model.setUrl(model.getProofUrl());
//				model.setConfirmed("N");
//				
//				academicstatusService.create(model);
//			}
//		}
		
//		saleService.createFree(model);
		log.info(String.format("free create 2 model %s", model));
		
		saleDao.createFree(model);

		this.sendMailFree(model, model.getSaleid());
		
		return model;
	}
	private String getFileName(SaleModel model) throws Exception {
		return DateUtil.stringFormatSSS() + new Random().nextInt();
	}
	private void createLocalFile(MultipartModel[] multipartModels) throws Exception {

		String localFilePath = propertyService.getString("upload.file.proof.Path");

		FileUtil.checkDirectory(localFilePath);
		
		for (MultipartModel multipartModel : multipartModels) {
			FileUtil.createFile(multipartModel, localFilePath);
		}
	}

}

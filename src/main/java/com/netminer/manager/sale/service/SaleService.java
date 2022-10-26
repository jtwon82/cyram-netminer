package com.netminer.manager.sale.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cyframe.model.MultipartModel;
import com.cyframe.model.SelectBoxModel;
import com.cyframe.property.PropertyServiceIf;
import com.netminer.common.mail.model.MailModel;
import com.netminer.common.nation.service.NationServiceIf;
import com.netminer.common.util.DateUtil;
import com.netminer.common.util.FileUtil;
import com.netminer.common.util.MailMessageUtil;
import com.netminer.common.util.ModelConverterUtil;
import com.netminer.download_buy.download.model.DownloadModel;
import com.netminer.manager.academicstatus.model.AcademicstatusModel;
import com.netminer.manager.academicstatus.service.AcademicstatusServiceIf;
import com.netminer.manager.edition.model.EditionModel;
import com.netminer.manager.edition.model.EditionpackageModel;
import com.netminer.manager.edition.service.EditionServiceIf;
import com.netminer.manager.extension.model.ExtensionModel;
import com.netminer.manager.extension.model.ExtensionQueryModel;
import com.netminer.manager.extension.service.ExtensionServiceIf;
import com.netminer.manager.license.service.LicenseServiceIf;
import com.netminer.manager.nmuser.model.NmUserModel;
import com.netminer.manager.nmuser.service.NmUserServiceIf;
import com.netminer.manager.payment.model.PaymentModel;
import com.netminer.manager.payment.service.PaymentServiceIf;
import com.netminer.manager.productpackage.model.ProductpackageModel;
import com.netminer.manager.productpackage.service.ProductpackageServiceIf;
import com.netminer.manager.sale.dao.SaleDao;
import com.netminer.manager.sale.model.SaleLicenseModel;
import com.netminer.manager.sale.model.SaleModel;
import com.netminer.manager.sale.model.SalePackageModel;

@Service
public class SaleService implements SaleServiceIf {

	@Inject
	private SaleDao saleDao;

	@Inject
	private PropertyServiceIf propertyService;
	
	@Inject
	private LicenseServiceIf licenseService;
	
	@Inject
	private EditionServiceIf editionService;
	
	@Inject
	private ProductpackageServiceIf productpackageService;
	
	@Inject
	private ExtensionServiceIf extensionService;
	
	@Inject
	private AcademicstatusServiceIf academicstatusService;
	
	@Inject
	private NmUserServiceIf nmUserService;
	
	@Inject
	private PaymentServiceIf paymentService;

	@Inject
	private NationServiceIf nationService;
	
	@Override
	public String create(SaleModel model) throws Exception {
		
		this.setLoginid(model);
		this.generateOid(model);

		model.setFilename(propertyService.getString("product.filename"));
		model.setProductid(propertyService.getString("product.id"));
		if(model.getEdition() ==null || "".equals(model.getEdition())){
			model.setEdition("1");
		}
		if(model.getRegistered() ==null ||"".equals(model.getRegistered())){
			model.setRegistered("0");
		}
		
		this.setPriceFator(model);
		this.setProductSerial(model);
		
		// PERPETUAL 이면
		if("2".equals(model.getLicenseterm())) {
			this.setHardwareKey(model);
		}
		
		this.setReplacedid(model);
		
		this.setExpireDate(model);
		
		this.setUser(model);
		
		String saleid = saleDao.create(model);
		
		//신분 입증 등록
		this.createAcademicstatus(model);
		
		//sale package 등록
		this.createSalePackage(saleid, model);

		//sale extension 등록
		this.createSaleExtension(model);
		
		//결제 정보 등록
		this.createPayment(model);
		
		return saleid;
	}

	@Override
	public void create_copy(SaleModel model) throws Exception {
		SaleModel omodel = (SaleModel) model.clone();
		
		String saleid = this.create(model);
		
		omodel.setReplacedid(saleid);
		saleDao.update_replacedid(omodel);
	}
	
	/**
	 * replace id set
	 * @param model
	 * @throws Exception
	 */
	private void setReplacedid(SaleModel model) throws Exception {
		if(model.getReplacedid() == null || "".equals(model.getReplacedid()) || "0".equals(model.getReplacedid())) {
			model.setReplacedid("-1");//최종을 의미함
		}
	}
	
	/**
	 * login id set
	 * @param model
	 * @throws Exception
	 */
	private void setLoginid(SaleModel model) throws Exception {
		if(model.getLoginid() == null || "".equals(model.getLoginid())) {
			if(model.getSessionId() != null && !"".equals(model.getSessionId())) {
				model.setLoginid(model.getSessionId());
			}
		}
	}
	
	/**
	 * oid 생성
	 * @param model
	 * @throws Exception
	 */
	private void generateOid(SaleModel model) throws Exception {
		if(model.getOid() == null || "".equals(model.getOid())) {
			model.setOid(model.getLoginid() + DateUtil.stringFormatSSS());
		}
	}

	/**
	 * 현재는 무의미함
	 * @param model
	 * @throws Exception
	 */
	private void setPriceFator(SaleModel model) throws Exception {
		/*
		 * 무의미한 가격정책 설계로 판단
		 * 1로 하드코딩 하기로 함
		*/
		model.setLicenseusagefactor("1");
		model.setLicensetermfactor("1");
		model.setLicensesizefactor("1");
	}

	/**
	 * Productserial set
	 * @param model
	 * @throws Exception
	 * 
	 * 20170216 ksgs4 productserial 수량에 맞춰 증가하는것으로 변경
	 */
	private void setProductSerial(SaleModel model) throws Exception {
		SaleModel npModel = saleDao.read_next_productserial();
		model.setProductserial(npModel.getNext_productserial());
	}
	
	/**
	 * Hardwarekey set
	 * @param model
	 * @throws Exception
	 */
	private void setHardwareKey(SaleModel model) throws Exception {
		if(model.getHardwarekey() == null || "".equals(model.getHardwarekey())) {
			model.setHardwarekey(String.valueOf(this._setHardwareKey()));
		}
	}
	
	/**
	 * Hardwarekey 가 존재할 경우 계속 재귀해서 찾음(빈 값이 나올때까지)
	 * @return
	 * @throws Exception
	 */
	private int _setHardwareKey() throws Exception {
		int hardwareKey = 0;
		int maxHardwareKey = 9000;
		int minHardwareKey = 2002;

		Random rand = new Random(System.currentTimeMillis());
		hardwareKey = rand.nextInt(maxHardwareKey);

		if(hardwareKey < 2002) {
			hardwareKey = hardwareKey + minHardwareKey;
		}
		
		SaleModel nhModel = new SaleModel();
		nhModel.setHardwarekey(String.valueOf(hardwareKey));
		
		nhModel = saleDao.read_next_hardwarekey(nhModel);

		if(nhModel == null) {
			return hardwareKey;
		} else {
			//재귀
			return this._setHardwareKey();
		}
	}
	
	/**
	 * 기간 만료 날짜 설정
	    TERM_SIX_MONTH = 0;
	    TERM_ONE_YEAR = 1;
	    TERM_PERPETUAL = 2;
	 * @param licenseterm
	 * @return
	 * @throws Exception
	 */
	private void setExpireDate(SaleModel model) throws Exception {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        String licenseterm = model.getLicenseterm();
        
        if("0".equals(licenseterm)) {
        	calendar.add(2, 6);
        } else if("1".equals(licenseterm)) {
        	calendar.add(2, 12);
        } else if("2".equals(licenseterm)) {
        	calendar.set(3000, 0, 1);
        }
        
        model.setExpiredate(DateUtil.dailyformat(calendar.getTime()));
	}

	/**
	 * 사용자 정보 set
	 * @param model
	 * @throws Exception
	 */
	private void setUser(SaleModel model) throws Exception {
		NmUserModel nmUserModel = new NmUserModel();
		nmUserModel.setLoginid(model.getSessionId());
		nmUserModel = nmUserService.read(nmUserModel);
		
		if(model.getFullname() == null || "".equals(model.getFullname())) {
			if(nmUserModel.getFirstname() != null && !"".equals(nmUserModel.getFirstname())) {
				model.setFullname(nmUserModel.getFirstname() + ", " + nmUserModel.getLastname());
			}
		}

		if(model.getOrgname() == null || "".equals(model.getOrgname())) {
			model.setOrgname(nmUserModel.getOrganization());
		}
	}
	
	/**
	 * 신분입증 create
	 * @param model
	 * @throws Exception
	 */
	private void createAcademicstatus(SaleModel model) throws Exception {

		AcademicstatusModel academicstatusModel = new AcademicstatusModel();
		academicstatusModel.setOid(model.getOid());
		
		academicstatusModel = academicstatusService.read(academicstatusModel);
		
		if(academicstatusModel == null) {
			//파일이 있는 경우
			if(model.getAttach_files() != null) {
				String fileName = this.getFileName(model);
				
				for(MultipartModel multipartModel : model.getAttach_files()) {
					multipartModel.setFile_name(fileName);
					
					academicstatusModel = new AcademicstatusModel();
					academicstatusModel.setOid(model.getOid());
					academicstatusModel.setUrl(model.getProofUrl());
					academicstatusModel.setImagepath(fileName);
					academicstatusModel.setOrgname(multipartModel.getFile_org_name());
					academicstatusModel.setConfirmed("N");
					
					academicstatusService.create(academicstatusModel);
				}
				
				this.createLocalFile(model.getAttach_files());
			} else {
				//URL만 있는 경우
				if(model.getProofUrl() != null && !"".equals(model.getProofUrl())) {
					academicstatusModel = new AcademicstatusModel();
					academicstatusModel.setOid(model.getOid());
					academicstatusModel.setUrl(model.getProofUrl());
					academicstatusModel.setConfirmed("N");
					
					academicstatusService.create(academicstatusModel);
				}
			}
		}
	}

	/**
	 * 파일명 생성
	 * @param model
	 * @return
	 * @throws Exception
	 */
	private String getFileName(SaleModel model) throws Exception {
		return model.getOid() + "_" + DateUtil.stringFormatSSS() + new Random().nextInt();
	}

	/**
	 * 물리적 파일 생성
	 * @param multipartModels
	 * @throws Exception
	 */
	private void createLocalFile(MultipartModel[] multipartModels) throws Exception {

		String localFilePath = propertyService.getString("upload.file.proof.Path");

		FileUtil.checkDirectory(localFilePath);
		
		for (MultipartModel multipartModel : multipartModels) {
			FileUtil.createFile(multipartModel, localFilePath);
		}
	}

	/**
	 * sale package create
	 * @param saleid
	 * @param model
	 * @throws Exception
	 */
	private void createSalePackage(String saleid, SaleModel model) throws Exception {
		SalePackageModel salePackageModel = null;
		ProductpackageModel productpackageModel = null;
		List<ProductpackageModel> productpackageModelList = null;
		
		String[] packages = model.getPackages();
		
		if (null != packages) {
			for (String id : packages) {
				productpackageModel = new ProductpackageModel();
				productpackageModel.setId(id);
				productpackageModel.setProduct(model.getProductid());
				productpackageModelList = productpackageService
						.readList(productpackageModel);

				for (ProductpackageModel rProductpackageModel : productpackageModelList) {
					salePackageModel = new SalePackageModel();
					salePackageModel.setSaleid(saleid);
					salePackageModel.setProductpackageid(rProductpackageModel.getId());
					salePackageModel.setKrwprice(rProductpackageModel
							.getKrwprice());
					salePackageModel.setUsdprice(rProductpackageModel
							.getUsdprice());

					saleDao.create_salepackage(salePackageModel);
				}
			}
		}
	}
	
	private void createSaleExtension(SaleModel model) throws Exception {
		String[] extensions = model.getExtensions();
		List<ExtensionModel> extensionToBuy = model.getAvailableExtensions();

		extensionService.deleteExtensions(model.getProductserial());

		if (null != extensions) {
			for (String id : extensions) {
				ExtensionQueryModel extensionQueryModel = new ExtensionQueryModel();
				extensionQueryModel.setId(id);
				extensionQueryModel.setProductSerial(model.getProductserial());
				extensionQueryModel.setLicenseUsage(model.getLicenseusage());
				Boolean fromAdmin = false;
				for(ExtensionModel extension : extensionToBuy) {
					if(id.equals(extension.getExtensionId())) {
						extensionQueryModel.setExpireDate(extension.getExpireDate());
						fromAdmin = true;
					}
				}
				saleDao.createSaleExtension(extensionQueryModel);
				if (fromAdmin && extensionQueryModel.getId().equals(ExtensionModel.SOCIAL_NETWORK_COLLECTOR)) {
					saleDao.createExtensionsSNSCollector(extensionQueryModel);
				} else if (fromAdmin && extensionQueryModel.getId().equals(ExtensionModel.BIBLIO_DATA_COLLECTOR)) {
					saleDao.createExtensionsBiblioCollector(extensionQueryModel);
				}
			}
		}
	}

	/**
	 * payment create
	 * @param model
	 * @throws Exception
	 */
	private void createPayment(SaleModel model) throws Exception {
		PaymentModel paymentModel = new PaymentModel();
		paymentModel.setOid(model.getOid());

		PaymentModel rpaymentModel = paymentService.read(paymentModel);

		if(model.getTotal() == null || "".equals(model.getTotal())) {
			paymentModel.setPrice("0");
		} else {
			paymentModel.setPrice(model.getTotal());
		}
		
		if(model.getPrice() == null || "".equals(model.getPrice())) {
			paymentModel.setUnitsprice("0");
		} else {
			paymentModel.setUnitsprice(model.getPrice());
		}

		if(model.getExtensionPrice() == null || "".equals(model.getExtensionPrice())) {
			paymentModel.setExtensionPrice("0");
		} else {
			paymentModel.setExtensionPrice(model.getExtensionPrice());
		}
		
		if(model.getSurtax() == null || "".equals(model.getSurtax())) {
			paymentModel.setVat("0");
		} else {
			paymentModel.setVat(model.getSurtax());
		}
		
		if(model.getDelivery() == null || "".equals(model.getDelivery())) {
			paymentModel.setShipping_cost("0");
		} else {
			paymentModel.setShipping_cost(model.getDelivery());
		}
		
		paymentModel.setUpgradediffer("0");
		
		if(model.isKor()) {
			paymentModel.setAbroad("0");
			paymentModel.setCurrency("KRW");
		} else {
			paymentModel.setAbroad("1");
			paymentModel.setCurrency("USD");
		}
		
		if(rpaymentModel != null) {
			paymentService.update(paymentModel);
		} else {
			paymentService.create(paymentModel);
		}
	}
	
	@Override
	public List<SelectBoxModel> readList_country() throws Exception {
		return saleDao.readList_country();
	}
	
	@Override
	public List<SaleModel> readList(SaleModel model) throws Exception {
		List<SaleModel> list = null;
		int totalCount = saleDao.readTotal(model);
		
		if(totalCount > 0) {
			model.setTotalCount(totalCount);
			list = saleDao.readList(model);
		}

		return list;
	}
	
	/**
	 * 해당 사용자에 대한 구매내역
	 */
	@Override
	public List<SaleModel> readList_sessionid(SaleModel model, boolean isWithSalePackage) throws Exception {
		List<SaleModel> list = saleDao.readList_sessionid(model);
		
		if(isWithSalePackage) {
			List<SalePackageModel> salePackageList = null;
			List<ProductpackageModel> productpackageModelList = null;
			ProductpackageModel productpackageModel = null;
			StringBuffer sb = null;
			
			for(SaleModel saleModel : list) {
				sb = new StringBuffer();
				
				salePackageList = saleDao.readList_salePackage(saleModel);
				
				for(SalePackageModel salePackageModel : salePackageList) {
					productpackageModel = new ProductpackageModel();
					productpackageModel.setId(salePackageModel.getProductpackageid());
					productpackageModelList = productpackageService.readList(productpackageModel);
					
					for(ProductpackageModel pModel : productpackageModelList) {
						sb.append(pModel.getSubcategory() + "<br/>");
					}
				}
				saleModel.setNote(sb.toString());
			}
		}
		return list;
	}
	
	@Override
	public SaleModel read(SaleModel model) throws Exception {
		SaleModel rModel = saleDao.read(model);
		
		if(rModel == null) {
			rModel = new SaleModel();
		} else {
			rModel = (SaleModel) ModelConverterUtil.convert(model, rModel);
		}
		
		//license usages, terms, sizes
		rModel.setLicenseusagesList(licenseService.readList_usages(rModel.getProductid()));
		rModel.setLicensetermsList(licenseService.readList_terms(rModel.getProductid()));
		rModel.setLicensesizesList(licenseService.readList_sizes(rModel.getProductid()));
		
		rModel.setEditionList(this.setEditionModelList(rModel));
		// country list
		rModel.setCountryList(licenseService.readList_terms(rModel.getProductid()));
		
		//product package
		List<ProductpackageModel> productpackageModelList = this.setProductpackageModelList(rModel);
		
		//sale package
		this.setPackages(rModel, productpackageModelList);
		
		ExtensionModel[] purchasedExtensions = getExtensionsArray(rModel.getProductserial(), rModel.getLicenseusage());
		String[] extensionIds = new String[purchasedExtensions.length];
		for(int i = 0; i < purchasedExtensions.length; i++) {
			extensionIds[i] = purchasedExtensions[i].getExtensionId();
		}
		rModel.setExtensions(extensionIds);
		rModel.setExtensionNames(Arrays.stream(purchasedExtensions).map(e -> e.getLabel()).collect(Collectors.joining(", ")));
		
		this.setAvailableExtensions(rModel, purchasedExtensions);
		
		//next_productserial
		SaleModel npModel = saleDao.read_next_productserial();
		rModel.setNext_productserial(npModel.getNext_productserial());
		
		//Next_hardwarekey
		rModel.setNext_hardwarekey(String.valueOf(this._setHardwareKey()));
		
		//proof
		this.setAcademicstatus(rModel);
		
		//payment
		this.setPayment(rModel);
		
		return rModel;
	}

	private ExtensionModel[] getExtensionsArray(String productSerial, String usage) {
		return extensionService.readExtensions(productSerial, usage);
	}

	private void setAvailableExtensions(SaleModel model, ExtensionModel[] purchased) {
		List<ExtensionModel> availableExtensions = extensionService.readAvailableExtensions(model);
		for(ExtensionModel available : availableExtensions) {
			for(ExtensionModel bought : purchased) {
				if(bought.getExtensionId().equals(available.getExtensionId())) {
					available.setExpireDate(bought.getExpireDate());
				}
			}
		}
		model.setAvailableExtensions(availableExtensions);
	}

	/**
	 * Edition조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public List<EditionModel> setEditionModelList(SaleModel model) throws Exception {
		ProductpackageModel productpackageModel = new ProductpackageModel();
		
		if(model.getSaleid() == null || "".equals(model.getSaleid())) {
			productpackageModel.setProduct(SaleModel.NEW_PRODUCT);
			productpackageModel.setLicenseusage(SaleModel.LICENSEUSAGE_STUDENT);
			productpackageModel.setLicenseterm(SaleModel.LICENSETERM_ONE_YEAR);
		} else {
			productpackageModel.setProduct(model.getProductid());
			productpackageModel.setLicenseusage(model.getLicenseusage());
			productpackageModel.setLicenseterm(model.getLicenseterm());
		}
		
		return editionService.readList_editionDetail(productpackageModel);
	}
	
	/**
	 * Edition조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	
	@Override
	public SaleModel editionPackage_read(SaleModel model) throws Exception {
		EditionpackageModel editionpackageModel = new EditionpackageModel();
		System.out.println("model.getEdition() : "+model.getEdition());
		System.out.println("model.getEditionname() : "+ model.getEdition_name());
		editionpackageModel.setEditionid(model.getEdition());	
		List<EditionpackageModel> editionpackageModelList = editionService.readList_editionpackage(editionpackageModel);
		
		model.setEdtionpackageModelList(editionpackageModelList);
		return model;
	}
	
	/**
	 * product package 조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	private List<ProductpackageModel> setProductpackageModelList(SaleModel model) throws Exception {
		ProductpackageModel productpackageModel = new ProductpackageModel();
		if(model.getSaleid() == null || "".equals(model.getSaleid())) {
			// No Sale Id
			productpackageModel.setProduct(SaleModel.NEW_PRODUCT);
			productpackageModel.setLicenseusage(SaleModel.LICENSEUSAGE_STUDENT);
			productpackageModel.setLicenseterm(SaleModel.LICENSETERM_ONE_YEAR);
			productpackageModel.setLicensesize(SaleModel.LICENSESIZE_HUGE);
			model.setProductid(SaleModel.NEW_PRODUCT);
			model.setLicenseusage(SaleModel.LICENSEUSAGE_STUDENT);
			model.setLicenseterm(SaleModel.LICENSETERM_ONE_YEAR);
			model.setLicensesize(SaleModel.LICENSESIZE_HUGE);
			model.setEdition(SaleModel.PLAN_PREMIUM);
		} else {
			productpackageModel.setProduct(model.getProductid());
			productpackageModel.setLicenseusage(model.getLicenseusage());
			productpackageModel.setLicenseterm(model.getLicenseterm());
			productpackageModel.setLicensesize(model.getLicensesize());
		}

		List<ProductpackageModel> productpackageModelList = productpackageService.readList(productpackageModel);
		model.setProductpackageModelList(productpackageModelList);
		return productpackageModelList;
	}

	/**
	 * product package 조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@Override
	public SaleModel getProductpackagePriceList(SaleModel model) throws Exception {
		ProductpackageModel productpackageModel = new ProductpackageModel();
		
		productpackageModel.setProduct(model.getProductid());
		productpackageModel.setLicenseusage(model.getLicenseusage());
		productpackageModel.setLicenseterm(model.getLicenseterm());
		productpackageModel.setLicensesize(model.getLicensesize());
		
		List<ProductpackageModel> productpackageModelList = productpackageService.readList(productpackageModel);
		model.setProductpackagePriceList(productpackageModelList);
		return model;
	}
	
	
	/**
	 * package 조회
	 * @param model
	 * @param productpackageModelList
	 * @throws Exception
	 */
	private void setPackages(SaleModel model, List<ProductpackageModel> productpackageModelList) throws Exception {
		// 이 Sale에서 선택한 패키지 리스트
		List<SalePackageModel> salePackageList = saleDao.readList_salePackage(model);

		String[] packages = new String[salePackageList.size()];
		int i = 0;
		
		for(SalePackageModel spModel : salePackageList) {
			packages[i++] = spModel.getProductpackageid();
		}

		// 패키지 id 배열을 SaleModel에 저장
		model.setPackages(packages);
		
		//메일 발송 시 필요
		List<ProductpackageModel> salePackageModelList = new ArrayList<ProductpackageModel>();
		
		for(ProductpackageModel pModel : productpackageModelList) {
			for(SalePackageModel spModel : salePackageList) {
				if(pModel.getId().equals(spModel.getProductpackageid())) {
					salePackageModelList.add(pModel);
				}
			}
		}
		model.setSalePackageModelList(salePackageModelList);
	}
	
	/**
	 * 신분입증 조회
	 * @param model
	 * @throws Exception
	 */
	private void setAcademicstatus(SaleModel model) throws Exception {
		AcademicstatusModel academicstatusModel = new AcademicstatusModel();
		academicstatusModel.setOid(model.getOid());
		
		academicstatusModel = academicstatusService.read(academicstatusModel);
		
		if(academicstatusModel != null) {
			model.setProofUrl(academicstatusModel.getUrl());
			model.setProofImage(academicstatusModel.getImagepath());
			model.setProoforg(academicstatusModel.getOrgname());
			model.setConfirmdate(academicstatusModel.getConfirmdate());
			model.setConfirmed(academicstatusModel.getConfirmed());
		}
	}

	/**
	 * 결제 조회
	 * @param model
	 * @throws Exception
	 */
	private void setPayment(SaleModel model) throws Exception {
		if(model.getOid() != null && !"".equals(model.getOid())) {
			PaymentModel paymentModel = new PaymentModel();
			paymentModel.setOid(model.getOid());
			
			paymentModel = paymentService.read(paymentModel);
			
			if(paymentModel != null) {
				model.setTotal(paymentModel.getPrice());
				model.setPrice(paymentModel.getUnitsprice());
				model.setExtensionPrice(paymentModel.getExtensionPrice());
				model.setSurtax(paymentModel.getVat());
				model.setDelivery(paymentModel.getShipping_cost());
				model.setAbroad(paymentModel.getAbroad());
				model.setCurrency(paymentModel.getCurrency());
			}
		}
	}

	@Override
	public void update(SaleModel model) throws Exception {
		saleDao.update(model);

		//sale package 수정
		this.updateSalePackage(model);
		
		this.updateSaleExtensions(model);

		//결제 정보 수정
		this.updatePayment(model);

		//신분입증 업데이트
		this.updateAcademicstatus(model);
	}

	private void updateSaleExtensions(SaleModel model) throws Exception {
		saleDao.delete_extensions(model);
		this.createSaleExtension(model);
	}

	/**
	 * sale package update
	 * @param model
	 * @throws Exception
	 */
	private void updateSalePackage(SaleModel model) throws Exception {
		saleDao.delete_salepackage(model);
		this.createSalePackage(model.getSaleid(), model);
	}

	/**
	 * 결제 업데이트
	 * @param model
	 * @throws Exception
	 */
	private void updatePayment(SaleModel model) throws Exception {
		PaymentModel paymentModel = new PaymentModel();
		paymentModel.setOid(model.getOid());
		
		paymentModel = paymentService.read(paymentModel);

		if(paymentModel == null) {
			//등록
			if(model.getPrice() != null && !"".equals(model.getPrice()) && !"0".equals(model.getPrice())) {
				this.createPayment(model);
			}
		} else {
			// 수정
			if("KRW".equals(model.getCurrency())) {
				paymentModel.setAbroad("0");
			} else {
				paymentModel.setAbroad("1");
			}
			
			paymentModel.setPrice(model.getTotal());
			paymentModel.setUnitsprice(model.getPrice());
			paymentModel.setExtensionPrice(model.getExtensionPrice());
			paymentModel.setVat(model.getSurtax());
			paymentModel.setShipping_cost(model.getDelivery());
			paymentModel.setCurrency(model.getCurrency());
			
			paymentService.update(paymentModel);
		}
	}

	/**
	 * 신분입증 업데이트
	 * @param model
	 * @throws Exception
	 */
	private void updateAcademicstatus(SaleModel model) throws Exception {
		if("0".equals(model.getAcademicauth())) {
			AcademicstatusModel academicstatusModel = new AcademicstatusModel();
			academicstatusModel.setOid(model.getOid());
			
			academicstatusModel = academicstatusService.read(academicstatusModel);
			
			if(academicstatusModel != null) {
				//정상확인 안된건만 정상확인 처리
				if("N".equals(academicstatusModel.getConfirmed())) {
					academicstatusService.update(academicstatusModel);
				}
			}
		}
	}
	@Override
	public SaleLicenseModel create_license(SaleModel model) throws Exception {
		String newLicense = generateLicense(model);
		System.out.println("new license : " + newLicense);
		System.out.println("model.getExpiredate() : "+model.getExpiredate());

		SaleLicenseModel licenseModel = new SaleLicenseModel();
		licenseModel.setLicense(newLicense);
		return licenseModel;
	}
	
	
	@Override
	public void update_license(SaleModel model) throws Exception {
		saleDao.update_license(model);
	}
	
	@Override
	public void update_hardwareRegist(SaleModel model) throws Exception {
		saleDao.update_hardwareRegist(model);
	}
	
	@Override
	public void update_hardwareReset(SaleModel model) throws Exception {
		saleDao.update_hardwareReset(model);
	}
	
	@Override
	public void delete_hardwareReset(SaleModel model) throws Exception {
		saleDao.delete_hardwareReset(model);
	}
	
	@Override
	public void delete(SaleModel model) throws Exception {
		saleDao.delete(model);

		//sale package 삭제
		this.deleteSalePackage(model);

		//결제 정보 삭제
		this.deletePayment(model);

		//신분입증 삭제
		this.deleteAcademicstatus(model);
	}

	/**
	 * sale package 삭제
	 * @param model
	 * @throws Exception
	 */
	private void deleteSalePackage(SaleModel model) throws Exception {
		saleDao.delete_salepackage(model);
	}
	
	/**
	 * 결제 삭제
	 * @param model
	 * @throws Exception
	 */
	private void deletePayment(SaleModel model) throws Exception {
		PaymentModel paymentModel = new PaymentModel();
		paymentModel.setOid(model.getOid());
		
		 paymentService.delete(paymentModel);
	}
	
	/**
	 * 신분입증 삭제
	 * @param model
	 * @throws Exception
	 */
	private void deleteAcademicstatus(SaleModel model) throws Exception {
		AcademicstatusModel academicstatusModel = new AcademicstatusModel();
		academicstatusModel.setOid(model.getOid());
		
		academicstatusService.delete(academicstatusModel);
	}

	@Override
	public MailModel popup_sendMailLicense(SaleModel model) throws Exception {
		MailModel mailModel = new MailModel();
		mailModel.setUiMail(model.getEmail());
		mailModel.setKor(model.isKor());
		mailModel.setHtml(model.isKor());

		String key = "";
	
		if("0".equals(model.getLicenseusage())) {
			key = "License_Student_courcework";
		} else if("1".equals(model.getLicenseusage())) {
			key = "License_Student_research";
		} else if("2".equals(model.getLicenseusage())) {
			if("2".equals(model.getLicenseterm())) {
				key = "License_Academic_perpetual";
			} else {
				key = "License_Academic";
			}
		} else if("3".equals(model.getLicenseusage())) {
			key = "License_Institute";
		} else if("5".equals(model.getLicenseusage())) {
			key = "License_Commercial";
		}
		if(model.isKor() && "true".equals(model.getEducation()) && ("1".equals(model.getLicenseusage()) || "2".equals(model.getLicenseusage()))) {
			key = key + "_education";
		}

		mailModel.setSubject(MailMessageUtil.generateSubject(model, propertyService.getString("mail.subject.Path"), key));
		mailModel.setMessage(MailMessageUtil.generateContents(model, propertyService.getString("mail.template.Path") + key));
		
		String filename = this.saveFile(model);
		mailModel.setFilename(filename);
		
		return mailModel;
	}

	/**
	 * 파일 생성
	 * @param model
	 * @return
	 * @throws Exception
	 */
	private String saveFile(SaleModel model) throws Exception {
		String path = propertyService.getString("license.file.Path");
		String fileName = "license-key_CYNM" + model.getProductserial() + "_" + DateUtil.stringFormat() + ".txt";
		
		FileUtil.createFile(model.getSerialnum(), path, fileName);
		
		return path + fileName;
	}
	

	@Override
	public MailModel popup_sendMailApproval(SaleModel model) throws Exception {
		MailModel mailModel = new MailModel();
		mailModel.setUiMail(model.getEmail());
		mailModel.setKor(model.isKor());
		mailModel.setHtml(model.isKor());

		mailModel.setSubject(MailMessageUtil.generateSubject(model, propertyService.getString("mail.subject.Path"), "Approval_academic"));
		mailModel.setMessage(MailMessageUtil.generateContents(model, propertyService.getString("mail.template.Path") + "Approval_academic"));
		return mailModel;
	}

	public String generateLicense(SaleModel model) {
		StringBuffer buffer = new StringBuffer();

		// Validate String 추가
		buffer.append("NETMINER4LICENSE1.0");
		buffer.append("\n");

		// Product ID 추가
		buffer.append(model.getProductserial());
		buffer.append("\n");
		buffer.append("1000\n");

		// User Name 추가
		buffer.append(model.getFullname());
		buffer.append("\n");

		// Org Name 추가
		buffer.append(model.getOrgname());
		buffer.append("\n");
		
		boolean allPackage=false;
		
		// License Type
		switch (Integer.parseInt(model.getLicenseusage())) {
		case 0:
			buffer.append("Student-Coursework");
			break;
		case 1:
			buffer.append("Student-Research");
			break;
		case 2:
			if(model.getLicenseterm().equals("2")){
				buffer.append("AcademicPerpetual");
			}else{
				buffer.append("Academic");
			}
			break;
		case 3:
			buffer.append("Institute");
			break;
		case 4:
			buffer.append("Enterprise");
			break;
		case 5:
			if(model.getLicenseterm().equals("2")){
				buffer.append("Commercial");
			}else{
				buffer.append("Commercial-term");
			}
			break;

		default:
			buffer.append("Commercial");
			break;
		}
		buffer.append("\n");

		Calendar cal = Calendar.getInstance();
		
		switch (Integer.parseInt(model.getLicenseterm())) {
		case 0:
			cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 6, cal.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
			cal.set(Calendar.MILLISECOND, 0);
			buffer.append(Long.toString(cal.getTimeInMillis()) + "\n");
			break;
		case 1:
			cal.set(cal.get(Calendar.YEAR)+1, cal.get(Calendar.MONTH), cal.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
			cal.set(Calendar.MILLISECOND, 0);
			buffer.append(Long.toString(cal.getTimeInMillis()) + "\n");
			break;
		case 2:
			if(model.getLicenseusage().equals("2")){
				buffer.append("0\n");
			}else{
				cal.set(3000, 1, 1, 0, 0, 0);
				cal.set(Calendar.MILLISECOND, 0);
				buffer.append(Long.toString(cal.getTimeInMillis()) + "\n");
			}
			break;
		case 3:
			cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 3, cal.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
			cal.set(Calendar.MILLISECOND, 0);
			buffer.append(Long.toString(cal.getTimeInMillis()) + "\n");
			break;
		case 4:
			System.out.println("model.getExpiredate().substring(0, 4) "+Integer.parseInt(model.getExpiredate().substring(0, 4)) );
			System.out.println("Calendar.MONTH "+Calendar.MONTH);
			cal.set(Integer.parseInt(model.getExpiredate().substring(0, 4)), Integer.parseInt(model.getExpiredate().substring(4, 6))-1, Integer.parseInt(model.getExpiredate().substring(6, 8)), 0, 0, 0);
			cal.set(Calendar.MILLISECOND, 0);
			buffer.append(Long.toString(cal.getTimeInMillis()) + "\n");
			break;

		default:
			cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
			cal.set(Calendar.MILLISECOND, 0);
			buffer.append(Long.toString(cal.getTimeInMillis()) + "\n");
			break;
		}
		
		switch (Integer.parseInt(model.getLicensesize())) {
		case 0:
			buffer.append(Long.toString(1000));
			break;
		case 1:
			buffer.append(Long.toString(10000));
			break;
		case 2:
			buffer.append(Long.toString(100000));
			break;
		case 3:
			buffer.append(Long.toString(1000000));
			break;
		case 4:
			buffer.append(Long.toString(100));
			break;
		case 5:
			buffer.append(Long.toString(Long.MAX_VALUE));
			break;

		default:
			buffer.append(Long.toString(Long.MAX_VALUE));
			break;
		}
		
		System.out.println("get license getEditionpackages : "+model.getEditionpackages().length);
		
		if(allPackage){
				buffer.append("\n" + Integer.toString(NMLicensePackage.BASIC));
				buffer.append("\n" + Integer.toString(NMLicensePackage.ANALYSIS));
				buffer.append("\n" + Integer.toString(NMLicensePackage.EXPLORATION));
				buffer.append("\n" + Integer.toString(NMLicensePackage.VISUALIZATION));
				buffer.append("\n" + Integer.toString(NMLicensePackage.TOOLS));
				buffer.append("\n" + Integer.toString(NMLicensePackage.SEMANTIC));
				buffer.append("\n" + Integer.toString(NMLicensePackage.STATISTICS));
				buffer.append("\n" + Integer.toString(NMLicensePackage.MINING));
				buffer.append("\n" + Integer.toString(NMLicensePackage.SCRIPT));
				buffer.append("\n" + Integer.toString(NMLicensePackage.USE_PLUG_IN));
		
		}else{
			for(int i=0; i<model.getEditionpackages().length; i++){
				switch (Integer.parseInt(model.getEditionpackages()[i])) {
				case 0: 
					buffer.append("\n" + Integer.toString(NMLicensePackage.BASIC));
					break;
					
				case 1: 
					buffer.append("\n" + Integer.toString(NMLicensePackage.ANALYSIS));
					break;

				case 2:
					buffer.append("\n" + Integer.toString(NMLicensePackage.EXPLORATION));
					break;

				case 3:
					buffer.append("\n" + Integer.toString(NMLicensePackage.VISUALIZATION));
					break;

				case 4:
					buffer.append("\n" + Integer.toString(NMLicensePackage.STATISTICS));
					break;

				case 5:
					buffer.append("\n" + Integer.toString(NMLicensePackage.MINING));
					break;

				case 6:
					buffer.append("\n" + Integer.toString(NMLicensePackage.TOOLS));
					break;

				case 7:
					buffer.append("\n" + Integer.toString(NMLicensePackage.SCRIPT));
					break;
				
				case 8:
					buffer.append("\n" + Integer.toString(NMLicensePackage.USE_PLUG_IN));
					break;
				
				case 9:
					buffer.append("\n" + Integer.toString(NMLicensePackage.SEMANTIC));
					break;
					
				default:
					break;
				}
			}
		}
		
		switch (Integer.parseInt(model.getHardwareType())) {
		case 0:
			
			break;
		case 1:
			buffer.append("\n"
					+ Integer.toString(NMLicensePackage.NO_HARDWARE_KEY));
			break;
		case 2:
			buffer.append("\n"
					+ Integer.toString(NMLicensePackage.ONLINE_HARDWARE_REGISTER));
			break;
		case 3:
			buffer.append("\n"
					+ Integer.toString(NMLicensePackage.NO_HARDWARE_KEY));
			break;

		default:
			break;
		}

		if(model.getHardwareType().equals("3")){
			if(model.getOfflinecode() !=null || !"".equals(model.getOfflinecode())){
				StringBuffer offlineRegisterBuffer = new StringBuffer();
				
				offlineRegisterBuffer.append("{HARDWARE}");
				System.out.println("model.getOfflinecode() : "+model.getOfflinecode());
				String userHardwareKey = model.getOfflinecode();
				System.out.println("userHardwareKey1 : "+userHardwareKey);
				userHardwareKey = userHardwareKey.replace("\n", "");
				userHardwareKey = userHardwareKey.replace("\r", "");
				userHardwareKey = userHardwareKey.replace(" ", "");
				System.out.println("userHardwareKey2 : "+userHardwareKey);
				
				String decodeUserHardware =  NMLicenseCodec.decodeShort(userHardwareKey);
				
				
				String m_userHdd = decodeUserHardware;
				String m_userMac = null;
				
				StringBuffer userHardwareBuffur = new StringBuffer();
				userHardwareBuffur.append(m_userHdd+"\n");
				userHardwareBuffur.append(m_userMac+"\n");
				userHardwareBuffur.append("0"+"\n");
				userHardwareBuffur.append("0");
				
				offlineRegisterBuffer.append(NMLicenseCodec.encode(userHardwareBuffur.toString()));
				
				offlineRegisterBuffer.append("${LICENSE}");
				offlineRegisterBuffer.append(NMLicenseCodec.encode(buffer.toString()));
				
				return NMLicenseCodec.encode(offlineRegisterBuffer.toString());	
			}
			return null;
		}else{
			return NMLicenseCodec.encode(buffer.toString());
		}
	}

	@Override
	public void setTutorialMail(DownloadModel model) throws Exception {
		if(!isTutorialRegistered(model)) {
			saleDao.registerTutorial(model);
		}
	}

	private boolean isTutorialRegistered(DownloadModel model) {
		return saleDao.isTutorialRegistered(model);
	}

	@Override
	public void saveSdcRecord(DownloadModel downloadModel) throws Exception {
		saleDao.saveSdcRecord(downloadModel);
	}
	
	

	@Override
	public List<SaleModel> readFreeList(SaleModel model) throws Exception {
		List<SaleModel> list = null;
		int totalCount = saleDao.readFreeTotal(model);
		
		if(totalCount > 0) {
			model.setTotalCount(totalCount);
			list = saleDao.readFreeList(model);
		}

		return list;
	}
	
	@Override
	public SaleModel readFree(SaleModel model) throws Exception {
		SaleModel rModel = saleDao.readFree(model);
		
		if(rModel == null) {
			rModel = new SaleModel();
		} else {
			rModel = (SaleModel) ModelConverterUtil.convert(model, rModel);
		}
		rModel.setNationList(nationService.readList(model));
		
		return rModel;
	}

	@Override
	public void updateFree(SaleModel model) throws Exception {
		saleDao.updateFree(model);
	}

	@Override
	public void deleteFree(SaleModel model) throws Exception {
		saleDao.deleteFree(model);
	}

}

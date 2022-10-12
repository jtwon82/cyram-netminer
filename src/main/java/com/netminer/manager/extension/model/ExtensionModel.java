package com.netminer.manager.extension.model;

import java.text.DecimalFormat;
import java.util.Calendar;

import com.cyframe.model.CyframeModel;
import com.netminer.common.util.DateUtil;

import lombok.Getter;
import lombok.Setter;

public class ExtensionModel extends CyframeModel {
	private static final long serialVersionUID = 1L;

	public static final String SOCIAL_NETWORK_COLLECTOR = "1";
	public static final String BIBLIO_DATA_COLLECTOR = "2";
	
	@Getter @Setter private String labelEn;
	@Getter @Setter private String labelKr;
	@Getter @Setter private String descriptionEn;
	@Getter @Setter private String descriptionKr;
	@Getter @Setter private String priceUsd;
	@Getter @Setter private String priceKrw;
	@Getter @Setter private String extensionId;
	@Setter private String expireDate;
	
	public String getLabel() {
		return isKor() ? labelKr : labelEn;
	}
	
	public String getDescription() {
		return isKor() ? descriptionKr : descriptionEn;
	}
	
	public String getPrice() {
		return isKor() ? priceKrw : priceUsd;
	}
	
	public String getPriceFormatted() {
		DecimalFormat formatter;
		if(isKor()) {
			formatter = new DecimalFormat("#,###");
		} else {
			formatter = new DecimalFormat("#,###.00");
		}
		return formatter.format(Long.parseLong(getPrice()));
	}
	
	public String getExpireDate() {
		if(expireDate == null) {
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.YEAR, 1);
			return DateUtil.dailyformat(cal.getTime()); 
		}
		return expireDate;
	}
}

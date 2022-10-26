package com.netminer.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class DateUtil {

	private static final SimpleDateFormat FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	private static final SimpleDateFormat STRING_FORMAT = new SimpleDateFormat("yyyyMMddHHmmss");

	private static final SimpleDateFormat STRING_FORMAT_SSS = new SimpleDateFormat("yyyyMMddhhmmssSSS");

	private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

	private static final SimpleDateFormat DAY_FORMAT = new SimpleDateFormat("yyyyMMdd");

	private static final SimpleDateFormat US_FORMAT = new SimpleDateFormat("MMM. dd, yyyy",  Locale.US);

	public static String dateFormat() {
		return dateFormat(new Date());
	}

	public static String format() {
		return format(new Date());
	}

	public static String stringFormat() {
		return STRING_FORMAT.format(new Date());
	}

	public static String stringFormatSSS() {
		return STRING_FORMAT_SSS.format(new Date());
	}

	public static String format(Date date) {
		return FORMAT.format(date);
	}

	public static String dailyformat() {
		return DAY_FORMAT.format(new Date());
	}

	public static String dailyformat(Date date) {
		return DAY_FORMAT.format(date);
	}

	public static String dateFormat(Date date) {
		return DATE_FORMAT.format(date);
	}
	
	public static String usFormat(Date date) {
		return US_FORMAT.format(date);
	}
	
	public static String format(String date) {
		return FORMAT.format(date);
	}
	
	public static String dailyformat(String date) {
		return DAY_FORMAT.format(date);
	}
	
	public static String dateFormat(String date) {
		return DATE_FORMAT.format(date);
	}
	
	public static String usFormat(String date) throws Exception {
		return US_FORMAT.format(DAY_FORMAT.parse(date));
	}

	public static String getDate(String strtype, Date date){
		java.text.DateFormat df = new java.text.SimpleDateFormat(strtype);	///"yyyy-MM-dd"
		return df.format(date).toString();
	}
}


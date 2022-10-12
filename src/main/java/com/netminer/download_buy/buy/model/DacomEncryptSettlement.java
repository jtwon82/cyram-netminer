package com.netminer.download_buy.buy.model;

import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;

import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Hex;

import pg.tp.crypt.DesEncrypter;

public class DacomEncryptSettlement {
	private String mertKey;
	private String mid;
	private String oid;
	private String oidOrg;
	private String buyer;
	private String productinfo;
	private String currency;
	private String amount;
	private String amountOrg;
	private String home_url;
	private String ret_url;
	private String fail_url;
	private String note_url;
	private String hashdata;
	private String timestamp;
	private DesEncrypter encrypter;

	public DacomEncryptSettlement(String MID, String MERTKEY) throws InvalidKeyException, NoSuchAlgorithmException, InvalidKeySpecException, DecoderException
	{
		this.setCurrency("KRW");
		this.mertKey = MERTKEY;
		this.mid = MID;
		this.timestamp = String.valueOf(System.currentTimeMillis());
//		this.timestamp = "1234567890";
		
		try {
			byte[] key = Hex.decodeHex(MERTKEY.toCharArray());
			DESKeySpec spec = new DESKeySpec(key);
			SecretKeyFactory factory = SecretKeyFactory.getInstance("DES");
			SecretKey secret = factory.generateSecret(spec);
			encrypter = new DesEncrypter(secret);
		} 
		catch (InvalidKeyException e) { throw e; } 
		catch (NoSuchAlgorithmException e) { throw e; } 
		catch (InvalidKeySpecException e) { throw e; }
	}
	
	public String getMertKey()
	{
		return mertKey;
	}
	public String getMid()
	{
		return mid;
	}
	public void setMid(String mid)
	{
		this.mid = mid;
	}
	public String getOid()
	{
		return oid;
	}
	public void setOid(String oid)
	{
		//수정
		this.oidOrg = oid;
		this.oid = oidOrg;
	}
	public String getBuyer()
	{
		return buyer;
	}
	public void setBuyer(String buyer)
	{
		this.buyer = buyer;
	}
	public String getProductinfo()
	{
		return productinfo;
	}
	public void setProductinfo(String productinfo)
	{
		this.productinfo = productinfo;
	}
	public String getCurrency()
	{
		return currency;
	}
	public void setCurrency(String currency)
	{
		this.currency = currency;
	}
	public String getAmount()
	{
		return amount;
	}
	public void setAmount(String amount)
	{
		this.amountOrg = amount;
		this.amount = amountOrg;
	}
	public String getHome_url()
	{
		return home_url;
	}
	public void setHome_url(String home_url)
	{
		this.home_url = home_url;
	}
	public String getRet_url()
	{
		return ret_url;
	}
	public void setRet_url(String ret_url)
	{
		//수정
		this.ret_url = get55OverLengthData(encrypter.encrypt(ret_url));
	}
	public void setNote_url(String note_url)
	{
//		this.note_url = note_url;
		//수정
		this.note_url = get55OverLengthData(encrypter.encrypt(note_url));
	}
	public String getFail_url()
	{
		return fail_url;
	}
	public void setFail_url(String fail_url)
	{
		//수정
		this.fail_url = get55OverLengthData(encrypter.encrypt(fail_url));
	}
	public String getNote_url()
	{
		return note_url;
	}

	//추가
	public void setHashdata() throws NoSuchAlgorithmException {
		this.hashdata = this._setHashdata();
	}
	
	public String getTimestamp() {
		return timestamp;
	}
	
	/**************************************************************************
	 * Dacom에서 제공한 메소드.
	 * 
	 * 필드 값에 해당하는 해쉬 데이터를 반환한다.
	 * 사용되는 필드는 mid, oid, amount, mertKey이다.
	 * 
	 * @return
	 * @throws NoSuchAlgorithmException
	 **************************************************************************/
	private String _setHashdata() throws NoSuchAlgorithmException
	{
		//=====================================================================
		// Generating Hashdata
		//---------------------------------------------------------------------
		StringBuffer sb = new StringBuffer();

		sb.append(mid);
		sb.append(oidOrg);
		sb.append(amountOrg);
		sb.append(timestamp);
		sb.append(mertKey);
		byte[] bNoti = sb.toString().getBytes();

		MessageDigest md = null;

		try
		{
			md = MessageDigest.getInstance("MD5");
		} 
		catch (java.security.NoSuchAlgorithmException e) { throw e; }

		byte[] digest = md.digest(bNoti);

		StringBuffer encryptedHashdataBuffer = new StringBuffer();

		for (int i = 0; i < digest.length; i++)
		{
			int c = digest[i] & 0xff;
			if (c <= 15)
			{
				encryptedHashdataBuffer.append("0");
			}
			encryptedHashdataBuffer.append(Integer.toHexString(c));
		}

		return encryptedHashdataBuffer.toString();
	}
	
	/**************************************************************************
	 * Dacom에서 제공한 메소드.
	 * @param desData
	 * @return
	 **************************************************************************/
	private static String get55OverLengthData(String desData)
	{
		String syncData = "";

		int offset_start = 0;
		int offset_end = desData.indexOf("\r\n");

		if (offset_end != -1)
		{
			while (offset_end != -1)
			{
				syncData += desData.substring(offset_start, offset_end);
				offset_start = offset_end = offset_end + 2;
				offset_end = desData.indexOf("\r\n", offset_end);
			}
		
			if (desData.lastIndexOf("\r\n") == desData.length())
				syncData += desData.substring(offset_start,
						desData.length() - 1);
			else
				syncData += desData.substring(offset_start, desData.length());
		} 
		else
		{
			syncData = desData;
		}
		
		return syncData;
	}
	
	public String getHashdata() {
		return hashdata;
	}

	public void setHashdata(String hashdata) {
		this.hashdata = hashdata;
	}

}

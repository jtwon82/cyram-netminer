package com.netminer.manager.sale.service;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

/******************************************************************************
 * �ݸ��̳� ���� �˰��� ���� ���ڿ��� ��ȣȭ/��ȣȭ �Ѵ�.
 * 
 * @author Torius
 ******************************************************************************/
public class NMLicenseCodec
{
	//=========================================================================
	// PUBLIC �޼ҵ�
	//-------------------------------------------------------------------------

	/**************************************************************************
	 * ���ڿ��� ��ȣȭ�Ѵ�.
	 **************************************************************************/
	public static String encode(String string)
	{
		try
		{
			// ���̼��� Ű�� ����� ����Ű�� �����Ѵ�.
			SecretKey variableKey = genVariableKey();

			// ���ο��� ����� ����Ű�� �����Ѵ�.
			SecretKey fixedKey = genFixedKey(FIXED_KEY);

			// 1-PASS: ���ڿ��� DES �˰������� ��ȣȭ�Ѵ�. (���� Ű)
			byte[] _1pass = desEncrypt(string.getBytes(), variableKey);

			// 2-PASS: ��ȣȭ�� ������ �޺κп� Ű �迭�� �����Ѵ�.
			byte[] _2pass = containKey(_1pass, variableKey);

			// 3-PASS: ��ȣȭ�� �����͸� DES �˰������� �ٽ� ��ȣȭ�Ѵ�. (���� Ű)
			byte[] _3pass = desEncrypt(_2pass, fixedKey);

			// 4-PASS: ����Ű�� XOR �����Ѵ�.
			byte[] _4pass = xor(_3pass, FIXED_KEY);

			// ����Ʈ �迭�� ���ڿ��� ��ȯ�Ѵ�.
			return toHex(_4pass);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}

		return null;
	}

	/**************************************************************************
	 * ���ڿ��� ��ȣȭ�Ѵ�.
	 **************************************************************************/
	public static String decode(String string)
	{
		try
		{
			// ���ο��� ����� ����Ű�� �����Ѵ�.
			SecretKey fixedKey = genFixedKey(FIXED_KEY);

			// HEX ���ڿ��� ����Ʈ �迭�� ��ȯ�Ѵ�.
			byte[] _1data = fromHex(string);

			// ����Ʈ �迭�� ����Ű�� XOR �����Ѵ�.
			byte[] _2data = xor(_1data, FIXED_KEY);

			// XOR ����� �����͸� DES �˰������� ��ȣȭ�Ѵ�. (���� Ű)
			byte[] _3data = desDecrypt(_2data, fixedKey);

			// ��ȣȭ�� �����Ϳ��� Ű�� �����Ѵ�.
			byte[] key = extractKey(_3data);

			// Ű�� �����ϰ� �����͸� ��´�.
			byte[] _4data = excludeKey(_3data);

			// ���̼��� Ű�� ����Ǿ��ִ� ����Ű�� �����Ѵ�.
			SecretKey variableKey = genFixedKey(key);

			// �����͸� ����Ű�� ��ȣȭ�Ѵ�.
			byte[] _5data = desDecrypt(_4data, variableKey);

			// ��ȣȭ�� �����͸� ���ڿ��� ��ȯ�Ͽ� ��ȯ�Ѵ�.
			return new String(_5data);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}

		return null;
	}

	/**************************************************************************
	 * 짧게 암호화 한다. (Copy From encode)
	 **************************************************************************/
	private static String encodeShort(String string)
	{
		try
		{
			// byte[] 를 얻어온다.
			byte[] script = string.getBytes();

			byte[] crypt = new byte[script.length];
			
			// byte 에 CRYPT ROUTINE을 더한다.
			for( int i=0; i<script.length; i++ )
			{
				// crypt 코드를 생성한다.
				crypt[i] = (byte)(script[i] + SHORT_CRYPT_ROUTINE[i%SHORT_CRYPT_ROUTINE.length]);
			}
			
			// 순서를 뒤섞는다.
			for( int i=0; i<crypt.length/2; i++ )
			{
				byte temp = crypt[crypt.length/2+i];
				crypt[crypt.length/2+i] = crypt[i];
				crypt[i] = temp;
			}
			
			// 암호화 된 byte를 문자열로 반환한다.
			return new String(crypt);
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}

		return null;
	}
	
	public static String decodeShort(String string)
	{
		try
		{
			// 
			byte[] crypt = string.getBytes();
			byte[] script = new byte[crypt.length];
			
			// 순서를 바로잡는다.
			for( int i=0; i<crypt.length/2; i++ )
			{
				byte temp = crypt[crypt.length/2+i];
				crypt[crypt.length/2+i] = crypt[i];
				crypt[i] = temp;
			}
			
			// 더해졌던 Crypt Rotine 을 제거한다.
			for( int i=0; i<crypt.length; i++ )
			{
				script[i] = (byte)(crypt[i] - SHORT_CRYPT_ROUTINE[i%SHORT_CRYPT_ROUTINE.length]);
			}
			
			// 문자열로 반환한다.
			return new String(script);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}

		return null;
	}
	
	public static final String LICENSE_CHECK_POST_FIX = "NM3";
	private final static byte[] SHORT_CRYPT_ROUTINE =
	{
		1, 0, 0, 2, 1, 3, 2, 1, 0, 2, 1, 0, 3, 1, 0, 0, 1, 1, 2, 0, 1, 0, 2, 1, 0, 0, 1, 1, 1, 2, 2, 3, 3, 1, 0, 0, 1, 0, 1, 2, 3, 2, 1, 0,
	};
	
	// 짧은 암호화 루틴
	private final static byte[] SHORT_CRYPT_ROUTINE2 =
	{
		1, 0, 0, 2, 1, 3, 2, 1, 0, 2, 1, 0, 3, 1, 0, 0, 1, 1, 2, 0, 1, 0, 2, 1, 0, 0, 1, 1, 1, 2, 2, 3, 3, 1, 0, 0, 1, 0, 1, 2, 3, 2, 1, 0,
	};
	
	//=========================================================================
	// PRIVATE �޼ҵ�
	//-------------------------------------------------------------------------

	/**************************************************************************
	 * ���� Ű�� �����Ѵ�.
	 **************************************************************************/
	private static SecretKey genFixedKey(byte[] key)
	{
		// Ű �迭�� �����Ͽ� DES Ű ��ü�� �����Ѵ�.
		return new SecretKeySpec(key, "DES");
	}

	/**************************************************************************
	 * ���� Ű�� �����Ѵ�.
	 **************************************************************************/
	private static SecretKey genVariableKey() throws Exception
	{
		// DES �˰��� Ű ������ ��ü�� �����Ѵ�.
		KeyGenerator keyGen = KeyGenerator.getInstance("DES");

		// Ű ������ ��ü�� �ʱ�ȭ�Ѵ�. (DES �˰��򿡼� ����� ũ�� 56�� Ű)
		keyGen.init(56);

		// Ű�� �����Ͽ� ��ȯ�Ѵ�.
		return keyGen.generateKey();
	}

	/**************************************************************************
	 * �����͸� Ű�� ��ȣȭ�Ѵ�.
	 **************************************************************************/
	private static byte[] desEncrypt(byte[] data, SecretKey key) throws Exception
	{
		// DES �˰��� ��ȣ�� ��ü�� �����Ѵ�. 
		Cipher cipher = Cipher.getInstance("DES/ECB/PKCS5Padding");

		// ��ȣ�� ��ü�� �ʱ�ȭ�Ѵ�.
		cipher.init(Cipher.ENCRYPT_MODE, key);

		// �����͸� ��ȣȭ�Ѵ�.
		return cipher.doFinal(data);
	}

	/**************************************************************************
	 * �����͸� Ű�� ��ȣȭ�Ѵ�.
	 **************************************************************************/
	private static byte[] desDecrypt(byte[] data, SecretKey key) throws Exception
	{
		// DES �˰��� ��ȣ�� ��ü�� �����Ѵ�. 
		Cipher cipher = Cipher.getInstance("DES/ECB/PKCS5Padding");

		// ��ȣ�� ��ü�� �ʱ�ȭ�Ѵ�.
		cipher.init(Cipher.DECRYPT_MODE, key);

		// �����͸� ��ȣȭ�Ѵ�.
		return cipher.doFinal(data);
	}

	/**************************************************************************
	 * ����Ʈ �迭�� Ű ���� ���Խ�Ų��.
	 **************************************************************************/
	private static byte[] containKey(byte[] data, SecretKey key)
	{
		// Ű�� ������ �� ���� ��ŭ�� �迭�� �����Ѵ�.
		byte[] result = new byte[data.length + 8];

		// �����͸� �����Ѵ�.
		System.arraycopy(data, 0, result, 0, data.length);

		// Ű�� ������ �����Ѵ�.
		System.arraycopy(key.getEncoded(), 0, result, data.length, 8);

		// Ű�� ������ �����͸� ��ȯ�Ѵ�.
		return result;
	}

	/**************************************************************************
	 * ����Ʈ �迭���� Ű ���� �����Ѵ�.
	 **************************************************************************/
	private static byte[] extractKey(byte[] data)
	{
		// Ű �迭�� �����Ѵ�.
		byte[] result = new byte[8];

		// Ű�� �����Ѵ�.
		System.arraycopy(data, data.length - 8, result, 0, 8);

		// Ű�� ��ȯ�Ѵ�.
		return result;
	}

	/**************************************************************************
	 * ����Ʈ �迭���� Ű�� �����Ѵ�.
	 **************************************************************************/
	private static byte[] excludeKey(byte[] data)
	{
		// Ű�� �����ϸ� ����Ʈ �迭�� �����Ѵ�.
		byte[] result = new byte[data.length - 8];

		// �����͸� �����Ѵ�.
		System.arraycopy(data, 0, result, 0, data.length - 8);

		// �����͸� ��ȯ�Ѵ�.
		return result;
	}

	/**************************************************************************
	 * ����Ʈ �迭�� XOR �����Ѵ�.
	 **************************************************************************/
	private static byte[] xor(byte[] data, byte[] token)
	{
		// XOR ����� ����� ������ �迭�� �����Ѵ�.
		byte[] result = new byte[data.length];

		// �迭�� ���̸�ŭ ��ȯ�ϸ� ó���Ѵ�.
		for (int index = 0; index < result.length; index++)
		{
			// �����Ϳ� ��ū�� XOR �Ͽ� �迭�� �����Ѵ�. 
			result[index] = (byte) (data[index] ^ token[index % token.length]);
		}

		// XOR ����� �迭�� ��ȯ�Ѵ�.
		return result;
	}

	/**************************************************************************
	 * ����Ʈ �迭�� HEX �ڵ�� ��ȯ�Ѵ�.
	 **************************************************************************/
	private static String toHex(byte[] data)
	{
		// ���ڿ� ���۸� �����Ѵ�.
		StringBuffer buffer = new StringBuffer();

		// ������ �迭�� ���̸�ŭ ��ȯ�ϸ� ó���Ѵ�.
		for (int index = 0; index < data.length; index++)
		{
			// ���ۿ� HEX ���ڸ� �����Ѵ�.
			buffer.append(HEX_ARRAY[0x0f & (data[index] >> 4)]);
			buffer.append(HEX_ARRAY[0x0f & (data[index])]);
		}

		// HEX�� ��ȯ�� ���ڿ��� ��ȯ�Ѵ�.
		return buffer.toString();
	}

	/**************************************************************************
	 * HEX �ڵ带 ����Ʈ �迭�� ��ȯ�Ѵ�.
	 **************************************************************************/
	private static byte[] fromHex(String data)
	{
		// ����Ʈ �迭�� �����Ѵ�.
		byte[] result = new byte[data.length() / 2];

		// �迭�� ���̸�ŭ ��ȯ�ϸ� ó���Ѵ�.
		for (int index = 0; index < result.length; index++)
		{
			byte a = (byte) ((byte) 0xf0 & ((getByte(data.charAt(2 * index))) << 4));

			// HEX �ڵ带 �����Ͽ� ����Ʈ �迭�� �����.
			result[index] = (byte) (a | getByte(data.charAt(2 * index + 1)));
		}

		// ����Ʈ �迭�� ��ȯ�Ѵ�.
		return result;
	}

	/***************************************************************************
	 * HEX ������ �Ϻθ� ������ ����Ʈ �ڵ�� ��ȯ�Ѵ�.
	 **************************************************************************/
	private static byte getByte(char c)
	{
		if ((c >= '0') && (c <= '9'))
			return (byte) (c - '0');

		else if ((c >= 'A') && (c <= 'F'))
			return (byte) (10 + (byte) (c - 'A'));

		else if ((c >= 'a') && (c <= 'f'))
			return (byte) (10 + (byte) (c - 'a'));

		throw new RuntimeException("Could not decode hex character '" + c + "'");
	}

	//=========================================================================
	// ���
	//-------------------------------------------------------------------------

	// ���� Ű
	private final static byte[] FIXED_KEY =
	{
		-65, -110, -5, -70, -22, 118, -111, -74
	};

	// HEX ���� �迭
	private final static char[] HEX_ARRAY =
	{
		'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'
	};

	//=========================================================================
	// �׽�Ʈ ���α׷�
	//-------------------------------------------------------------------------

	public static void main(String[] argv) throws Exception
	{
		// ���� ���ڿ�
		String string = "ABCDEFGHIJKLMNOPQRST | 12345\r\n\r\n\t67890 -=\\ !@#$% �蹫�� ������\t�ۿ�� ��ȿ�� �����������ף�����\n��������";

		// ���� ���ڿ��� ����Ѵ�.
		System.out.println(string);
		System.out.println("------------------------------------------------------------------------");

		// ���� ���ڿ��� ��ȣȭ�Ѵ�.
		String encodedString = NMLicenseCodec.encode(string);

		// ��ȣȭ�� ���ڿ��� ����Ѵ�.
		System.out.println(encodedString);
		System.out.println("------------------------------------------------------------------------");

		// ��ȣȭ�� ���ڿ��� ��ȣȭ�Ѵ�.
		String decodedString = NMLicenseCodec.decode(encodedString);

		// ��ȣȭ�� ���ڿ��� ����Ѵ�.
		System.out.println(decodedString);
		System.out.println("------------------------------------------------------------------------");

		// ���� ���ڿ��� ��ȣȭ�� ���ڿ��� ��ġ�ϴ��� Ȯ���Ѵ�.
		System.out.println("Match : " + string.equals(decodedString));
	}
}
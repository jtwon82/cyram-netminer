package com.netminer.common.util;


import java.lang.reflect.Field;

public class ModelConverterUtil {

	/**
	 * Class로 Object를 만들어 변수값들을 set
	 * @param inObject
	 * @param outClass
	 * @return
	 * @throws Exception
	 */
	public static Object convert(Object inObject, Class<?> outClass) throws Exception {
		return convert(inObject, outClass.newInstance());
	}

	/**
	 * Object에 변수값들을 set
	 * @param inObject
	 * @param outObject
	 * @return
	 * @throws Exception
	 */
	public static Object convert(Object inObject, Object outObject) throws Exception {
		Field[] inFields = inObject.getClass().getDeclaredFields();
		Field[] outFields = outObject.getClass().getDeclaredFields();
		Object value = null;
		
		for(Field inField : inFields) {
			
			if("serialVersionUID".equalsIgnoreCase(inField.getName())) {
				continue;
			}
			
			for(Field outField : outFields) {
				
				if(inField.getName().equals(outField.getName())) {
					outField.setAccessible(true);
					value = outField.get(outObject);
					
					//값이 없는 경우에만
					if(isNull(value)) {
						setData(inField, outField, inObject, outObject);
					}
					break;
				}
			}			
		}

		//abstract 모델 convert
		Field[] inSuperFields = inObject.getClass().getSuperclass().getDeclaredFields();
		Field[] outSuperFields = outObject.getClass().getSuperclass().getDeclaredFields();
		
		for(Field inField : inSuperFields) {
			
			for(Field outField : outSuperFields) {
				
				if(inField.getName().equals(outField.getName())) {
					outField.setAccessible(true);
					value = outField.get(outObject);
					
					//값이 없는 경우에만
					if(isNull(value)) {
						setData(inField, outField, inObject, outObject);
					}
					break;
				}
			}			
		}

		return outObject;
	}
	
	/**
	 * <PRE>
	 * @Method : isNull
	 * @Comment : 타입별 null을 체크한다.
	 *  
	 * </PRE>
	 * @param value
	 * @return
	 * @throws Exception
	 */
	private static boolean isNull(Object value) throws Exception {
		if(value instanceof Integer) {
			if(((Integer)value) == 0) {
				return true;
			}
		} else if(value instanceof Double) {
			if(((Double)value) == 0.0) {
				return true;
			}
		} else if(value instanceof Float) {
			if(((Float)value) == 0.0) {
				return true;
			}
		} else if(value instanceof Long) {
			if(((Long)value) == 0) {
				return true;
			}
		} else if(value instanceof Boolean) {
			if((Boolean)value == false) {
				return true;
			}
		} else {
			if(value == null || "".equals(value)) {
				return true;
			}
		}
		
		return false;
	}

	/**
	 * <PRE>
	 * @Method : setData
	 * @Comment : 해당 필드의 데이터를 세팅한다.
	 *  
	 * </PRE>
	 * @param inField
	 * @param outField
	 * @param inObject
	 * @param outObject
	 * @throws Exception
	 */
	private static void setData(Field inField, Field outField, Object inObject, Object outObject) throws Exception {
		try {
			inField.setAccessible(true);
			outField.setAccessible(true);
			
			Class<?> cls = outField.getType();
			
			Object value = inField.get(inObject);
			
			if(value != null) {
				if(cls.equals(value.getClass())) {
					outField.set(outObject, outField.getType().cast(value));
				} else {
					outField.set(outObject, value);
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}

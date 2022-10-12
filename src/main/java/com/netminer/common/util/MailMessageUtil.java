package com.netminer.common.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Field;
import java.util.List;

public class MailMessageUtil {

	/**
	 * 해당 제목을 찾아 반환한다.
	 * @param object
	 * @param fileFullName
	 * @param key
	 * @return
	 */
	public static String generateSubject(Object object, String fileFullName, String key) {
		String line = null;
		InputStreamReader fileReader = null;
		BufferedReader reader = null;

		File file = null;
		String subject = "";
		
		try {
			boolean isKor = isKor(object);
			
			file = new File(fileFullName);
			
			if(file.exists()) {
				if(isKor) {
					key = key + "_kor";
				}
			
				fileReader = new InputStreamReader(new FileInputStream(file), "UTF-8");
				reader = new BufferedReader(fileReader);
				
				while ((line = reader.readLine()) != null) {
					subject = getSubject(line, key);
					
					if(subject != null) {
						break;
					}
				}
			}
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(fileReader != null) {
				try {
					fileReader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}				
			}
			if(reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}				
			}
		}
		
		return subject;
	}

	/**
	 * 해당 내용을 찾아 필요한 부분의 값을 매핑한 후 반환한다.
	 * @param object
	 * @param fileFullName
	 * @return
	 */
	public static String generateContents(Object object, String fileFullName) {
		StringBuffer sb = new StringBuffer();
		String line = null;
		BufferedReader reader = null;
		
		File file = null;
		
		try {
			boolean isKor = isKor(object);
			
			if(isKor) {
				file = new File(fileFullName + ".html");
				
				if(!file.exists()) {
					file = new File(fileFullName + ".txt");
				}
			} else {
				file = new File(fileFullName + ".txt");
			}
			
			if(file.exists()) {
				reader = new BufferedReader(new InputStreamReader(new FileInputStream(file),"utf-8"));
				
				while ((line = reader.readLine()) != null) {
					sb.append(setValue(object, line) + "\r\n");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}				
			}
		}
		
		return sb.toString();
	}
	
	/**
	 * 모델에 설정되어 있는 한영 구분을 반환한다.
	 * @param object
	 * @return
	 * @throws Exception
	 */
	private static boolean isKor(Object object) throws Exception {
		Field[] fields = object.getClass().getSuperclass().getDeclaredFields();

		for(Field field : fields) {
			if("kor".equals(field.getName())) {
				field.setAccessible(true);
				
				return (Boolean) field.get(object);
			}
		}

		return false;
	}

	/**
	 * 제목의 필요 부분만을 반환한다.
	 * @param line
	 * @param key
	 * @return
	 * @throws Exception
	 */
	private static String getSubject(String line, String key) throws Exception {
		if(line.contains(key)) {
			//= 까지 포함해서 + 1
			return line.substring(key.length() + 1, line.length());
		}
		return null;
	}

	/**
	 * 내용 중 필요한 부분을 모델의 값으로 매핑한다.
	 * @param object
	 * @param line
	 * @return
	 * @throws Exception
	 */
	private static String setValue(Object object, String line) throws Exception {
		String name = object.getClass().getSimpleName();
		Field[] fields = object.getClass().getDeclaredFields();
		Object value = null;
		String key = "";
		String listStart = "LIST{";
		String listEnd = "}LIST";
		
		for(Field field : fields) {
			key = "[" + name + "." + field.getName() + "]";
			
			if(line.contains(listStart) && line.contains(listEnd)) {
				line = setList(object, line);
				
			} else if(line.contains(key)) {
				field.setAccessible(true);
				value = field.get(object);
				
				if(value != null) {
					line =  line.replace(key, String.valueOf(value));
				}
			}
		}

		return line;
	}

	/**
	 * LIST 로 매핑해야 할 부분을 처리한다.
	 * @param object
	 * @param line
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	private static String setList(Object object, String line) throws Exception {
		String name = object.getClass().getSimpleName();
		Field[] fields = object.getClass().getDeclaredFields();
		String key = "";
		Object value = null;
		Object objectList = null;
		String objectName = "";
		Field[] objectFields = null;
		String objectKey = "";
		String listStart = "LIST{";
//		String listEnd = "}LIST";
		List<Object> list = null;
		String br = "\r\n";
		StringBuffer sb = new StringBuffer();
		String replaceStr = "";
		String lineFront = "";
		
		boolean isKor = isKor(object);
		
		if(isKor) {
			br = "<br/>";
		}
		
		lineFront = line.substring(0, line.indexOf(listStart));
		
		for(Field field : fields) {
			key = "[" + name + "." + field.getName();
			
			if(line.contains(key)) {
				field.setAccessible(true);
				objectList = field.get(object);
				
				if(objectList != null) {
					list = (List<Object>) objectList;
					
					for(Object o : list) {
						objectName = o.getClass().getSimpleName();
						objectFields = o.getClass().getDeclaredFields();
						
						for(Field f : objectFields) {
							objectKey = key + "." + objectName + "." + f.getName() + "]";

							if(line.contains(objectKey)) {
								f.setAccessible(true);
								value = f.get(o);
								
								if(value == null) {
									value = "";
								}
								
								sb.append(lineFront + value + br);
								
								break;
							}
						}
					}
				}
			}
		}

		replaceStr = sb.toString();
		
		if(replaceStr == null || "".equals(replaceStr)) {
			replaceStr = "";
		}
		line = replaceStr;

		return line;
	}

}

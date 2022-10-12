package com.netminer.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import com.cyframe.model.ConstantModel;
import com.cyframe.model.MultipartModel;


public class FileUtil {

	/**
	 * 파일 생성
	 * @param data
	 * @param path
	 * @param fileName
	 * @throws Exception
	 */
	public static void createFile(String data, String path, String fileName) throws Exception {
		createFile(data.getBytes(), path, fileName);
	}
	
	/**
	 * 파일 생성
	 * @param data
	 * @param path
	 * @param fileName
	 * @throws Exception
	 */
	public static void createFile(byte[] data, String path, String fileName) throws Exception {
		FileOutputStream fos = null;
		
		if(!path.endsWith(File.separator)) {
			path = path + File.separator;
		}

		File file = new File(path);
		
		if(!file.exists()) {
			file.mkdir();
		}

		try {
			fos = new FileOutputStream(path + fileName);
			
			fos.write(data);
			fos.flush();
			
		} catch(Exception e) {
			throw e;
		} finally {
			if(fos != null) {
				fos.close();
			}
		}
	}

	/**
	 * 디렉토리 체크
	 * @param localFilePath
	 * @throws Exception
	 */
	public static void checkDirectory(String localFilePath) throws Exception {
		try {
			File cFile = new File(localFilePath);

			if (!cFile.isDirectory()) {
				if (!cFile.mkdir()) {
					throw new IOException(ConstantModel.CYRAM_ERROR + "Directory creation Failed ");
				}
			}
		} catch (Exception e) {
			throw new Exception(ConstantModel.CYRAM_ERROR + "파일 생성 중 에러가 발생했습니다.\n에러가 지속되는 경우 관리자에게 문의하시기 바랍니다.");
		} finally {
		}
	}
	
	/**
	 * MultipartModel로 파일 생성
	 * @param multipartModel
	 * @param localFilePath
	 * @throws Exception
	 */
	public static void createFile(MultipartModel multipartModel, String localFilePath) throws Exception {
		InputStream inputStream = null;
		OutputStream outputStream = null;
		int bytesRead = 0;
		byte[] buffer = null;
		int bufferSize = 2048;
		
		try {
			inputStream = multipartModel.getInputStream();

			outputStream = new FileOutputStream(localFilePath + multipartModel.getFile_name());

			bytesRead = 0;
			buffer = new byte[bufferSize];

			while ((bytesRead = inputStream.read(buffer, 0, bufferSize)) != -1) {
				outputStream.write(buffer, 0, bytesRead);
			}
		} catch (Exception e) {
			throw new Exception(ConstantModel.CYRAM_ERROR + "파일 생성 중 에러가 발생했습니다.\n에러가 지속되는 경우 관리자에게 문의하시기 바랍니다.");
		} finally {
			if (outputStream != null) {
				try {
					outputStream.close();
				} catch (Exception ex) {
				}
			}
			if (inputStream != null) {
				try {
					inputStream.close();
				} catch (Exception ex) {
				}
			}
			inputStream = null;
			outputStream = null;
			bytesRead = 0;
			buffer = null;
		}
	}
	
}

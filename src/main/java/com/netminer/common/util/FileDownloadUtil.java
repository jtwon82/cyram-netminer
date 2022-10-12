package com.netminer.common.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;


public class FileDownloadUtil {

	/**
	 * 첨부파일 다운로드.
	 * 
	 * @param attachFileModel
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public static void download(HttpServletRequest request, HttpServletResponse response, String localFile, String orgFileName) throws Exception {
		File uFile = new File(localFile);
		int fSize = (int) uFile.length();

		if(uFile.isFile() && fSize > 0) {
			String mimetype = "application/x-msdownload";

			response.setContentType(mimetype);
			setDisposition(orgFileName, request, response);
			response.setContentLength(fSize);

			BufferedInputStream in = null;
			BufferedOutputStream out = null;

			try {
				in = new BufferedInputStream(new FileInputStream(uFile));
				out = new BufferedOutputStream(response.getOutputStream());

				FileCopyUtils.copy(in, out);
				out.flush();
			} catch (Exception ex) {
			} finally {
				if (in != null) {
					try {
						in.close();
					} catch (Exception ex) {
					}
				}
				if (out != null) {
					try {
						out.close();
					} catch (Exception ex) {
					}
				}
			}

		} else {
			PrintWriter printwriter = response.getWriter();
			
			response.setContentType("text/html;charset=UTF-8");
			
			printwriter.println("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">");
			printwriter.println("<html xmlns=\"http://www.w3.org/1999/xhtml\">");
			printwriter.println("<head>");
			printwriter.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
			printwriter.println("<script>");
			printwriter.println("alert('The file does not exist. [file: " + orgFileName + "]');");
			printwriter.println("</script>");
			printwriter.println("</head>");
			printwriter.println("</html>");
			printwriter.flush();
			printwriter.close();
		}

	}
	
	/**
	 * 브라우저 구분 얻기.
	 * 
	 * @param request
	 * @return
	 */
	private static String getBrowser(HttpServletRequest request) {
		String header = request.getHeader("User-Agent");
		if (header.indexOf("MSIE") > -1) {
			return "MSIE";
		} else if (header.indexOf("Chrome") > -1) {
			return "Chrome";
		} else if (header.indexOf("Opera") > -1) {
			return "Opera";
		}
		return "Firefox";
	}

	/**
	 * Disposition 지정하기.
	 * 
	 * @param filename
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private static void setDisposition(String filename, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String browser = getBrowser(request);

		String dispositionPrefix = "attachment; filename=";
		String encodedFilename = null;

		if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString();
		} else {
			// throw new RuntimeException("Not supported browser");
			throw new IOException("Not supported browser");
		}

		response.setHeader("Content-Disposition", dispositionPrefix + encodedFilename);

		if ("Opera".equals(browser)) {
			response.setContentType("application/octet-stream;charset=UTF-8");
		}
	}
	
}

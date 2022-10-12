package com.netminer.common.attachfile.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyframe.controller.CyframeController;
import com.cyframe.property.PropertyServiceIf;
import com.netminer.common.attachfile.model.AttachFileModel;
import com.netminer.common.util.FileDownloadUtil;

@Controller
public class AttachFileController extends CyframeController {

	@Inject
	private PropertyServiceIf propertyService;

	/**
	 * 게시판 첨부파일 다운로드
	 * @param attachFileModel
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/attachfile/attachFile-read.do")
	public void read(AttachFileModel attachFileModel, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String localFilePath = propertyService.getString("upload.file.Path");

		FileDownloadUtil.download(request, response, localFilePath + attachFileModel.getBf_file(), attachFileModel.getBf_source());
	}
	
	/**
	 * 신분입증 파일 다운로드
	 * @param attachFileModel
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/attachfile/attachFile_proof-read.do")
	public void read_proof(AttachFileModel attachFileModel, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String localFilePath = propertyService.getString("upload.file.proof.Path");
		
		FileDownloadUtil.download(request, response, localFilePath + attachFileModel.getBf_file(), attachFileModel.getBf_source());
	}
	
	/**
	 * 갤러리 이미지 다운로드
	 * @param attachFileModel
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/attachfile/attachFile_download_image-read.do")
	public void read_image(AttachFileModel attachFileModel, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String localFilePath = propertyService.getString("download.file.image.Path");
		
		FileDownloadUtil.download(request, response, localFilePath + attachFileModel.getBf_file(), attachFileModel.getBf_source());
	}
	
	/**
	 * 기타 자료 다운로드
	 * @param attachFileModel
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/attachfile/attachFile_download_storage-read.do")
	public void read_storage(AttachFileModel attachFileModel, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String localFilePath = propertyService.getString("download.file.storage.Path");
		
		FileDownloadUtil.download(request, response, localFilePath + attachFileModel.getBf_file(), attachFileModel.getBf_source());
	}
}

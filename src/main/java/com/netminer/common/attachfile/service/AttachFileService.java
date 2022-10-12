package com.netminer.common.attachfile.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cyframe.model.MultipartModel;
import com.cyframe.property.PropertyServiceIf;
import com.netminer.common.attachfile.dao.AttachFileDAO;
import com.netminer.common.attachfile.model.AttachFileModel;
import com.netminer.common.board.model.BoardModel;
import com.netminer.common.util.DateUtil;
import com.netminer.common.util.FileUtil;

@Service
public class AttachFileService implements AttachFileServiceIf {

	@Inject
	private AttachFileDAO attachFileDAO;

	@Inject
	protected PropertyServiceIf propertyService;

	private String propertyFilePathKey = "upload.file.Path";
	
	@Override
	public void create(BoardModel boardModel) throws Exception {

		//파일명, board id set
		this.handlePrivateField(boardModel);

		//업로드 되는 파일이 있으면
		if(boardModel.getAttach_files() != null && boardModel.getAttach_files().length > 0) {
			// 파일 로컬 생성
			List<MultipartModel> multipartModelList = new ArrayList<MultipartModel>();
				
			for (MultipartModel multipartModel : boardModel.getAttach_files()) {
				multipartModelList.add(multipartModel);
			}
			
			this.createLocalFile(multipartModelList);

			// 파일 정보 DB 생성
			this.createDBFile(boardModel);
		}
	}

	@Override
	public void readList(BoardModel boardModel) throws Exception {
		MultipartModel multipartModel;
		int i = 0;
		
		AttachFileModel rAttachFileModel = new AttachFileModel();
		rAttachFileModel.setBo_table(boardModel.getController());
		rAttachFileModel.setWr_id(boardModel.getWr_id());
		
		List<AttachFileModel> attachFileList = attachFileDAO.readList(rAttachFileModel);

		MultipartModel[] multipartModelList = new MultipartModel[attachFileList.size()]; 

		for(AttachFileModel attachFileModel : attachFileList) {
			multipartModel = new MultipartModel();
			multipartModel.setAttach_file_id(attachFileModel.getBf_no());
			multipartModel.setMaster_file_id(attachFileModel.getWr_id());
			multipartModel.setFieldName("");
			multipartModel.setFile_org_name(attachFileModel.getBf_source());
			multipartModel.setFile_name(attachFileModel.getBf_file());
			multipartModel.setFile_size(Long.parseLong(attachFileModel.getBf_filesize()));
			multipartModelList[i] = multipartModel;
			i++;
		}

		boardModel.setAttach_files(multipartModelList);
	}

	@Override
	public void update(BoardModel boardModel) throws Exception {
		AttachFileModel attachFileModel = null;
		List<AttachFileModel> deleteFileList = new ArrayList<AttachFileModel>();
		List<MultipartModel> createFileList = new ArrayList<MultipartModel>();

		String controller = boardModel.getController();

		if(boardModel.getAttach_files() != null) {
			for(MultipartModel multipartModel : boardModel.getAttach_files()) {
				
				//delete
				if(multipartModel.isDelete()) {
					attachFileModel = new AttachFileModel();
					attachFileModel.setBo_table(controller);
					attachFileModel.setWr_id(multipartModel.getMaster_file_id());
					attachFileModel.setBf_no(multipartModel.getAttach_file_id());
					attachFileModel.setBf_file(multipartModel.getFile_name());
					
					deleteFileList.add(attachFileModel);
				}
				
				//create
				if(!multipartModel.isDelete() && multipartModel.getFile_size() > 0) {
					multipartModel.setMaster_file_id(boardModel.getWr_id());
					multipartModel.setFile_name(this.getFileName(boardModel));
					createFileList.add(multipartModel);
				}
			}
		}

		/**
		 * 먼저 로컬에 있는 파일을 삭제를 하고 
		 * 테이블에 있는 파일 정보를 삭제 합니다 
		 * 
		 * 신규 파일정보를 테이블에 생성을 하고 
		 * 로컬 파일을 생성 합니다 
		 */
		// 로컬에서 삭제
		try {
			deleteLocalFile(deleteFileList);
		} catch (Exception ex) {
			/*
			 * 로컬 파일은 삭제에 실패 하여도 로직에 영향을 주지 않는다. 가비지로 남는 파일은 무시.
			 */
		}

		// DB에서 삭제
		for(AttachFileModel dAttachFileModel : deleteFileList) {
			attachFileDAO.delete(dAttachFileModel);
		}
		
		// DB에 생성
		for(MultipartModel multipartModel : createFileList) {
			attachFileModel = new AttachFileModel();
			attachFileModel.setBo_table(controller);
			attachFileModel.setWr_id(multipartModel.getMaster_file_id());
			attachFileModel.setBf_source(multipartModel.getFile_org_name());
			attachFileModel.setBf_file(multipartModel.getFile_name());
			attachFileModel.setBf_filesize(String.valueOf(multipartModel.getFile_size()));
			
			attachFileDAO.create(attachFileModel);
		}
		
		// 파일 로컬 생성
		this.createLocalFile(createFileList);
	}

	@Override
	public void delete(BoardModel boardModel) throws Exception {
		AttachFileModel attachFileModel = new AttachFileModel();
		attachFileModel.setBo_table(boardModel.getController());
		attachFileModel.setWr_id(boardModel.getWr_id());
		
		// 목록 조회
		List<AttachFileModel> fileList = attachFileDAO.readList(attachFileModel);

		// DB에서 삭제
		attachFileDAO.delete(attachFileModel);

		// 로컬에서 삭제
		try {
			deleteLocalFile(fileList);
		} catch (Exception ex) {
			/*
			 * 로컬 파일은 삭제에 실패 하여도 로직에 영향을 주지 않는다. 가비지로 남는 파일은 무시.
			 */
		}

	}

	/**
	 * 생성되는 파일명과 board id set
	 * @param boardModel
	 * @throws Exception
	 */
	private void handlePrivateField(BoardModel boardModel) throws Exception {
		if(boardModel.getAttach_files() != null) {
			
			for(MultipartModel multipartModel : boardModel.getAttach_files()) {
				multipartModel.setMaster_file_id(boardModel.getWr_id());
				multipartModel.setFile_name(this.getFileName(boardModel));
			}
		}
	}

	/**
	 * 물리적 파일 생성
	 * @param multipartModelList
	 * @throws Exception
	 */
	private void createLocalFile(List<MultipartModel> multipartModelList) throws Exception {

		String localFilePath = propertyService.getString(propertyFilePathKey);

		FileUtil.checkDirectory(localFilePath);

		for (MultipartModel multipartModel : multipartModelList) {
			FileUtil.createFile(multipartModel, localFilePath);
		}
	}

	/**
	 * 물리적 파일 삭제
	 * @param fileList
	 * @throws Exception
	 */
	private void deleteLocalFile(List<AttachFileModel> fileList) throws Exception {
		File file = null;
		
		String localFilePath = propertyService.getString(propertyFilePathKey);
		
		for(AttachFileModel attachFileModel : fileList) {
			file = new File(localFilePath + attachFileModel.getBf_file());
			if(file.isFile()){
				if(!file.delete()) {
					//throw new Exception(ConstantModel.CYRAM_ERROR + "파일 삭제 실패");
				}
			}
			
		}
	}

	/**
	 * DB create
	 * @param boardModel
	 * @throws Exception
	 */
	private void createDBFile(BoardModel boardModel) throws Exception {
		AttachFileModel attachFileModel;

		String controller = boardModel.getController();

		if(boardModel.getAttach_files() != null) {
			for(MultipartModel multipartModel : boardModel.getAttach_files()) {
				try {
					attachFileModel = new AttachFileModel();
					attachFileModel.setBo_table(controller);
					attachFileModel.setWr_id(multipartModel.getMaster_file_id());
					attachFileModel.setBf_source(multipartModel.getFile_org_name());
					attachFileModel.setBf_file(multipartModel.getFile_name());
					attachFileModel.setBf_filesize(String.valueOf(multipartModel.getFile_size()));
					
					attachFileDAO.create(attachFileModel);
					
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	/**
	 * 생성되는 파일명
	 * @param model
	 * @return
	 * @throws Exception
	 */
	private String getFileName(BoardModel model) throws Exception {
		return model.getController() + "_" + model.getWr_id() + "_" + DateUtil.stringFormatSSS() + new Random().nextInt();
	}
	
}

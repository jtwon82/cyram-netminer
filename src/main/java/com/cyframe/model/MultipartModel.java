package com.cyframe.model;

import java.io.Serializable;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * 파일정보 처리를 위한 모델 클래스
 * 
 */
public class MultipartModel extends CommonsMultipartFile implements Serializable {

	public MultipartModel(FileItem fileItem) {
		super(fileItem);
		
		int index = super.getOriginalFilename().lastIndexOf(".");
		file_extension = super.getOriginalFilename().substring(index + 1);
		
		file_size = super.getSize();
		
		file_org_name = super.getOriginalFilename();
	}

	public MultipartModel() {
		super(new DiskFileItem("", "", false, "", 0, null) {
			private static final long serialVersionUID = 1L;

			@Override
			public long getSize() {
				return 0L;
			}
		});
	}

	private static final long serialVersionUID = 1L;

	
	private String fieldName = "";
	
	
	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	private boolean delete = false;
	
	public boolean isDelete() {
		return delete;
	}

	public void setDelete(boolean delete) {
		this.delete = delete;
	}

	/**
	 * 
	 */
	public int master_file_id = 0;

	/**
	 * 첨부파일 아이디
	 */
	public int attach_file_id = 0;

	/**
	 * 파일확장자
	 */
	public String file_extension = "";

	/**
	 * 파일크기
	 */
	public long file_size = 0L;

	/**
	 * 파일저장경로
	 */
	public String file_path = "";

	/**
	 * 원파일명
	 */
	public String file_org_name = "";

	/**
	 * 저장파일명
	 */
	public String file_name = "";

	public int getMaster_file_id() {
		return master_file_id;
	}

	public void setMaster_file_id(int master_file_id) {
		this.master_file_id = master_file_id;
	}

	public int getAttach_file_id() {
		return attach_file_id;
	}

	public void setAttach_file_id(int attach_file_id) {
		this.attach_file_id = attach_file_id;
	}

	public String getFile_extension() {
		return file_extension;
	}

	public void setFile_extension(String file_extension) {
		this.file_extension = file_extension;
	}

	public long getFile_size() {
		return this.file_size;
	}

	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getFile_org_name() {
		return file_org_name;
	}

	public void setFile_org_name(String file_org_name) {
		this.file_org_name = file_org_name;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

}

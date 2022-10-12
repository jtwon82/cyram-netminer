package com.netminer.common.attachfile.model;

import com.cyframe.model.CyframeModel;

public class AttachFileModel extends CyframeModel {

	private static final long serialVersionUID = 1L;

	private String bo_table = "";
	private int wr_id = 0;
	private int bf_no = 0;
	private String bf_source = "";
	private String bf_file = "";
	private String bf_download = "0";
	private String bf_content = "";
	private String bf_filesize = "";
	private String bf_width = "";
	private String bf_height = "";
	private String bf_type = "";
	private String bf_datetime = "";

	public String getBo_table() {
		return bo_table;
	}
	public void setBo_table(String bo_table) {
		this.bo_table = bo_table;
	}
	public int getWr_id() {
		return wr_id;
	}
	public void setWr_id(int wr_id) {
		this.wr_id = wr_id;
	}
	public int getBf_no() {
		return bf_no;
	}
	public void setBf_no(int bf_no) {
		this.bf_no = bf_no;
	}
	public String getBf_source() {
		return bf_source;
	}
	public void setBf_source(String bf_source) {
		this.bf_source = bf_source;
	}
	public String getBf_file() {
		return bf_file;
	}
	public void setBf_file(String bf_file) {
		this.bf_file = bf_file;
	}
	public String getBf_download() {
		return bf_download;
	}
	public void setBf_download(String bf_download) {
		this.bf_download = bf_download;
	}
	public String getBf_content() {
		return bf_content;
	}
	public void setBf_content(String bf_content) {
		this.bf_content = bf_content;
	}
	public String getBf_filesize() {
		return bf_filesize;
	}
	public void setBf_filesize(String bf_filesize) {
		this.bf_filesize = bf_filesize;
	}
	public String getBf_width() {
		return bf_width;
	}
	public void setBf_width(String bf_width) {
		this.bf_width = bf_width;
	}
	public String getBf_height() {
		return bf_height;
	}
	public void setBf_height(String bf_height) {
		this.bf_height = bf_height;
	}
	public String getBf_type() {
		return bf_type;
	}
	public void setBf_type(String bf_type) {
		this.bf_type = bf_type;
	}
	public String getBf_datetime() {
		return bf_datetime;
	}
	public void setBf_datetime(String bf_datetime) {
		this.bf_datetime = bf_datetime;
	}

	
}

package com.cyframe.multipart;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;
import org.springframework.http.MediaType;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.cyframe.model.ConstantModel;
import com.cyframe.model.MultipartModel;

public class ExtendsMultipartResolver extends CommonsMultipartResolver {

	@Override
	protected MultipartParsingResult parseFileItems(List<FileItem> fileItems, String encoding) {
		MultiValueMap<String, MultipartFile> multipartFiles = new LinkedMultiValueMap<String, MultipartFile>();
		Map<String, String[]> multipartParameters = new HashMap<String, String[]>();
		Map<String, String> multipartParameterContentTypes = new HashMap<String, String>();

		MultipartModel file;
		String[] delete_files = new String[3];

		// Extract multipart files and multipart parameters.
		for(FileItem fileItem : fileItems) {
			if(fileItem.isFormField()) {
				String value;
				String partEncoding = determineEncoding(fileItem.getContentType(), encoding);
				
				if(partEncoding != null) {
					try {
						value = fileItem.getString(partEncoding);
					} catch (UnsupportedEncodingException ex) {
						value = fileItem.getString();
					}
				} else {
					value = fileItem.getString();
				}
				
				String[] curParam = multipartParameters.get(fileItem.getFieldName());
				
				if(curParam == null) {
					// simple form field
					multipartParameters.put(fileItem.getFieldName(), new String[] { value });
				} else {
					// array of simple form fields
					String[] newParam = StringUtils.addStringToArray(curParam, value);
					multipartParameters.put(fileItem.getFieldName(), newParam);
				}
				
				multipartParameterContentTypes.put(fileItem.getFieldName(), fileItem.getContentType());
				
				//delete file add
				if(ConstantModel.MULTIPART_DELETE_FIELD_NAME.equalsIgnoreCase(fileItem.getFieldName())) {
					delete_files = value.split(ConstantModel.MULTIPART_DELETE_SPLIT_DELIMITER);
					
					if(delete_files.length == 3) {
						file = new MultipartModel();
						file.setMaster_file_id(Integer.parseInt(delete_files[0]));
						file.setAttach_file_id(Integer.parseInt(delete_files[1]));
						file.setFile_name(delete_files[2]);
						file.setDelete(true);
						multipartFiles.add(ConstantModel.MULTIPART_FIELD_NAME, file);
					}
				}
			} else {
				// multipart file field
				file = new MultipartModel(fileItem);
				multipartFiles.add(ConstantModel.MULTIPART_FIELD_NAME, file);
			}
		}
		return new MultipartParsingResult(multipartFiles, multipartParameters, multipartParameterContentTypes);
	}

	private String determineEncoding(String contentTypeHeader, String defaultEncoding) {
		if(!StringUtils.hasText(contentTypeHeader)) {
			return defaultEncoding;
		}
		MediaType contentType = MediaType.parseMediaType(contentTypeHeader);
		Charset charset = contentType.getCharSet();
		return (charset != null ? charset.name() : defaultEncoding);
	}
}

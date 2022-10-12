package com.netminer.common.board.service;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cyframe.model.ConstantModel;
import com.cyframe.model.MultipartModel;
import com.cyframe.property.PropertyServiceIf;
import com.netminer.common.attachfile.service.AttachFileServiceIf;
import com.netminer.common.board.dao.BoardDao;
import com.netminer.common.board.model.BoardModel;
import com.netminer.common.util.AttachFileTagUtil;
import com.netminer.common.util.ModelConverterUtil;
import com.sun.org.apache.xml.internal.security.utils.Base64;

@Service
public class BoardService implements BoardServiceIf {

	@Inject
	private BoardDao boardDao;

	@Inject
	private AttachFileServiceIf attachFileService;

	@Inject
	private PropertyServiceIf propertyService;

	@Override
	public void create(BoardModel model) throws Exception {
		int wr_id = boardDao.create(model);
		model.setWr_id(wr_id);
		model.setWr_parent(wr_id);

		//부모id update
		boardDao.update4Parent(model);

		//첨부파일 등록
		attachFileService.create(model);
	}

	@Override
	public void create_comment(BoardModel model) throws Exception {
		boardDao.create_comment(model);

		//부모 게시글에 wr_comment update
		boardDao.update4Comment(model);
	}

	@Override
	public List<BoardModel> readList(BoardModel model) throws Exception {
		List<BoardModel> list = null;
		int totalCount = 0;
		
		totalCount = boardDao.readTotal(model);
		list = boardDao.readList(model);
//		System.out.println("totalcount::::::::::::::::::"+totalCount);
//		if(totalCount > 0) {
		model.setTotalCount(totalCount);
//		} else model.setTotalCount(to);
//		if(totalCount == 0){
//			model.setTotalCount(totalCount);
//			model.setSearchWord("");
//			list = boardDao.readList(model);
//		}

//		try{
//			
//			System.out.println("service list:::"+list);
//		}catch(NullPointerException e){
//			System.out.println("eeeeeeeeeee");
//		}
		for(BoardModel boardModel : list) {
			
			boardModel = (BoardModel) ModelConverterUtil.convert(model, boardModel);
			//첨부파일
			attachFileService.readList(boardModel);
			boardModel.setAttachFilePrint(AttachFileTagUtil.getAttachFilePrint(boardModel, false, true));
//			
		}
		
		return list;
	}

	@Override
	public List<BoardModel> readList_new(BoardModel model) throws Exception {
		List<BoardModel> list = boardDao.readList_new(model);
		
		
//		
//		for(BoardModel boardModel : list) {
//			boardModel = (BoardModel) ModelConverterUtil.convert(model, boardModel);
//			
//			//첨부파일
//			attachFileService.readList(boardModel);
//			boardModel.setAttachFilePrint(AttachFileTagUtil.getAttachFilePrint(boardModel, false, true));
//		}
		return list;
	}
	
	@Override
	public BoardModel read(BoardModel model) throws Exception {
		BoardModel boardModel = boardDao.read(model);
		
		if(boardModel == null) {
			boardModel = model;
		} else {
			boardModel = (BoardModel) ModelConverterUtil.convert(model, boardModel);
			
			//조회수 증가
			boardDao.update4Hit(boardModel);
			
			//첨부파일
			attachFileService.readList(boardModel);
			
			//comment 조회
			List<BoardModel> commentList = null;
			commentList = boardDao.readList_comment(boardModel);
			boardModel.setCommentList(commentList);
		}
		
		return boardModel;
	}
	
	@Override
	public void update(BoardModel model) throws Exception {
		attachFileService.update(model);
		
		boardDao.update(model);
	}

	@Override
	public void update_new(BoardModel model) throws Exception {
		if(model.getBn_id() == null || "".equals(model.getBn_id())) {
			boardDao.create_new(model);
		} else {
			boardDao.delete_new(model);
		}
	}
	
	@Override
	public void delete(BoardModel model) throws Exception {
		//comment 전체 삭제
		model.setWr_comment(0);
		boardDao.delete_comment(model);
		
		//첨부파일 삭제
		attachFileService.delete(model);

		//본문 삭제
		boardDao.delete(model);
	}

	@Override
	public void delete_comment(BoardModel model) throws Exception {
		//해당 comment 삭제
		int d = boardDao.delete_comment(model);
		
		if(d <= 0) {
			throw new Exception(ConstantModel.CYRAM_ERROR + "Incorrect password.");
		}
		
		//부모 게시글에 wr_comment update
		boardDao.update4Comment(model);
	}

	/* (non-Javadoc)
	 * @see com.netminer.common.board.service.BoardServiceIf#setBase64(com.netminer.common.board.model.BoardModel)
	 * appstore 에 첨부파일로 이미지를 올린 경우 본문에 뿌려지도록 하기 위해 base64로 변환하여 반환
	 */
	@Override
	public void setBase64(BoardModel model) throws Exception {
		List<String> list = new ArrayList<String>();
		
		MultipartModel[] multipartModels = model.getAttach_files();
		
		if(multipartModels != null && multipartModels.length > 0) {
			String localFile = null;
			File uFile = null;
			int fSize = 0;
			byte[] barr = null;
			FileInputStream fis = null;
			String fileName = null;
			String fileEx = null;
			
			String localFilePath = propertyService.getString("upload.file.Path");
			
			for(MultipartModel multipartModel : multipartModels) {
				fileName = multipartModel.getFile_org_name().toUpperCase();

				if(fileName.endsWith(".JPG") || fileName.endsWith(".GIF") || fileName.endsWith(".PNG")) {
					if(fileName.endsWith(".JPG")) {
						fileEx = "data:image/jpeg;base64,";
					} else if(fileName.endsWith(".GIF")) {
						fileEx = "data:image/gif;base64,";
					} else if(fileName.endsWith(".PNG")) {
						fileEx = "data:image/png;base64,";
					}
					
					localFile = localFilePath + multipartModel.getFile_name();
					uFile = new File(localFile);
					
					fSize = (int) uFile.length();
					
					if(uFile.isFile() && fSize > 0) {
						try {
							barr = new byte[fSize];
							fis = new FileInputStream(uFile);
							fis.read(barr, 0, barr.length - 1);
							fis.close();
							
							list.add(fileEx + Base64.encode(barr));
						} catch (Exception ex) {
						} finally {
							if(fis != null) {
								fis.close();
							}
						}
					}
				}
			}
			
			model.setBase64FileList(list);
		}
	}

}

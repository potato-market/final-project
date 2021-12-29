package org.kosta.finalproject.model.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.kosta.finalproject.model.domain.ImageVO;
import org.kosta.finalproject.model.domain.ItemVO;
import org.kosta.finalproject.model.mapper.ItemMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class ItemServiceImpl implements ItemService {

	@Resource
	private ItemMapper itemMapper;

	@Override
	public int registerItem(ItemVO itemVO) {
		int itemId=itemMapper.registerItem(itemVO);
		System.out.println(itemId);
		
		System.out.println("registerServiceImpl");
		return itemVO.getItemId();
	}

	@Override
	public ItemVO selectItemByItemId(int itemId) {
		return itemMapper.selectItemByItemId(itemId);
	}

	@Override
	public void updateItem(ItemVO itemVO) {
		itemMapper.updateItem(itemVO);
	}

	@Override
	public List<ItemVO> getAllItemList() {
		return itemMapper.getAllItemList();
	}

	@Override
	public void deleteItem(int itemId) {
		itemMapper.deleteItem(itemId);
	}
	@Override
	public void uploadMultiImage(ItemVO itemVO, MultipartHttpServletRequest request, MultipartFile[] imgfile) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		
		
 		String filepath=request.getServletContext().getRealPath("assets/upload/");
	 
		//File OriginName
		String originalFile;
		String savedFileName;
		String originalFileExtension;
		File file;
		ImageVO imageVO=new ImageVO();
		
		System.out.println("imgController");
		System.out.println(imgfile[0].getOriginalFilename());
		
		for(int i=0; i<imgfile.length; i++) {
			MultipartFile img = imgfile[i];
			//파일명
			originalFile = img.getOriginalFilename();
	        //파일명 중 확장자만 추출           
			//lastIndexOf(".") - 뒤에 있는 . 의 index번호
			originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
			//저장될 파일명 - 파일명이 같은 사진이 있을 수 있으므로 파일명 변경
			savedFileName = UUID.randomUUID() + originalFileExtension;
			
			file = new File(filepath + savedFileName);
			
			img.transferTo(file);
			
			
		
			imageVO.setImageName(savedFileName);
			imageVO.setItemId(itemVO.getItemId());			
			itemMapper.uploadMultiImage(imageVO);
		}
		
	
	
	}

	@Override
	public List<ImageVO> findItemImageListByItemId(int itemId) {
		// TODO Auto-generated method stub
		List<ImageVO> list = 
		itemMapper.findItemImageListByItemId(itemId);
		
		
		return list;
	}

	@Override
	public void delCheckedImg(List<Integer> list) {
		// TODO Auto-generated method stub
		for(int i=0;i<list.size();i++)itemMapper.deleteImage(list.get(i));
		
		
	}
	@Override
	public List<ItemVO> selectItemByUserId(String userId) {
		// TODO Auto-generated method stub
		
		return itemMapper.selectItemByUserId(userId);
	}
	


}

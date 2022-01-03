package org.kosta.finalproject.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.finalproject.model.domain.ImageVO;
import org.kosta.finalproject.model.domain.CategoryVO;
import org.kosta.finalproject.model.domain.ItemVO;

@Mapper
public interface ItemMapper {
	public int registerItem(ItemVO itemVO);
	public ItemVO selectItemByItemId(int itemId);
	public void updateItem(ItemVO itemVO);
	public List<ItemVO> getAllItemList();
	public List<CategoryVO> getAllCategoryList();
	public void deleteItem(int itemId);
	public void uploadMultiImage(ImageVO imageVO);
	public List<ImageVO> findItemImageListByItemId(int itemId);
	public ImageVO findItemImageVOByItemId(int itemId);
	public void deleteImage(int imageId);	 
	public List<ItemVO> selectItemByUserId(String userId);
	public List<ItemVO> selectAllItemListByCondition(ItemVO itemVO);
	public int itemHitUpdate(int itemId);
}



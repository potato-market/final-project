package org.kosta.finalproject.model.service;

import java.util.List;

import org.kosta.finalproject.model.domain.CategoryVO;
import org.kosta.finalproject.model.domain.ItemVO;


public interface ItemService {

	public void registerItem(ItemVO itemVO);
	public ItemVO selectItemByItemId(int itemId);
	public void updateItem(ItemVO itemVO);
	public List<ItemVO> getAllItemList();
	public void deleteItem(int itemId);
	public List<CategoryVO> getAllCategoryList();
	public List<ItemVO> selectAllItemListByCondition(ItemVO itemVO);

}

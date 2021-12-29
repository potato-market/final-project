package org.kosta.finalproject.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.finalproject.model.domain.CategoryVO;
import org.kosta.finalproject.model.domain.ItemVO;
import org.kosta.finalproject.model.mapper.ItemMapper;
import org.springframework.stereotype.Service;

@Service
public class ItemServiceImpl implements ItemService {

	@Resource
	private ItemMapper itemMapper;

	@Override
	public void registerItem(ItemVO itemVO) {
		itemMapper.registerItem(itemVO);
		System.out.println("registerServiceImpl");
	}

	@Override
	public ItemVO selectItemByItemId(int itemId) {
		 itemMapper.itemHitUpdate(itemId);
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
	public List<CategoryVO> getAllCategoryList() {
		return itemMapper.getAllCategoryList();
	}
	
	@Override
	public List<ItemVO> selectAllItemListByCondition(ItemVO itemVO) {
		return itemMapper.selectAllItemListByCondition(itemVO);
	}
	
}

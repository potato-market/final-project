package org.kosta.finalproject.model.service;

import javax.annotation.Resource;

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
	}

	@Override
	public ItemVO selectItemByItemId(int itemId) {
		return itemMapper.selectItemByItemId(itemId);
	}
	
}

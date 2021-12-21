package org.kosta.finalproject.model.service;

import org.kosta.finalproject.model.domain.ItemVO;


public interface ItemService {

	public void registerItem(ItemVO itemVO);
	public ItemVO selectItemByItemId(int itemId);

}

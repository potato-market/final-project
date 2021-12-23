package org.kosta.finalproject.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.finalproject.model.domain.ItemVO;

@Mapper
public interface ItemMapper {
	public void registerItem(ItemVO itemVO);
	public ItemVO selectItemByItemId(int itemId);
	public void updateItem(ItemVO itemVO);
	public List<ItemVO> getAllItemList();
}

package org.kosta.finalproject.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.finalproject.model.domain.ItemVO;

@Mapper
public interface ItemMapper {
	public void registerItem(ItemVO itemVO);

}

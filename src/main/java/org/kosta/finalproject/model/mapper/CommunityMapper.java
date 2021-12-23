package org.kosta.finalproject.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.finalproject.model.domain.CommunityVO;

@Mapper	
public interface CommunityMapper {

	void writeCommunity(CommunityVO communityVO);

	List<CommunityVO> getAllCommunityList();

}

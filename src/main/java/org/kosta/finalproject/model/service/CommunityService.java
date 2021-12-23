package org.kosta.finalproject.model.service;

import java.util.List;

import org.kosta.finalproject.model.domain.CommunityVO;

public interface CommunityService {

	void writeCommunity(CommunityVO communityVO);

	List<CommunityVO> getAllCommunityList();

	CommunityVO getCommunityById(int communityId);

	void updateCommunity(CommunityVO communityVO);

	void deleteCommunity(int communityId);

}

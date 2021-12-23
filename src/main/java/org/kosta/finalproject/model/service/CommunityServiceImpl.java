package org.kosta.finalproject.model.service;

import java.util.List;

import org.kosta.finalproject.model.domain.CommunityVO;
import org.kosta.finalproject.model.mapper.CommunityMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommunityServiceImpl implements CommunityService{
	@Autowired
	CommunityMapper communityMapper;	
	@Override
	public void writeCommunity(CommunityVO communityVO) {
		communityMapper.writeCommunity(communityVO);
	}
	@Override
	public List<CommunityVO> getAllCommunityList() {
		return communityMapper.getAllCommunityList();
	}
	@Override
	public CommunityVO getCommunityById(int communityId) {
		return communityMapper.getCommunityById(communityId);
	}
	@Override
	public void updateCommunity(CommunityVO communityVO) {
		communityMapper.updateCommunity(communityVO);
	}
	@Override
	public void deleteCommunity(int communityId) {
		communityMapper.deleteCommunity(communityId);
	}

}

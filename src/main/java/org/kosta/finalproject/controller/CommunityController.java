package org.kosta.finalproject.controller;

import org.kosta.finalproject.model.domain.CommunityVO;
import org.kosta.finalproject.model.service.CommunityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController {
	@Autowired
	private CommunityService communityService;

	@RequestMapping("communityBoard")
	public String communityList(Model model) {
		// 전체 글 목록 불러오기
		model.addAttribute("list", communityService.getAllCommunityList());
		
		return "community/community-board.tiles";
	}

	@RequestMapping("communityDetail")
	public String communityDetail(Model model,int communityId) {
		model.addAttribute("communityData", communityService.getCommunityById(communityId));
		return "community/community-detail.tiles";
	}

	@RequestMapping("communityWriteForm")
	public String communityWriteForm() {
		return "community/community-write-form.tiles";
	}

	@PostMapping("writeCommunity")
	public String writeCommunity(CommunityVO communityVO) {
		communityService.writeCommunity(communityVO);
		return "redirect:communityBoard";
	}
	
}

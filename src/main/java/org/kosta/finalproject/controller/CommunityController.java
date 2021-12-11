package org.kosta.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController {
	//private CommunityMapper communityMapper;

	@Autowired
	public CommunityController() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("communityList")
	public String communityList() {
		return "community/community.tiles";
	}
}

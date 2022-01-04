package org.kosta.finalproject.controller;

import org.kosta.finalproject.model.domain.CommentVO;
import org.kosta.finalproject.model.domain.CommunityVO;
import org.kosta.finalproject.model.service.CommentService;
import org.kosta.finalproject.model.service.CommunityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommunityController {
	@Autowired
	private CommunityService communityService;
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("communityBoard")
	public String communityList(Model model) {
		// 전체 글 목록 불러오기
		model.addAttribute("list", communityService.getAllCommunityList());
		
		return "community/community-board.tiles";
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
	
	@RequestMapping("updateCommunityForm")
	public String updateCommunityForm (Model model,int communityId) {
		model.addAttribute("communityData", communityService.getCommunityById(communityId));
		return "community/community-update-form.tiles";
	}
	
	@PostMapping("updateCommunity")
	public String updateCommunity(CommunityVO communityVO) {
		communityService.updateCommunity(communityVO);
		return "redirect:communityDetail?communityId="+communityVO.getCommunityId();
	}
	
	@PostMapping("deleteCommunity")
	public String deleteCommunity(int communityId) {
		communityService.deleteCommunity(communityId);
		return "redirect:communityBoard";
	}
	
	@GetMapping("communityDetail")
	public String communityDetail(Model model,int communityId) {
		model.addAttribute("communityData",communityService.getCommunityById(communityId));
		model.addAttribute("commemtList",commentService.getCommentList(communityId));
		return "community/community-detail.tiles";
	}
	
	
	@PostMapping("writeComment")
	@ResponseBody
	public CommentVO writeComment(CommentVO commentVO) {
		commentService.writeComment(commentVO);
		return commentService.findCommentByCommentId(commentVO.getCommentId());
	}	
	
	@PostMapping("deleteComment")
	@ResponseBody
	public void deleteComment(int commentId) {
		commentService.deleteComment(commentId);
		/* return commentId; */
	}
	
	@PostMapping("updateComment")
	@ResponseBody
	public CommentVO updateComment(CommentVO commentVO) {
		commentService.updateComment(commentVO);
		 return commentService.findCommentByCommentId(commentVO.getCommentId());
	}
	
	@GetMapping("findCommentByCommentId")
	@ResponseBody
	public CommentVO findCommentByCommentId(int commentId) {
		return commentService.findCommentByCommentId(commentId);
	}
	
}

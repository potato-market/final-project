package org.kosta.finalproject.model.service;

import java.util.List;

import org.kosta.finalproject.model.domain.CommentVO;
import org.kosta.finalproject.model.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentMapper commentMapper;

	@Override
	public List<CommentVO> getCommentList(int communityId) {
		return commentMapper.getCommentList(communityId);
	}

	@Override
	public void writeComment(CommentVO commentVO) {
		commentMapper.writeComment(commentVO);
	}
	
	@Override
	public CommentVO findCommentByCommentId(int commentId) {
		return commentMapper.findCommentByCommentId(commentId);
	}

	@Override
	public void deleteComment(int commentId) {
		commentMapper.deleteComment(commentId);
	}

	
}

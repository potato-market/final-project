package org.kosta.finalproject.model.service;

import java.util.List;

import org.kosta.finalproject.model.domain.CommentVO;

public interface CommentService {

	List<CommentVO> getCommentList(int communityId);

	void writeComment(CommentVO commentVO);

	CommentVO findCommentByCommentId(int commentId);

	void deleteComment(int commentId);

	void updateComment(CommentVO commentVO);
	




}

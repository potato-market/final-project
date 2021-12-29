package org.kosta.finalproject.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.finalproject.model.domain.CommentVO;

@Mapper
public interface CommentMapper {

	List<CommentVO> getCommentList(int communityId);

	void writeComment(CommentVO commentVO);

	CommentVO findCommentByCommentId(int commentId);

	void deleteComment(int commentId);
}

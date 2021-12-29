package org.kosta.finalproject.model.domain;

import lombok.Data;

@Data
public class CommentVO {
	private int commentId;
	private	CommunityVO communityVO;
	private String commentContent;
	private UserVO userVO;
	private String commentCreatedAt;
}
	
	

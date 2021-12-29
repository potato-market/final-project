package org.kosta.finalproject.model.domain;


public class CommentVO {
	private int commentId;
	private	CommunityVO communityVO;
	private String commentContent;
	private UserVO userVO;
	private String commentCreatedAt;
	public CommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentVO(int commentId, CommunityVO communityVO, String commentContent, UserVO userVO,
			String commentCreatedAt) {
		super();
		this.commentId = commentId;
		this.communityVO = communityVO;
		this.commentContent = commentContent;
		this.userVO = userVO;
		this.commentCreatedAt = commentCreatedAt;
	}
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public CommunityVO getCommunityVO() {
		return communityVO;
	}
	public void setCommunityVO(CommunityVO communityVO) {
		this.communityVO = communityVO;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	public String getCommentCreatedAt() {
		return commentCreatedAt;
	}
	public void setCommentCreatedAt(String commentCreatedAt) {
		this.commentCreatedAt = commentCreatedAt;
	}
	@Override
	public String toString() {
		return "CommentVO [commentId=" + commentId + ", communityVO=" + communityVO + ", commentContent="
				+ commentContent + ", userVO=" + userVO + ", commentCreatedAt=" + commentCreatedAt + "]";
	}
	
	
	
	
}
	
	

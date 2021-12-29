package org.kosta.finalproject.model.domain;

public class CommunityVO {
	private int communityId;
	private UserVO userVO;
	private String communityContent;
	public CommunityVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommunityVO(int communityId, UserVO userVO, String communityContent) {
		super();
		this.communityId = communityId;
		this.userVO = userVO;
		this.communityContent = communityContent;
	}
	
	
	public CommunityVO(UserVO userVO, String communityContent) {
		super();
		this.userVO = userVO;
		this.communityContent = communityContent;
	}
	public int getCommunityId() {
		return communityId;
	}
	public void setCommunityId(int communityId) {
		this.communityId = communityId;
	}
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	public String getCommunityContent() {
		return communityContent;
	}
	public void setCommunityContent(String communityContent) {
		this.communityContent = communityContent;
	}
	@Override
	public String toString() {
		return "CommunityVO [communityId=" + communityId + ", userVO=" + userVO + ", communityContent="
				+ communityContent + "]";
	}
	
}

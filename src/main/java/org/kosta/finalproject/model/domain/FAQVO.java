package org.kosta.finalproject.model.domain;

public class FAQVO {
	private int faqId;
	private String faqTitle;
	private String faqContent;
	private UserVO userVO;
	public FAQVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public FAQVO(String faqTitle, String faqContent, UserVO userVO) {
		super();
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.userVO = userVO;
	}


	public FAQVO(int faqId, String faqTitle, String faqContent, UserVO userVO) {
		super();
		this.faqId = faqId;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.userVO = userVO;
	}
	public int getFaqId() {
		return faqId;
	}
	public void setFaqId(int faqId) {
		this.faqId = faqId;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	@Override
	public String toString() {
		return "FAQVO [faqId=" + faqId + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", userVO=" + userVO
				+ "]";
	}
	
	
}

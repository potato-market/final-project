package org.kosta.finalproject.model.domain;

public class FAQVO {
	private int FAQId;
	private String FAQTitle;
	private String FAQContent;
	private UserVO userVO;
	public FAQVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FAQVO(int fAQId, String fAQTitle, String fAQContent, UserVO userVO) {
		super();
		FAQId = fAQId;
		FAQTitle = fAQTitle;
		FAQContent = fAQContent;
		this.userVO = userVO;
	}
	public int getFAQId() {
		return FAQId;
	}
	public void setFAQId(int fAQId) {
		FAQId = fAQId;
	}
	public String getFAQTitle() {
		return FAQTitle;
	}
	public void setFAQTitle(String fAQTitle) {
		FAQTitle = fAQTitle;
	}
	public String getFAQContent() {
		return FAQContent;
	}
	public void setFAQContent(String fAQContent) {
		FAQContent = fAQContent;
	}
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	@Override
	public String toString() {
		return "FAQVO [FAQId=" + FAQId + ", FAQTitle=" + FAQTitle + ", FAQContent=" + FAQContent + ", userVO=" + userVO
				+ "]";
	}
	
}

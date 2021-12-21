package org.kosta.finalproject.model.domain;

public class UserVO {
	private String userId;
	private String userPassword;
	private String userTel;
	private String userAddress;
	private String userEmail;
	private String userImage;
	private String userEnabled;
	private String userCreatedAt;
	public UserVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserVO(String userId, String userPassword, String userTel, String userAddress, String userEmail,
			String userImage, String userEnabled, String userCreatedAt) {
		super();
		this.userId = userId;
		this.userPassword = userPassword;
		this.userTel = userTel;
		this.userAddress = userAddress;
		this.userEmail = userEmail;
		this.userImage = userImage;
		this.userEnabled = userEnabled;
		this.userCreatedAt = userCreatedAt;
	}
	
	
	public UserVO(String userId, String userPassword, String userTel, String userAddress, String userEmail) {
		super();
		this.userId = userId;
		this.userPassword = userPassword;
		this.userTel = userTel;
		this.userAddress = userAddress;
		this.userEmail = userEmail;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserImage() {
		return userImage;
	}
	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}
	public String getUserEnabled() {
		return userEnabled;
	}
	public void setUserEnabled(String userEnabled) {
		this.userEnabled = userEnabled;
	}
	public String getUserCreatedAt() {
		return userCreatedAt;
	}
	public void setUserCreatedAt(String userCreatedAt) {
		this.userCreatedAt = userCreatedAt;
	}
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userPassword=" + userPassword + ", userTel=" + userTel + ", userAddress="
				+ userAddress + ", userEmail=" + userEmail + ", userImage=" + userImage + ", userEnabled=" + userEnabled
				+ ", userCreatedAt=" + userCreatedAt + "]";
	}
}
	
	

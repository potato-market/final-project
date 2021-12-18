package org.kosta.finalproject.model.domain;

import java.io.Serializable;


public class UserVO implements Serializable{
	private static final long serialVersionUID = -4185469606236616588L;

	private String userId;
	private String userTel;
	private String userAddress;
	private String userCreatedAt;
	private String userImage;
	private String userType;
	private String userPassword;
	private String userEmail;
	public UserVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserVO(String userId, String userTel, String userAddress, String userCreatedAt, String userImage,
			String userType, String userPassword, String userEmail) {
		super();
		this.userId = userId;
		this.userTel = userTel;
		this.userAddress = userAddress;
		this.userCreatedAt = userCreatedAt;
		this.userImage = userImage;
		this.userType = userType;
		this.userPassword = userPassword;
		this.userEmail = userEmail;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public String getUserCreatedAt() {
		return userCreatedAt;
	}
	public void setUserCreatedAt(String userCreatedAt) {
		this.userCreatedAt = userCreatedAt;
	}
	public String getUserImage() {
		return userImage;
	}
	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userTel=" + userTel + ", userAddress=" + userAddress + ", userCreatedAt="
				+ userCreatedAt + ", userImage=" + userImage + ", userType=" + userType + ", userPassword="
				+ userPassword + ", userEmail=" + userEmail + "]";
	}
	
}

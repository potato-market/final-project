package org.kosta.finalproject.model.domain;

public class ChatRoomVO {
	private long chatRoomId;
	private String userId;	
	private String sellerId;
	private int itemId;
	public long getChatRoomId() {
		return chatRoomId;
	}
	public void setChatRoomId(long chatRoomId) {
		this.chatRoomId = chatRoomId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	@Override
	public String toString() {
		return "ChatRoomVO [chatRoomId=" + chatRoomId + ", userId=" + userId + ", sellerId=" + sellerId + ", itemId="
				+ itemId + "]";
	}
	public ChatRoomVO(long chatRoomId, String userId, String sellerId, int itemId) {
		super();
		this.chatRoomId = chatRoomId;
		this.userId = userId;
		this.sellerId = sellerId;
		this.itemId = itemId;
	}
	public ChatRoomVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	
 
}

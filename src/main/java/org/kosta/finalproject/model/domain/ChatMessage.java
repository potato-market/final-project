package org.kosta.finalproject.model.domain;

public class ChatMessage {
	private long chatRoomId;
	private long index;	
	private String content;
	private String sender;
	private MessageType type;
	private String updateAt;
	
	
	@Override
	public String toString() {
		return "ChatMessage [chatRoomId=" + chatRoomId + ", index=" + index + ", content=" + content + ", sender="
				+ sender + ", type=" + type + ", updateAt=" + updateAt + "]";
	}


	public ChatMessage(long chatRoomId, String content, String updateAt) {
		super();
		this.chatRoomId = chatRoomId;
		this.content = content;
		this.updateAt = updateAt;
	}


	public ChatMessage() {
		super();
		// TODO Auto-generated constructor stub
	}


	public long getChatRoomId() {
		return chatRoomId;
	}


	public void setChatRoomId(long chatRoomId) {
		this.chatRoomId = chatRoomId;
	}


	public long getIndex() {
		return index;
	}


	public void setIndex(long index) {
		this.index = index;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getSender() {
		return sender;
	}


	public void setSender(String sender) {
		this.sender = sender;
	}


	public MessageType getType() {
		return type;
	}


	public void setType(MessageType type) {
		this.type = type;
	}


	public String getUpdateAt() {
		return updateAt;
	}


	public void setUpdateAt(String updateAt) {
		this.updateAt = updateAt;
	}


	public enum MessageType {
		CHAT, LEAVE, JOIN
	}


}
package org.kosta.finalproject.model.service;

import java.util.List;
import java.util.Map;

import org.kosta.finalproject.model.domain.ChatMessage;
import org.kosta.finalproject.model.domain.ChatRoomVO;


public interface ChattingService {
	List<ChatMessage> findByChatRoomId(long chatRoomId);
	Long createChatRoom(int itemId,String userId,String sellerId);
	Map<String, List<ChatMessage>> findListByUserId(int itemId,String userId);
	List<ChatMessage> chatSort(List<ChatMessage> chatmessagelist);
	ChatRoomVO findItemIdByChatRoomId(Long chatRoomId); 
	Map<String, List<ChatMessage>> findListByUserIdHeader(String userId);
	int getChatCount(int itemId);
	 
}

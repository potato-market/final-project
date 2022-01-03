package org.kosta.finalproject.repository;


import java.util.List;

import org.kosta.finalproject.model.domain.ChatMessage;
import org.springframework.data.mongodb.repository.MongoRepository;

 

public interface ChatMessageRepository extends MongoRepository<ChatMessage, String>{
	
	public List<ChatMessage> findByChatRoomId(long chatRoomId);
	 
	/*
	 * @Query("sort={'index':1}") public List<ChatMessage>
	 * findListByChatRoomIdLi(long chatRoomId);
	 */
 	
}
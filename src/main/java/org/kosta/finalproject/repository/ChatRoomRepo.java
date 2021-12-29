package org.kosta.finalproject.repository;

import java.util.List;

import org.kosta.finalproject.model.domain.ChatRoomVO;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

public interface ChatRoomRepo  extends MongoRepository<ChatRoomVO,String>{
@Query("{'userId': ?0, 'itemId': ?1}")   
// 첫번째 0 두번째 1 감사합니다~
	public List<ChatRoomVO> findByUserIdAndItemId(String userId,int itemId);

@Query("{$or :[{'userId':?0},{'itemId':?1}]}")
public List<ChatRoomVO> findByUserIdOrItemId(String userId,int itemId);

public ChatRoomVO findItemIdByChatRoomId(Long chatRoomId);

@Query("{$or :[{'userId':?0},{'sellerId':?1}]}")
public List<ChatRoomVO> findChatRoomByUserIdHeader(String userId,String sellerId);

@Query("{'itemId': ?0}")   
 
	public List<ChatRoomVO> findChatCount(int itemId);


}
 
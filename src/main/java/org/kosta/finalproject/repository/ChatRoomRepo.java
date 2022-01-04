package org.kosta.finalproject.repository;

import java.util.List;

import org.kosta.finalproject.model.domain.ChatRoomVO;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

public interface ChatRoomRepo  extends MongoRepository<ChatRoomVO,String>{
@Query("{'userId': ?0, 'itemId': ?1}")   
// 첫번째 0 두번째 1 감사합니다~
	public List<ChatRoomVO> findByUserIdAndItemId(String userId,int itemId);
//hotfix version2
// db.chatRoomVO.find({$and:[{$or:[{"userId":"1234"},{"sellerId":"1234"}]},{"itemId":64}]})

@Query("{$and:[{$or:[{'userId':?0},{'sellerId':?1}]},{'itemId':?2}]}")
	public ChatRoomVO findByUserIdOrSellerIdAndItemId(String userId,String sellerId,int itemId);

@Query("{$or :[{'userId':?0},{'itemId':?1}]}")
public List<ChatRoomVO> findByUserIdOrItemId(String userId,int itemId);

public ChatRoomVO findChatRoomVOIdByChatRoomId(Long chatRoomId);

@Query("{$or :[{'userId':?0},{'sellerId':?1}]}")
public List<ChatRoomVO> findChatRoomByUserIdHeader(String userId,String sellerId);

@Query("{'itemId': ?0}")   
 
	public List<ChatRoomVO> findChatCount(int itemId);
//itemId와 sellerId로 ChatRoomVO찾기
@Query("{$and:[{'itemId':?0}, {'sellerId':?1}]}")
public ChatRoomVO findChatRoomVOByItemIdAndSellerId(int itemId,String sellerId);

@Query("{$and:[{'itemId':?0}, {'userId':?1}]}")
public ChatRoomVO findChatRoomVOByItemIdAndUserId(int itemId,String userId);
}
 
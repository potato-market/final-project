package org.kosta.finalproject.model.service;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.kosta.finalproject.model.domain.ChatMessage;
import org.kosta.finalproject.model.domain.ChatRoomVO;
import org.kosta.finalproject.repository.ChatMessageRepository;
import org.kosta.finalproject.repository.ChatRoomRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

 
@Repository
public class ChattingServiceImpl implements ChattingService{
	@Autowired
	private ChatMessageRepository cmr;
	@Autowired
	private ChatRoomRepo crp;
	
	private List<ChatMessage> list;
	
	private ChatRoomVO cvo;
	@Autowired
	private SequenceService sequence;
	@Autowired
	private CounterService counter;
 
	@Override
	public List<ChatMessage> findByChatRoomId(long chatRoomId) {
		// TODO Auto-generated method stub		
//		System.out.println("Error check"+chatRoomId);
		list = cmr.findByChatRoomId(chatRoomId);
//		System.out.println("chatRoomId 로 채팅 정보가져오기 성공");
//		for(int i=0;i<list.size();i++)System.out.println(list.get(i).toString());
		return list;
	}
	
	public Long createChatRoom(int itemId,String userId,String sellerId) {
		//중복 체크 진행
 
//		System.out.println("c	cvo=(ChatRoomVO) reateChatRoom"+itemId+userId);
		Long chatRoomId=null;
		System.out.println("method createChatRoom running");
		if(crp.findByUserIdOrSellerIdAndItemId(userId, userId, itemId)==null) {
			
//			System.out.println("중복결과 없음");
			//중복 확인 결과 비어있음
//			public ChatRoomVO(long chatRoomId, String userId, String sellerId, int itemId) {
			System.out.println("createRoom start");
			System.out.println(crp.findByUserIdOrSellerIdAndItemId(userId, sellerId, itemId));
			cvo=new ChatRoomVO(sequence.getNextSequenceId("hosting"),userId,sellerId, itemId);
//			System.out.println("시콴스 실행");
//			sequenceDAO.getNextSequenceId("hosting");
			
//			System.out.println("시콴스 저장완료");
			//cvo insert 시퀀스 자동생성
			crp.insert(cvo);
			chatRoomId=cvo.getChatRoomId();
			
//			System.out.println("sequence ChatRoomId"+cvo.getChatRoomId());
			
		}else {
			//result_message="이미 중복된 채팅방 있음" 
//			System.out.println("중복된 채팅방 있음");
			//userId와 sellerId가 같은경우 발생 판매자의 경우 메세지 센더의 아이디를 가져와야함
			
			chatRoomId=crp.findByUserIdOrSellerIdAndItemId(userId, userId, itemId).getChatRoomId();
			System.out.println(chatRoomId);
			
		
		}

		return chatRoomId;
	}
	
	public Map<String, List<ChatMessage>> findListByUserId(int itemId,String userId){
//		System.out.println("findListByUserId");	
		//ChatRoomId 조회 userId와 itemId  AND 조회
//		 crp.findByUserIdOrItemId(userId, itemId); --> error 원인 userId일 경우에만 불러옴 그러므로 sellerId일때 값 줄어들음
		List <ChatRoomVO> crlist = crp.findChatRoomByUserIdHeader(userId,userId);
		System.out.println("시발"+crlist);
		Map <String,List<ChatMessage>> map = new HashMap<String,List<ChatMessage>>();
		
		LocalDateTime now = LocalDateTime.now();
		String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

//		Map <Long,ChatMessage> map = new HashMap<Long,ChatMessage>();
		long chatRoomId;
		//ChatMessage Content
		for(int i=0;i<crlist.size();i++) {
			System.out.println(crlist.get(i).toString());
			chatRoomId=crlist.get(i).getChatRoomId();
//			map.put(chatRoomId, cmr.findByChatRoomId(chatRoomId));
//			System.out.println(chatRoomId);
//			System.out.println(cmr.findByChatRoomId(chatRoomId));
			if(cmr.findByChatRoomId(chatRoomId).isEmpty()) {
//			비어있으면 //map.put(Long.toString(chatRoomId), cmr.findByChatRoomId(chatRoomId));
					cmr.insert(new ChatMessage(chatRoomId, " ",formatedNow));
			}
			map.put(Long.toString(chatRoomId), cmr.findByChatRoomId(chatRoomId));
			
		}
//		System.out.println("출력"+map);
				
		
		return map;
	}
//	
//	public List<ItemVO> findItemByItemId(String itemId){
//		
//	}

	@Override
	public List<ChatMessage> chatSort(List<ChatMessage> chatmessagelist) {
		// TODO Auto-generated method stub
		
		 SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		try {
			for(int i=0;i<chatmessagelist.size();i++) {
			for(int j=i+1;j<chatmessagelist.size();j++) {
				if(sf.parse(chatmessagelist.get(i).getUpdateAt()).after(sf.parse(chatmessagelist.get(j).getUpdateAt()))) 
				{
					Collections.swap(chatmessagelist, i, j);
//					System.out.println("순서 정렬");
				}
			}
		}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		
		return chatmessagelist;
	}

	@Override
	public ChatRoomVO findChatRoomVOIdByChatRoomId(Long chatRoomId) {
		// TODO Auto-generated method stub
		return crp.findChatRoomVOIdByChatRoomId(chatRoomId);
	}
	
	//item Id로 챗룸 아이디 를 갖고옴
	@Override
	public Map<String, List<ChatMessage>> findListByUserIdHeader(String userId){
//		System.out.println("findListByUserId");	
		//ChatRoomId 조회 userId 와 sellerId 둘중 하나만 있어도 출력 
		List <ChatRoomVO> crlist = crp.findChatRoomByUserIdHeader(userId, userId);
		System.out.println("시발 여기서 sellid userId 바꿔"+crlist);
		Map <String,List<ChatMessage>> map = new HashMap<String,List<ChatMessage>>();
//		Map <Long,ChatMessage> map = new HashMap<Long,ChatMessage>();
		long chatRoomId;
		//ChatMessage Content
		for(int i=0;i<crlist.size();i++) {
//			System.out.println(crlist.get(i).toString());
			chatRoomId=crlist.get(i).getChatRoomId();
//			map.put(chatRoomId, cmr.findByChatRoomId(chatRoomId));
//			System.out.println(chatRoomId);
//			System.out.println(cmr.findByChatRoomId(chatRoomId));
			map.put(Long.toString(chatRoomId), cmr.findByChatRoomId(chatRoomId));
//			map.put(chatRoomId, cmr.findByChatRoomId(chatRoomId));
			
		}
		System.out.println("출력"+map);
				
		
		return map;
	}

	@Override
	public int getChatCount(int itemId) {
		// TODO Auto-generated method stub
		int crnum=crp.findChatCount(itemId).size();
		return crnum;
	}

	@Override
	public ChatRoomVO findChatRoomVOBySellerIdAndItemId(int itemId, String sellerId) {
		// TODO Auto-generated method stub
		System.out.println("sellerId findChatRoomVOBySellerIdAndItemId"+sellerId);
		System.out.println(crp.findChatRoomVOByItemIdAndSellerId(itemId,sellerId));
		return crp.findChatRoomVOByItemIdAndSellerId(itemId,sellerId);
//		return crp.findChatRoomVOByItemIdAndUserId(itemId,sellerId);
	}

	@Override
	public ChatRoomVO findChatRoomVOByUserIdAndItemId(int itemId, String userId) {
		// TODO Auto-generated method stub
		System.out.println("userId findChatRoomVOByUserIdAndItemId:"+userId);	
		System.out.println(crp.findChatRoomVOByItemIdAndUserId(itemId,userId));
		return crp.findChatRoomVOByItemIdAndUserId(itemId,userId);
//		return crp.findChatRoomVOByItemIdAndSellerId(itemId,userId);
	}

	

}

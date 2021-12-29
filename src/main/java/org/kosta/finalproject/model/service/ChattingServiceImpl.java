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
		System.out.println("Error check"+chatRoomId);
		list = cmr.findByChatRoomId(chatRoomId);
		System.out.println("chatRoomId 로 채팅 정보가져오기 성공");
//		for(int i=0;i<list.size();i++)System.out.println(list.get(i).toString());
		return list;
	}
	
	public Long createChatRoom(int itemId,String userId,String sellerId) {
		//중복 체크 진행
 
		System.out.println("c	cvo=(ChatRoomVO) reateChatRoom"+itemId+userId);
		Long chatRoomId;
		if(crp.findByUserIdAndItemId(userId, itemId).isEmpty()) {
			System.out.println("중복결과 없음");
			//중복 확인 결과 비어있음
//			public ChatRoomVO(long chatRoomId, String userId, String sellerId, int itemId) {
			
			cvo=new ChatRoomVO(sequence.getNextSequenceId("hosting"),userId,sellerId, itemId);
			System.out.println("시콴스 실행");
//			sequenceDAO.getNextSequenceId("hosting");
			
			System.out.println("시콴스 저장완료");
			//cvo insert 시퀀스 자동생성
			crp.insert(cvo);
			chatRoomId=cvo.getChatRoomId();
			
			System.out.println("sequence ChatRoomId"+cvo.getChatRoomId());
			
		}else {
			//result_message="이미 중복된 아이디가 있음" 
			System.out.println("중복된 아이디가 있음");
			List<ChatRoomVO> crlist=crp.findByUserIdAndItemId(userId, itemId);
			chatRoomId=crlist.get(0).getChatRoomId();
			
		
		}

		return chatRoomId;
	}
	
	public Map<String, List<ChatMessage>> findListByUserId(int itemId,String userId){
		System.out.println("findListByUserId");	
		
		
		
		//ChatRoomId 조회
		List <ChatRoomVO> crlist = crp.findByUserIdOrItemId(userId, itemId);
//		System.out.println("시발"+crlist);
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
			System.out.println(chatRoomId);
			System.out.println(cmr.findByChatRoomId(chatRoomId));
			if(cmr.findByChatRoomId(chatRoomId).isEmpty()) {
//			비어있으면 //map.put(Long.toString(chatRoomId), cmr.findByChatRoomId(chatRoomId));
					cmr.insert(new ChatMessage(chatRoomId, " ",formatedNow));
			}
			map.put(Long.toString(chatRoomId), cmr.findByChatRoomId(chatRoomId));
			
		}
		System.out.println("출력"+map);
				
		
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
					System.out.println("순서 정렬");
				}
			}
		}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		
		return chatmessagelist;
	}

	@Override
	public ChatRoomVO findItemIdByChatRoomId(Long chatRoomId) {
		// TODO Auto-generated method stub
		
		
		return crp.findItemIdByChatRoomId(chatRoomId);
	}
	
	//item Id로 챗룸 아이디 를 갖고옴
	@Override
	public Map<String, List<ChatMessage>> findListByUserIdHeader(String userId){
		System.out.println("findListByUserId");	
		//ChatRoomId 조회
		List <ChatRoomVO> crlist = crp.findChatRoomByUserIdHeader(userId, userId);
		System.out.println("시발"+crlist);
		Map <String,List<ChatMessage>> map = new HashMap<String,List<ChatMessage>>();
//		Map <Long,ChatMessage> map = new HashMap<Long,ChatMessage>();
		long chatRoomId;
		//ChatMessage Content
		for(int i=0;i<crlist.size();i++) {
			System.out.println(crlist.get(i).toString());
			chatRoomId=crlist.get(i).getChatRoomId();
//			map.put(chatRoomId, cmr.findByChatRoomId(chatRoomId));
			System.out.println(chatRoomId);
			System.out.println(cmr.findByChatRoomId(chatRoomId));
			 
			map.put(Long.toString(chatRoomId), cmr.findByChatRoomId(chatRoomId));
			
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

	

}

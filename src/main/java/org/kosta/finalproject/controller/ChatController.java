package org.kosta.finalproject.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.javassist.expr.NewArray;
import org.kosta.finalproject.model.domain.ChatMessage;
import org.kosta.finalproject.model.domain.ChatRoomVO;
import org.kosta.finalproject.model.domain.ImageVO;
import org.kosta.finalproject.model.domain.ItemVO;
import org.kosta.finalproject.model.domain.UserVO;
import org.kosta.finalproject.model.service.ChattingService;
import org.kosta.finalproject.model.service.CounterService;
import org.kosta.finalproject.model.service.ItemService;
import org.kosta.finalproject.model.service.UserService;
import org.kosta.finalproject.repository.ChatMessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ChatController {
	@Autowired
	private ChatMessageRepository CMR;
	@Autowired
	private CounterService counterService;

	@Autowired
	private ChattingService chattingService;

	@Autowired
	private ItemService itemService;
	@Autowired
	private UserService userService;

	private static final String HOSTING_SEQ_KEY = "userid";

	@MessageMapping("/chat.register.{chatRoomId}")
//	@MessageMapping("/chat.register")
	@SendTo("/topic/public/{chatRoomId}/")
//	@SendTo("/topic/public/")
	public ChatMessage register(@Payload ChatMessage chatMessage, SimpMessageHeaderAccessor headerAccessor) {

		headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
		return chatMessage;
	}

	@MessageMapping("/chat.send.{chatRoomId}")
	@SendTo("/topic/public/{chatRoomId}/")
	public ChatMessage sendMessage(@Payload ChatMessage chatMessage, String chatRoomId) {
		ChatMessage chatmsg = new ChatMessage();
		List<ChatMessage> chatList;
		/* 세션값 넘오오면 삭제 */

		/* HttpSession curUser=request.getSession(); */
		// int to = Integer.parseInt(from);
		if (chatMessage.getType().toString() == "CHAT") {
			System.out.println(chatMessage.getType());
			LocalDateTime now = LocalDateTime.now();
			String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

			chatmsg.setIndex(counterService.getNextSequenceId(HOSTING_SEQ_KEY));

			chatmsg.setSender(chatMessage.getSender());
			chatmsg.setContent(chatMessage.getContent());
			chatmsg.setChatRoomId(chatMessage.getChatRoomId());
			chatmsg.setUpdateAt(formatedNow);
//			CMR.insert("getNextSequence('userid')");
			CMR.insert(chatmsg);
			System.out.println("finished");
		} else if (chatMessage.getType().toString() == "JOIN") {
			// 조건 방번호 가 n 번인 방
//			System.out.println("JOIN ChatRoomId"+chatMessage.toString());
//			int chatRNo=chatMessage.getChatRoomId();
//			List<ChatMessage> list = CMR.findByChatRoomId(chatRNo);
//			for(int i=0;i<list.size();i++)
//			System.out.println(list.get(i).toString());

		}

		return chatMessage;
	}

	@RequestMapping("chatForm")
	public String chatForm(ChatRoomVO chatroomVO, Model model) throws ParseException {
//		2022 01 22 채팅폼 으로 들어갈때 채팅 리스트 에러 
//		헤더-> 채팅 리스트 클릭시 채팅 이미지 내용 전부 수정
//		chatForm 도 user정보 수정 해줘야댐
//		error shooting - userId 가 sellerId일 때 itemlist 에서 제외 됨
		/*
		 * 1. 
		*/
		System.out.println("chatForm start");
		System.out.println(chatroomVO.toString());
		int itemId = chatroomVO.getItemId();
		String userId = chatroomVO.getUserId();
		String sellerId = chatroomVO.getSellerId();
		Long chatRoomId = chatroomVO.getChatRoomId();
		System.out.println(userId + itemId + sellerId + chatRoomId);

		// 생성된 ChatRoomId가져오기 ,혹은 이미 있는 ChatRoomId 가져오기
		if (chatRoomId == 0) {
			chatRoomId = chattingService.createChatRoom(itemId, userId, sellerId);
		}
		System.out.println("create chatRoom after chatRoomId =>"+chatRoomId);
		
		
		// 만약 userId와 sellerId 가 같은 경우
//		if (userId.equals(sellerId)) {
//			System.out.println("동일");
//			// chatRoomId로 chatRoomVO Collection에 저장되어 있는 채팅방 정보 값 가져오기
//			sellerId = chattingService.findChatRoomVOIdByChatRoomId(chatRoomId).getSellerId();
//		}
		model.addAttribute("itemId",itemId);
		model.addAttribute("userId", userId);
		model.addAttribute("chatRoomId", chatRoomId);
		System.out.println("Controller" + chatRoomId);
		model.addAttribute("chatHistory", chattingService.findByChatRoomId(chatRoomId));

		Map<String, List<ChatMessage>> map = chattingService.findListByUserId(itemId, userId);
//     	map.get(Long.toString(chatRoomId));

		System.out.println(map + "++++++++++++++");

		List<ChatMessage> chatmessagelist = new ArrayList<ChatMessage>();
//     	Map <String,ItemVO> itemchatmap=new HashMap<String, ItemVO>();
		List<ItemVO> itemchatlist = new ArrayList<ItemVO>();

		Iterator<String> keys = map.keySet().iterator();
		while (keys.hasNext()) {
			String key = keys.next();
			String content = map.get(key).get(map.get(key).size() - 1).getContent();
			String updateAt = map.get(key).get(map.get(key).size() - 1).getUpdateAt();

			itemchatlist.add(itemService
					.selectItemByItemId(chattingService.findChatRoomVOIdByChatRoomId(Long.parseLong(key)).getItemId()));
			chatmessagelist.add(new ChatMessage(Long.parseLong(key), content, updateAt));
		}
		System.out.println("itemlist" + itemchatlist);
		// sort 한번 하고 가죠
		System.out.println("sort전" + chatmessagelist);

//     	chatmessagelist=chattingService.chatSort(chatmessagelist);

		SimpleDateFormat sf = new SimpleDateFormat("YYYY-MM-DD hh:mm:ss");
		System.out.println(chatmessagelist.size() + "  챗리스트 사이즈");
		for (int i = 0; i < chatmessagelist.size(); i++) {
			for (int j = i + 1; j < chatmessagelist.size(); j++) {
				if (sf.parse(chatmessagelist.get(i).getUpdateAt())
						.before(sf.parse(chatmessagelist.get(j).getUpdateAt()))) {
					Collections.swap(chatmessagelist, i, j);
					System.out.println("순서 정렬");
				}
			}
		}
     	System.out.println("sort후"+chatmessagelist);
     	System.out.println("sort후"+itemchatlist);
// ItemVO test
//     	System.out.println("ItemVO:"+itemchatlist.toString());
		List<String> itemimglist = new ArrayList<String>();
		List<String> userimglist = new ArrayList<String>();
		List<UserVO> chatpartnerlist= new ArrayList<UserVO>();

		// need userId And sellerId check
		/*
		 * for (int i = 0; i < itemchatlist.size(); i++) { itemimglist.add( //
		 * itemService.findItemImageListByItemId( // itemchatlist.get(i).getItemId() //
		 * ).get(0).getImageName()
		 * itemService.findItemImageVOByItemId(itemchatlist.get(i).getItemId()).
		 * getImageName());
		 * userimglist.add(userService.findUserById(itemchatlist.get(i).getUserVO().
		 * getUserId()).getUserImage());
		 * 
		 * }
		 */
		
		for (int i = 0; i < itemchatlist.size(); i++) {
			itemimglist.add(itemService.findItemImageVOByItemId(itemchatlist.get(i).getItemId()).getImageName());
			
			if (itemchatlist.get(i).getUserVO().getUserId().equals(userId)) {
				// 상대방 UserVO 에 대한 userId 찾기
				userimglist.add(userService
						.findUserById(chattingService
								.findChatRoomVOBySellerIdAndItemId(itemchatlist.get(i).getItemId(), userId).getUserId())
						.getUserImage());
				// 상대방 UserVO로 바꿔주기 리펙토링 필요 --=> 상대방 UserVO를 새로운 리스트에 담아서 리퀘스트보낸다
				//ChatRoomVO 객체의 userId값 가져옴 userId 
				chatpartnerlist.add(userService.findUserById(chattingService
						 .findChatRoomVOBySellerIdAndItemId(itemchatlist.get(i).getItemId(),userId).getUserId())							
						);
				/*
				 * itemchatlist.get(i).setUserVO(userService.findUserById(chattingService
				 * .findChatRoomVOBySellerIdAndItemId(itemchatlist.get(i).getItemId(),
				 * userId).getUserId()));
				 */
			} else {
				userimglist.add(userService.findUserById(itemchatlist.get(i).getUserVO().getUserId()).getUserImage());
				chatpartnerlist.add(
						
					userService.findUserById(
							// sellerId 에 대한 정보 필요
							chattingService.findChatRoomVOByUserIdAndItemId(itemchatlist.get(i).getItemId(),userId)						 
						.getUserId())							
						);
			}

		}
		System.out.println("check plz"+chatpartnerlist);
		
		model.addAttribute("chatpartnerlist",chatpartnerlist);
		
		// 유저 확인을 위한 리스트

		// item이미지
		model.addAttribute("itemimglist", itemimglist);
		// 해당 유저 이미지
		model.addAttribute("userimglist", userimglist);
		// 채팅방 아이템 정보
		model.addAttribute("itemchatlist", itemchatlist);
		// 채팅 메세지
		model.addAttribute("chatmessagelist", chatmessagelist);
		// 해당 아이템에 대한 아이템 정보
		return "chat/chatting";

	}

	@RequestMapping("headerChatForm")
	public String headerChatForm(String userId, Model model) throws ParseException {
		/*
		 * userId를 통해 해당 유저가 갖고 있는 itemId 를 갖고 온다. itemId를 통해 채팅방 찾기 itemId and (userId
		 * or sellerId(userId)) 리턴 value :chatRoomId / userId 를 넣었을때 해결
		 * 
		 */
		System.out.println("Header Access ChatForm" + userId);
		// 해당 유저가 갖고 있는 유저 아이디로 테스트
		boolean flag = false;
		model.addAttribute("userId", userId);

		// 내가 갖고 있는 상품아이디 리스트 + userId로 검색
		Map<String, List<ChatMessage>> map = chattingService.findListByUserIdHeader(userId);
		System.out.println(map);
		List<ChatMessage> chatmessagelist = new ArrayList<ChatMessage>();
//     	Map <String,ItemVO> itemchatmap=new HashMap<String, ItemVO>();
		List<ItemVO> itemchatlist = new ArrayList<ItemVO>();
		Iterator<String> keys = map.keySet().iterator();

		while (keys.hasNext()) {
			String key = keys.next();
			// get chatting content by ChatRoomId
			String content = map.get(key).get(map.get(key).size() - 1).getContent();
			// get chatting updateAt by ChatRoomId
			String updateAt = map.get(key).get(map.get(key).size() - 1).getUpdateAt();
			System.out.println("**********" + key);

			// get
			itemchatlist.add(itemService
					.selectItemByItemId(chattingService.findChatRoomVOIdByChatRoomId(Long.parseLong(key)).getItemId()));

//          itemchatmap.put(key, itemService.selectItemByItemId(
//          chattingService.findItemIdByChatRoomId(Long.parseLong(key)).getItemId()
			System.out.println("itemlist" + itemchatlist);
			// 채팅테스트
			System.out.println("*******hot test->"
					+ chattingService.findChatRoomVOIdByChatRoomId(Long.parseLong(key)).getItemId());
			System.out.println("*******hot test2->" + itemService
					.selectItemByItemId(chattingService.findChatRoomVOIdByChatRoomId(Long.parseLong(key)).getItemId()));

			chatmessagelist.add(new ChatMessage(Long.parseLong(key), content, updateAt));
		}
		// sort 한번 하고 가죠
		System.out.println("sort전" + chatmessagelist);

		SimpleDateFormat sf = new SimpleDateFormat("YYYY-MM-DD hh:mm:ss");
		System.out.println(chatmessagelist.size() + "  챗리스트 사이즈");
		for (int i = 0; i < chatmessagelist.size(); i++) {
			for (int j = i + 1; j < chatmessagelist.size(); j++) {
				if (sf.parse(chatmessagelist.get(i).getUpdateAt())
						.before(sf.parse(chatmessagelist.get(j).getUpdateAt()))) {
					Collections.swap(chatmessagelist, i, j);
					System.out.println("순서 정렬");
				}
			}
		}

		System.out.println("sort후" + chatmessagelist);

		// ItemVO test
//     	System.out.println("ItemVO:"+itemchatlist.toString());

		List<String> itemimglist = new ArrayList<String>();
		List<String> userimglist = new ArrayList<String>();
		List<UserVO> chatpartnerlist= new ArrayList<UserVO>();
		/*
		 * hotfix issue : chatRoomId를 통한 본인이 아닌 상대방 의 정보를 갖어와야함 userId(Session) is
		 * sellerId ? =>상대방에 대한정보
		 */
		// itemchatlist 에대한 아이템
		for (int i = 0; i < itemchatlist.size(); i++) {
			itemimglist.add(itemService.findItemImageVOByItemId(itemchatlist.get(i).getItemId()).getImageName());
			
			if (itemchatlist.get(i).getUserVO().getUserId().equals(userId)) {
				// 상대방 UserVO 에 대한 userId 찾기
				userimglist.add(userService
						.findUserById(chattingService
								.findChatRoomVOBySellerIdAndItemId(itemchatlist.get(i).getItemId(), userId).getUserId())
						.getUserImage());
				// 상대방 UserVO로 바꿔주기 리펙토링 필요 --=> 상대방 UserVO를 새로운 리스트에 담아서 리퀘스트보낸다
				//ChatRoomVO 객체의 userId값 가져옴 userId 
				chatpartnerlist.add(userService.findUserById(chattingService
						 .findChatRoomVOBySellerIdAndItemId(itemchatlist.get(i).getItemId(),userId).getUserId())							
						);
				/*
				 * itemchatlist.get(i).setUserVO(userService.findUserById(chattingService
				 * .findChatRoomVOBySellerIdAndItemId(itemchatlist.get(i).getItemId(),
				 * userId).getUserId()));
				 */
			} else {
				userimglist.add(userService.findUserById(itemchatlist.get(i).getUserVO().getUserId()).getUserImage());
				chatpartnerlist.add(
						
					userService.findUserById(
							// sellerId 에 대한 정보 필요
							chattingService.findChatRoomVOByUserIdAndItemId(itemchatlist.get(i).getItemId(),userId)						 
						.getUserId())							
						);
			}

		}
		model.addAttribute("chatpartnerlist",chatpartnerlist);
		model.addAttribute("itemimglist", itemimglist);
		model.addAttribute("userimglist", userimglist);
		model.addAttribute("itemchatlist", itemchatlist);
		model.addAttribute("chatmessagelist", chatmessagelist);
		model.addAttribute("cflag", flag);

		// 해당 아이템에 대한 아이템 정보
		return "chat/chatting";
	}

//	@Bean //어플리케이션 런타임실행시 같이 실행되는 함숨
//	public ApplicationRunner applicationRunner() {
//		return args ->{};0}
}
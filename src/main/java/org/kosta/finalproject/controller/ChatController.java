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
		/* ????????? ???????????? ?????? */

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
			// ?????? ????????? ??? n ?????? ???
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
//		2022 01 22 ????????? ?????? ???????????? ?????? ????????? ?????? 
//		??????-> ?????? ????????? ????????? ?????? ????????? ?????? ?????? ??????
//		chatForm ??? user?????? ?????? ????????????
//		error shooting - userId ??? sellerId??? ??? itemlist ?????? ?????? ???
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

		// ????????? ChatRoomId???????????? ,?????? ?????? ?????? ChatRoomId ????????????
		if (chatRoomId == 0) {
			chatRoomId = chattingService.createChatRoom(itemId, userId, sellerId);
		}
		System.out.println("create chatRoom after chatRoomId =>"+chatRoomId);
		
		
		// ?????? userId??? sellerId ??? ?????? ??????
//		if (userId.equals(sellerId)) {
//			System.out.println("??????");
//			// chatRoomId??? chatRoomVO Collection??? ???????????? ?????? ????????? ?????? ??? ????????????
//			sellerId = chattingService.findChatRoomVOIdByChatRoomId(chatRoomId).getSellerId();
//		}
		model.addAttribute("itemId",itemId);
		model.addAttribute("userIdC", userId);
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
		// sort ?????? ?????? ??????
		System.out.println("sort???" + chatmessagelist);

//     	chatmessagelist=chattingService.chatSort(chatmessagelist);

		SimpleDateFormat sf = new SimpleDateFormat("YYYY-MM-DD hh:mm:ss");
		System.out.println(chatmessagelist.size() + "  ???????????? ?????????");
		for (int i = 0; i < chatmessagelist.size(); i++) {
			for (int j = i + 1; j < chatmessagelist.size(); j++) {
				if (sf.parse(chatmessagelist.get(i).getUpdateAt())
						.before(sf.parse(chatmessagelist.get(j).getUpdateAt()))) {
					Collections.swap(chatmessagelist, i, j);
					System.out.println("?????? ??????");
				}
			}
		}
     	System.out.println("sort???"+chatmessagelist);
     	System.out.println("sort???"+itemchatlist);
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
				// ????????? UserVO ??? ?????? userId ??????
				userimglist.add(
						userService.findUserById(
								chattingService.findChatRoomVOBySellerIdAndItemId(
										itemchatlist.get(i).getItemId()
										, userId).getUserId())
						.getUserImage());
				// ????????? UserVO??? ???????????? ???????????? ?????? --=> ????????? UserVO??? ????????? ???????????? ????????? ?????????????????????
				//ChatRoomVO ????????? userId??? ????????? userId 
				chatpartnerlist.add(
						userService.findUserById(
						chattingService.findChatRoomVOBySellerIdAndItemId(itemchatlist.get(i).getItemId(),userId).getUserId())							
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
							// sellerId ??? ?????? ?????? ??????
							chattingService.findChatRoomVOByUserIdAndItemId(itemchatlist.get(i).getItemId(),userId)						 
						.getSellerId())							
						);
			}

		}
		System.out.println("check plz"+chatpartnerlist);
		
		model.addAttribute("chatpartnerlist",chatpartnerlist);
		
		// ?????? ????????? ?????? ?????????

		// item?????????
		model.addAttribute("itemimglist", itemimglist);
		// ?????? ?????? ?????????
		model.addAttribute("userimglist", userimglist);
		// ????????? ????????? ??????
		model.addAttribute("itemchatlist", itemchatlist);
		// ?????? ?????????
		model.addAttribute("chatmessagelist", chatmessagelist);
		// ?????? ???????????? ?????? ????????? ??????
		return "chat/chatting";

	}

	@RequestMapping("headerChatForm")
	public String headerChatForm(String userId, Model model) throws ParseException {
		/*
		 * userId??? ?????? ?????? ????????? ?????? ?????? itemId ??? ?????? ??????. itemId??? ?????? ????????? ?????? itemId and (userId
		 * or sellerId(userId)) ?????? value :chatRoomId / userId ??? ???????????? ??????
		 * 
		 */
		System.out.println("Header Access ChatForm" + userId);
		// ?????? ????????? ?????? ?????? ?????? ???????????? ?????????
		boolean flag = false;
		model.addAttribute("userId", userId);

		// ?????? ?????? ?????? ??????????????? ????????? + userId??? ??????
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
			// ???????????????
			System.out.println("*******hot test->"
					+ chattingService.findChatRoomVOIdByChatRoomId(Long.parseLong(key)).getItemId());
			System.out.println("*******hot test2->" + itemService
					.selectItemByItemId(chattingService.findChatRoomVOIdByChatRoomId(Long.parseLong(key)).getItemId()));

			chatmessagelist.add(new ChatMessage(Long.parseLong(key), content, updateAt));
		}
		// sort ?????? ?????? ??????
		System.out.println("sort???" + chatmessagelist);

		SimpleDateFormat sf = new SimpleDateFormat("YYYY-MM-DD hh:mm:ss");
		System.out.println(chatmessagelist.size() + "  ???????????? ?????????");
		for (int i = 0; i < chatmessagelist.size(); i++) {
			for (int j = i + 1; j < chatmessagelist.size(); j++) {
				if (sf.parse(chatmessagelist.get(i).getUpdateAt())
						.before(sf.parse(chatmessagelist.get(j).getUpdateAt()))) {
					Collections.swap(chatmessagelist, i, j);
					System.out.println("?????? ??????");
				}
			}
		}

		System.out.println("sort???" + chatmessagelist);

		// ItemVO test
//     	System.out.println("ItemVO:"+itemchatlist.toString());

		List<String> itemimglist = new ArrayList<String>();
		List<String> userimglist = new ArrayList<String>();
		List<UserVO> chatpartnerlist= new ArrayList<UserVO>();
		/*
		 * hotfix issue : chatRoomId??? ?????? ????????? ?????? ????????? ??? ????????? ??????????????? userId(Session) is
		 * sellerId ? =>???????????? ????????????
		 */
		// itemchatlist ????????? ?????????
		for (int i = 0; i < itemchatlist.size(); i++) {
			itemimglist.add(itemService.findItemImageVOByItemId(itemchatlist.get(i).getItemId()).getImageName());
			
			if (itemchatlist.get(i).getUserVO().getUserId().equals(userId)) {
				// ????????? UserVO ??? ?????? userId ??????
				userimglist.add(userService
						.findUserById(chattingService
								.findChatRoomVOBySellerIdAndItemId(itemchatlist.get(i).getItemId(), userId).getUserId())
						.getUserImage());
				// ????????? UserVO??? ???????????? ???????????? ?????? --=> ????????? UserVO??? ????????? ???????????? ????????? ?????????????????????
				//ChatRoomVO ????????? userId??? ????????? userId 
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
							// sellerId ??? ?????? ?????? ??????
							chattingService.findChatRoomVOByUserIdAndItemId(itemchatlist.get(i).getItemId(),userId)						 
						.getSellerId())							
						);
			}

		}
		model.addAttribute("chatpartnerlist",chatpartnerlist);
		model.addAttribute("itemimglist", itemimglist);
		model.addAttribute("userimglist", userimglist);
		model.addAttribute("itemchatlist", itemchatlist);
		model.addAttribute("chatmessagelist", chatmessagelist);
		model.addAttribute("cflag", flag);

		// ?????? ???????????? ?????? ????????? ??????
		return "chat/chatting";
	}

//	@Bean //?????????????????? ?????????????????? ?????? ???????????? ??????
//	public ApplicationRunner applicationRunner() {
//		return args ->{};0}
}
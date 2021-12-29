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
		/* 세션값 넘오오면 삭제*/
		
		/* HttpSession curUser=request.getSession(); */
		// int to = Integer.parseInt(from);
		if (chatMessage.getType().toString()=="CHAT") {
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
		} 			
		else if (chatMessage.getType().toString() == "JOIN")				  
		{
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
		System.out.println(chatroomVO.toString());
		int itemId=chatroomVO.getItemId();
		String userId= chatroomVO.getUserId();
		String sellerId=chatroomVO.getSellerId();
				
		
		//생성된 ChatRoomId가져오기 ,혹은 이미 있는 ChatRoomId 가져오기
		Long chatRoomId=chattingService.createChatRoom(itemId,userId,sellerId);
		model.addAttribute("userId", userId);
		model.addAttribute("chatRoomId",chatRoomId);
		System.out.println("Controller"+chatRoomId);
     	model.addAttribute("chatHistory",chattingService.findByChatRoomId(chatRoomId));
     	
     	
     	Map<String,List<ChatMessage>> map=  chattingService.findListByUserId(itemId, userId);
//     	map.get(Long.toString(chatRoomId));
     	
     	System.out.println(map+"++++++++++++++");
     	
     	List <ChatMessage> chatmessagelist=new ArrayList<ChatMessage>();
//     	Map <String,ItemVO> itemchatmap=new HashMap<String, ItemVO>();
     	List <ItemVO> itemchatlist = new ArrayList<ItemVO>();
     	
     	Iterator<String> keys = map.keySet().iterator();
     	while( keys.hasNext() ){
            String key = keys.next();
           String content=map.get(key).get(map.get(key).size()-1).getContent();
           String updateAt=map.get(key).get(map.get(key).size()-1).getUpdateAt();
            
            
            
     
           itemchatlist.add(itemService.selectItemByItemId(
            		chattingService.findItemIdByChatRoomId(Long.parseLong(key)).getItemId()));
           
//            itemchatmap.put(key, itemService.selectItemByItemId(
//            		chattingService.findItemIdByChatRoomId(Long.parseLong(key)).getItemId()
//           System.out.println("*******hot test2->"+itemService.selectItemByItemId(
//            		chattingService.findItemIdByChatRoomId(Long.parseLong(key)).getItemId()
//            ));

            chatmessagelist.add(new ChatMessage(Long.parseLong(key),content,updateAt));
            
        }
     	
     	 System.out.println("itemlist"+itemchatlist);
         //채팅테스트
    
     	
     	//sort 한번 하고 가죠
     	System.out.println("sort전"+chatmessagelist);
     	
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
		 
		
		
//     	System.out.println("sort후"+chatmessagelist);
        
     	//ItemVO test 
//     	System.out.println("ItemVO:"+itemchatlist.toString());
     	List<String> itemimglist=new ArrayList<String>();
     	List<String> userimglist=new ArrayList<String>();
     	for(int i=0;i<itemchatlist.size();i++) {
     		itemimglist.add(itemService.findItemImageListByItemId(
     				itemchatlist.get(i).getItemId()
     				).get(0).getImageName()
     		);
     		userimglist.add(userService.findUserById(
     				itemchatlist.get(i).getUserVO().getUserId()
     				).getUserImage());
     		
     		
     	}
     	
     	model.addAttribute("itemimglist",itemimglist);
     	model.addAttribute("userimglist",userimglist);
     	model.addAttribute("itemchatlist",itemchatlist);
		model.addAttribute("chatmessagelist", chatmessagelist);
		//해당 아이템에 대한 아이템 정보
		return "chat/chatting";
		
	}
	@RequestMapping("headerChatForm")
	public String headerChatForm(String userId,Model model) throws ParseException {
		System.out.println("Header Access ChatForm"+userId);
		//해당 유저가 갖고 있는 유저 아이디로 테스트
		
		model.addAttribute("userId", userId);
		 
		
		//내가 갖고 있는 상품아이디 리스트 + userId로 검색 
		Map<String,List<ChatMessage>> map= chattingService.findListByUserIdHeader(userId);
		
		List <ChatMessage> chatmessagelist=new ArrayList<ChatMessage>();
//     	Map <String,ItemVO> itemchatmap=new HashMap<String, ItemVO>();
     	List <ItemVO> itemchatlist = new ArrayList<ItemVO>();

     	Iterator<String> keys = map.keySet().iterator();
     	while( keys.hasNext() ){
            String key = keys.next();
           String content=map.get(key).get(map.get(key).size()-1).getContent();
           String updateAt=map.get(key).get(map.get(key).size()-1).getUpdateAt();
            
           itemchatlist.add(itemService.selectItemByItemId(
            		chattingService.findItemIdByChatRoomId(Long.parseLong(key)).getItemId()));
           
//            itemchatmap.put(key, itemService.selectItemByItemId(
//            		chattingService.findItemIdByChatRoomId(Long.parseLong(key)).getItemId()
           System.out.println("itemlist"+itemchatlist);
            //채팅테스트
            System.out.println("*******hot test->"+chattingService.findItemIdByChatRoomId(Long.parseLong(key)).getItemId());
            System.out.println("*******hot test2->"+itemService.selectItemByItemId(
            		chattingService.findItemIdByChatRoomId(Long.parseLong(key)).getItemId()
            ));

            chatmessagelist.add(new ChatMessage(Long.parseLong(key),content,updateAt));
            
        }
     	//sort 한번 하고 가죠
     	System.out.println("sort전"+chatmessagelist);
     	
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
        
     	//ItemVO test 
     	System.out.println("ItemVO:"+itemchatlist.toString());
     	
     	
     	List<String> itemimglist=new ArrayList<String>();
     	List<String> userimglist=new ArrayList<String>();
     	for(int i=0;i<itemchatlist.size();i++) {
     		itemimglist.add(itemService.findItemImageListByItemId(
     				itemchatlist.get(i).getItemId()
     				).get(0).getImageName()
     		);
     		userimglist.add(userService.findUserById(
     				itemchatlist.get(i).getUserVO().getUserId()
     				).getUserImage());
     		
     		
     	}
     	
     	model.addAttribute("itemimglist",itemimglist);
     	model.addAttribute("userimglist",userimglist);
     	model.addAttribute("itemchatlist",itemchatlist);
		model.addAttribute("chatmessagelist", chatmessagelist);
		//해당 아이템에 대한 아이템 정보
		return "chat/chatting";
			}
	

//	@Bean //어플리케이션 런타임실행시 같이 실행되는 함숨
//	public ApplicationRunner applicationRunner() {
//		return args ->{};0}
}
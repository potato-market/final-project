package org.kosta.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	//private ChatMapper chatMapper;

	@Autowired
	public ChatController() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("chattingForm")
	public String chattingForm() {		
		return "chat/chatting.tiles";
	}

}

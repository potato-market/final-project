package org.kosta.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FAQController {
	//private FAQMapper fAQMapper;
	
	@Autowired
	public FAQController() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("faqBoard")
	public String faqBoard() {
		return "faq/faq-board.tiles";
	}
	
}

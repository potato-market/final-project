package org.kosta.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ItemController {
	//private ItemMapper itemMapper;

	@Autowired
	public ItemController() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("writeForm")
	public String writeForm() {		
		return "item/write-form.tiles";
	}
	
	@RequestMapping("itemDetail")
	public String itemDetail() {		
		return "item/item-detail.tiles";
	}
	
	
}

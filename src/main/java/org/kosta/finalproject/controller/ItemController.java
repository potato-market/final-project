package org.kosta.finalproject.controller;

import org.kosta.finalproject.model.domain.ItemVO;
import org.kosta.finalproject.model.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ItemController {

	@Autowired
	private ItemService itemService;

	@Autowired
	public ItemController() {
		super();
	}

	@RequestMapping("writeForm")
	public String writeForm() {
		return "item/write-form.tiles";
	}

	@RequestMapping("updateForm")
	public String updateForm() {
		return "item/update-form.tiles";
	}

	@PostMapping("registerItem")
	public String registerItem(ItemVO itemVO) {
		itemService.registerItem(itemVO);
		return "main.tiles";
	}

}

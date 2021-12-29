package org.kosta.finalproject.controller;

import java.util.List;

import org.kosta.finalproject.model.domain.CategoryVO;
import org.kosta.finalproject.model.domain.ItemVO;
import org.kosta.finalproject.model.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	public String writeForm(Model model) {
		List<CategoryVO> categoryList = itemService.getAllCategoryList();// 카테고리 목록 가지고오기
		model.addAttribute("categoryList", categoryList);
		return "item/write-form.tiles";
	}


	// 중고물품 게시물 등록하기
	@PostMapping("registerItem")
	public String registerItem(ItemVO itemVO) {
		itemService.registerItem(itemVO);
		return "redirect:main";
	}

	// 중고물품 게시물 ItemId로 검색하기 -- 게시물 상세보기 페이지
	@GetMapping("selectItemByItemId")
	public String selectItemByItemId(int itemId, Model model) {
		model.addAttribute("itemDetail", itemService.selectItemByItemId(itemId));
		return "item/item-detail.tiles";
	}
	
	//중고물품 게시물 수정폼으로 이동
	@RequestMapping("updateForm")
	public String updateForm(int itemId, Model model) {
		System.out.println("updateForm with: " + itemId);
		List<CategoryVO> categoryList = itemService.getAllCategoryList();// 카테고리 목록 가지고오기
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("itemDetail", itemService.selectItemByItemId(itemId));
		return "item/update-form.tiles";
	}

	// 중고물품 게시물 수정하기
	@PostMapping("updateItem")
	public String updateItem(ItemVO itemVO, Model model) {
		itemService.updateItem(itemVO);
		model.addAttribute("itemDetail", itemService.selectItemByItemId(itemVO.getItemId()));
		return "item/item-detail.tiles";
	}
	
	//중고물품 게시물 삭제하기
	@PostMapping("deleteItem")
	public String deleteItem(int itemId) {
		itemService.deleteItem(itemId);
		System.out.println("delete");
		return "redirect:main";
	}
	

	// 중고물품 게시물 ItemTitle + UserAddress + CategoryId로 검색하기
	@GetMapping("selectAllItemListByCondition")
	public String selectAllItemListByCondition(ItemVO itemVO, Model model) {
		List<ItemVO> listByCondition = itemService.selectAllItemListByCondition(itemVO);
		List<CategoryVO> categoryList = itemService.getAllCategoryList();// 카테고리 목록 가지고오기
		model.addAttribute("categoryList", categoryList);
		System.out.println(listByCondition);
		//model.addAttribute("selectAllItemListByCondition", listByCondition);
		model.addAttribute("itemList", listByCondition);
		return "main.tiles";
	}
	
}

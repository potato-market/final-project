package org.kosta.finalproject.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.kosta.finalproject.model.domain.CategoryVO;
import org.kosta.finalproject.model.domain.ImageVO;
import org.kosta.finalproject.model.domain.ItemVO;
import org.kosta.finalproject.model.service.ChattingService;
import org.kosta.finalproject.model.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ItemController {

	@Autowired
	private ItemService itemService;
	
	@Autowired
	private ChattingService chattingService;
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
	public String registerItem(ItemVO itemVO,MultipartHttpServletRequest request, @RequestParam(value="item_Images",required=false) @Nullable
		  MultipartFile[] imgfile) throws IllegalStateException, IOException {
		  int itemId= itemService.registerItem(itemVO);
		  itemVO.setItemId(itemId);
		  System.out.println("register"+itemId);
		  System.out.println("bf upload images");
		  if(imgfile[0].getSize()>0)itemService.uploadMultiImage(itemVO,request,imgfile);
			 System.out.println("aft upload images");
		 return "redirect:main";
		
	}

	// 중고물품 게시물 ItemId로 검색하기 -- 게시물 상세보기 페이지
	@GetMapping("selectItemByItemId")
	public String selectItemByItemId(int itemId, String userId, Model model , HttpSession session) {
		System.out.println("상세보기페이지 controller : " +userId);
		List<ItemVO> userItemList  = itemService.getUserItemListByUserId(userId , itemId);
		List<ImageVO>userItemImageList =new ArrayList<ImageVO>();
		for(int i=0;i<userItemList.size();i++) {
//			System.out.println(list.get(i).getItemId());			
			userItemImageList.add(
//			itemService.findItemImageListByItemId(list.get(i).getItemId()).get(0));
			itemService.findItemImageVOByItemId(userItemList.get(i).getItemId()));
 			
		}		
		System.out.println(userItemList.size());
		  @SuppressWarnings("unchecked")
		  ArrayList<Integer> noList =  (ArrayList<Integer>) session.getAttribute("noList");
		  // HomeController의  home메서드를 확인 
		  if (noList.contains(itemId) == false) {
			 // noList에 존재하지 않는 글이면 조회수 증가 
		  itemService.itemHitUpdate(itemId);
		  noList.add(itemId);
		  // 읽은 글번호를noList에 추가한다 
		  }
		model.addAttribute("crnum", chattingService.getChatCount(itemId));
		model.addAttribute("itemDetail", itemService.selectItemByItemId(itemId));
		model.addAttribute("userItemList",userItemList);
		model.addAttribute("userItemImageList",userItemImageList);
		model.addAttribute("imageList",itemService.findItemImageListByItemId(itemId));
		return "item/item-detail.tiles";
	}
	
	//중고물품 게시물 수정폼으로 이동
	@RequestMapping("updateForm")
	public String updateForm(int itemId, Model model) {
		System.out.println("updateForm with: " + itemId);
		List<CategoryVO> categoryList = itemService.getAllCategoryList();// 카테고리 목록 가지고오기
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("itemDetail", itemService.selectItemByItemId(itemId));
		model.addAttribute("imageList",itemService.findItemImageListByItemId(itemId));
		System.out.println();
		return "item/update-form.tiles";
	}

	// 중고물품 게시물 수정하기
	@PostMapping("updateItem")
	public String updateItem(ItemVO itemVO, Model model,
			@RequestParam (value="delList",required=false)List<Integer> list
			,MultipartHttpServletRequest request, @RequestParam(value="item_Images",required=false) @Nullable
	MultipartFile[] imgfile) throws IllegalStateException, IOException
	  {
		if(!list.isEmpty())
			itemService.delCheckedImg(list);
		System.out.println("image 삭제");
		itemService.updateItem(itemVO);
		
		System.out.println("item 수정");
		
		System.out.println("img size"+imgfile[0].getSize());
		if(imgfile[0].getSize()>0)itemService.uploadMultiImage(itemVO,request,imgfile);
		
		System.out.println("image 등록");
		//model.addAttribute("itemDetail", itemService.selectItemByItemId(itemVO.getItemId()));
		return "redirect:main";
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
		System.out.println(itemVO);
		List<ItemVO> listByCondition = itemService.selectAllItemListByCondition(itemVO);
		List<ImageVO>imageList =new ArrayList<ImageVO>();
		if(listByCondition.size()>0) {
			for(int i=0;i<listByCondition.size();i++) {
				imageList.add(
//						itemService.findItemImageListByItemId(list.get(i).getItemId()).get(0));
						itemService.findItemImageVOByItemId(listByCondition.get(i).getItemId()));
				
			}
		}
		
		List<CategoryVO> categoryList = itemService.getAllCategoryList();// 카테고리 목록 가지고오기
		model.addAttribute("imageList", imageList);
		model.addAttribute("categoryList", categoryList);
//		System.out.println(listByCondition);
			
		//model.addAttribute("selectAllItemListByCondition", listByCondition);
		model.addAttribute("itemList", listByCondition);
		return "main.tiles";
	}

	
}

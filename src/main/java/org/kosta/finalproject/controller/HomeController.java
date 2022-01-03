package org.kosta.finalproject.controller;

import java.util.ArrayList;
import java.util.List;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpSession;
import org.kosta.finalproject.model.domain.CategoryVO;
import org.kosta.finalproject.model.domain.ImageVO;
import org.kosta.finalproject.model.domain.ItemVO;
import org.kosta.finalproject.model.service.ChattingService;
import org.kosta.finalproject.model.service.ItemService;
import org.kosta.finalproject.model.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
	
@Controller
public class HomeController {
	
	private static final Logger LOGGER = LogManager.getLogger(HomeController.class);
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private ChattingService chattingService;
	
	@RequestMapping(value={"/","home"})
	public String index(Authentication a) { 
		return "home";
	}
	
	@RequestMapping("main")
	public String home(Model model) {
		List<ItemVO> list = itemService.getAllItemList();	 
		List<ImageVO>imageList =new ArrayList<ImageVO>();
		List <Integer> crnumlist= new ArrayList<Integer>();
		for(int i=0;i<list.size();i++) {
//			System.out.println(list.get(i).getItemId());			
 			imageList.add(
//			itemService.findItemImageListByItemId(list.get(i).getItemId()).get(0));
			itemService.findItemImageVOByItemId(list.get(i).getItemId()));
 			crnumlist.add(chattingService.getChatCount(list.get(i).getItemId()));			
		}		
				
		/*
		 * for(int i=0;i<list.size();i++) { imageList.add(
		 * itemService.findItemImageListByItemId(list.get(i).getItemId()).get(0));
		 * crnumlist.add(chattingService.getChatCount(list.get(i).getItemId())); }
		 */	
		List<CategoryVO> categoryList = itemService.getAllCategoryList();// 카테고리 목록 가지고오기
    
		model.addAttribute("crnum",crnumlist);	
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("itemList",list);
		model.addAttribute("imageList",imageList);
		return "main.tiles";
	}
  
	@RequestMapping("/login_success")
	public String login_successs( HttpSession session ) {
		//조회수 증가 방지를 위해 세션에 noList를 추가한다
		session.setAttribute("noList", new ArrayList<Integer>());
		System.out.println("login_success");
		return "redirect:main";
	}
	/*
	 * @RequestMapping("accessDeniedView") public String accessDeniedView() { return
	 * "auth/accessDeniedView"; }
	 */
	
	@Bean
	public ApplicationRunner applicationRunner() {
		return args ->{
			System.out.println("모두 오류 없길 바래여~ ");
			LOGGER.debug("debug");
			LOGGER.info("info");
			LOGGER.warn("warn");
			LOGGER.error("error");
			
		 
		};
	
	}
}

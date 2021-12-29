package org.kosta.finalproject.controller;

import java.util.ArrayList;
import java.util.List;

import org.kosta.finalproject.model.domain.ImageVO;
import org.kosta.finalproject.model.domain.ItemVO;
import org.kosta.finalproject.model.service.ChattingService;
import org.kosta.finalproject.model.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
	
@Controller
public class HomeController {
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private ChattingService chattingService;
	
	@RequestMapping(value={"/","home"})
	public String index(Authentication a) {
		System.out.println("homecont1 "+a);
		return "home";
	}
	
	@RequestMapping("main")
	public String home(Model model) {
		List<ItemVO> list = itemService.getAllItemList();
		System.out.println(list);
		List<ImageVO>imageList =new ArrayList<ImageVO>();
		List <Integer> crnumlist= new ArrayList<Integer>();
		
		
		for(int i=0;i<list.size();i++) {
			imageList.add(
			itemService.findItemImageListByItemId(list.get(i).getItemId()).get(0));
			crnumlist.add(chattingService.getChatCount(list.get(i).getItemId()));
			
		}
		
		
		
		model.addAttribute("crnum",crnumlist);
		model.addAttribute("itemList",list);
		model.addAttribute("imageList",imageList);
		return "main.tiles";
	}
	@RequestMapping("login_success")
	public String login_success() {
		System.out.println("login_success");
		return "user/login_success";
	}
	/*
	 * @RequestMapping("accessDeniedView") public String accessDeniedView() { return
	 * "auth/accessDeniedView"; }
	 */
	
	@Bean
	public ApplicationRunner applicationRunner() {
		return args ->{
			System.out.println("start application runner ");
		 
		};
		
	
	}
}

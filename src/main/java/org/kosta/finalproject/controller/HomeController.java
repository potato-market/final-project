package org.kosta.finalproject.controller;

import java.util.List;

import org.kosta.finalproject.model.domain.CategoryVO;
import org.kosta.finalproject.model.domain.ItemVO;
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
	
	@RequestMapping(value={"/","home"})
	public String index(Authentication a) {
		System.out.println("homecont1 "+a);
		return "home";
	}
	
	@RequestMapping("main")
	public String home(Model model) {
		List<ItemVO> list = itemService.getAllItemList();

		List<CategoryVO> categoryList = itemService.getAllCategoryList();// 카테고리 목록 가지고오기
		model.addAttribute("categoryList", categoryList);

		model.addAttribute("itemList",list);
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

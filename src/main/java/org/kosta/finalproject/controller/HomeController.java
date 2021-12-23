package org.kosta.finalproject.controller;

import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping(value={"/","home"})
	public String index(Authentication a) {
		System.out.println("homecont1 "+a);
		return "home";
	}
	
	@RequestMapping("main")
	public String home() {
		System.out.println("homeCont2");
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

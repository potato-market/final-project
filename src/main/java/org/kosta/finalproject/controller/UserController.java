package org.kosta.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	//private UserMapper userMapper;

	@Autowired
	public UserController() {
		super();
		// TODO Auto-generated constructor stub
	}
	@RequestMapping("register")
	public String register() {
		return "user/register";
	}
	
	@RequestMapping("login")
	public String login() {
		return "user/login";
	}
	
	@RequestMapping("profile")
	public String profile() {
		return "user/profile.tiles";
	}
	
	@RequestMapping("soldItems")
	public String soldItems() {
		return "user/sold-items.tiles";
	}
	
	@RequestMapping("buyItems")
	public String buyItems() {
		return "user/buy-items.tiles";
	}
	
	@RequestMapping("bookmarks")
	public String bookmarks() {
		return "user/bookmarks.tiles";
	}
	
	@RequestMapping("profileUpdate")
	public String profileUpdate() {
		return "user/profile-update.tiles";
	}
}

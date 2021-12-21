package org.kosta.finalproject.controller;

import org.kosta.finalproject.model.domain.UserVO;
import org.kosta.finalproject.model.mapper.UserMapper;
import org.kosta.finalproject.model.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
	private UserMapper userMapper;
	private UserService userService;

	@Autowired
	public UserController(UserMapper userMapper, UserService userService) {
		super();
		this.userMapper = userMapper;
		this.userService = userService;
	}

	//@Autowired
	//public UserController(UserMapper userMapper) {
	//	super();
	//	this.userMapper = userMapper;
	//}

	/*
	 * @Autowired public UserController() { super(); // TODO Auto-generated
	 * constructor stub }
	 */
	@RequestMapping("guest/registerForm")
	public String registerForm() {
		return "user/registerForm";
		//return "/guest/registerForm";
	}
	
	@RequestMapping("guest/registerIdCheck")
	@ResponseBody
	public int registerIdCheck(String userId) {
		int count =userService.registerIdCheck(userId);
		return count;
		//if(count==1) {
		//	return "중복된 아이디입니다";
		//}else {
		//	return "사용 가능한 아이디입니다";
		//}
	}
	//forward 값을 가지고 넘어갈때 redirect 값을 가지지 않고 넘어갈 때
	@PostMapping("guest/registerUser")
	public String register(UserVO userVO) {
		System.out.println(userVO);
		userService.registerUser(userVO);
		//return "redirect:/main?id=" + userVO.getUserId(); //main tiles에 아직 머없는듯
		//return "redirect:/register_result";
			return "user/register_result";
	}
	
	@RequestMapping("login_form")
	public String login() {
		System.out.println("userContoller");
		return "user/login_form";
	}
	
	@RequestMapping("login_fail")
	public String loginFail() {
		return "user/login_fail";
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
	/*
	 * @RequestMapping("guest/registerIdCheck")
	 * 
	 * @ResponseBody public int registerIdCheck(String userId) { int count
	 * =userMapper.registerIdCheck(userId); return count;
	 */
}

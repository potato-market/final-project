package org.kosta.finalproject.controller;

import org.kosta.finalproject.model.domain.CategoryVO;
import org.kosta.finalproject.model.domain.UserVO;
import org.kosta.finalproject.model.service.CategoryService;
import org.kosta.finalproject.model.service.FAQService;
import org.kosta.finalproject.model.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminController {
	@Autowired
	private FAQService faqService;
	@Autowired
	private UserService userService;

	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("adminHome")
	@Secured("ROLE_ADMIN")
	public String adminHome() {
		return "admin/adminHome";
	}
	
	@RequestMapping("adminMain")
	@Secured("ROLE_ADMIN")
	public String adminMain() {
		return "admin/adminMain";
	}	
	
	@RequestMapping("userManagement") 
	@Secured("ROLE_ADMIN")
	public String adminManagement(Model model) {
		model.addAttribute("list", userService.findAdminUsers());
		return "admin/user-management";
	}
	
	@GetMapping("findMemberUserById")
	@ResponseBody
	public UserVO findMemberUserById(String userId) {
		return userService.findMemberUserById(userId);
	}
	
	@PostMapping("addAdmin")
	@ResponseBody
	public UserVO addAdmin(String userId) {
		userService.addAdmin(userId);
		return userService.findUserById(userId);
	}
	
	@PostMapping("deleteAdmin")
	@ResponseBody
	public UserVO deleteAdmin(String userName) {
		userService.deleteAdmin(userName);
		return userService.findUserById(userName);
	}

	
	/*
	 * @RequestMapping("categoryManagement")
	 * 
	 * @Secured("ROLE_ADMIN") public String categoryManagement() { return
	 * "admin/category-management"; }
	 */
	

	@RequestMapping("faqManagement")
	@Secured("ROLE_ADMIN")
	public String faqManagement(Model model) {
		model.addAttribute("TotalFAQCount", faqService.getTotalFAQCount());
		model.addAttribute("list", faqService.getAllFAQList());
		return "admin/faq-management";
	}
	
	

	@RequestMapping("categoryManagement")
	@Secured("ROLE_ADMIN")
	public String categoryForm(Model model) { 
		model.addAttribute("list",categoryService.findCategory());

		return "admin/category-management";
	}
	

	@RequestMapping("categoryUpForm")
	public String categoryUpForm(CategoryVO categoryVO,Model model) {
		model.addAttribute("cg",categoryVO);
		System.out.println(categoryVO);

		return "admin/category-update-form";
	}
	
	@RequestMapping("categoryUp")
	public String categoryUP(CategoryVO categoryVO) {
		categoryService.updateCategory(categoryVO);
		System.out.println(categoryVO);
		return "redirect:categoryManagement";
	}
	
	@RequestMapping("categoryDel")
	public String categoryDel(CategoryVO categoryVO) {
		categoryService.deleteCategory(categoryVO);
		return "redirect:categoryManagement";
	}
	
	
	@RequestMapping("categoryWriteForm")
	public String categoryWriteForm(Model model) {
		model.addAttribute("list",categoryService.findCategory());
		return "admin/category-write-form";
	}
	
	@PostMapping("categoryWrite")
	@ResponseBody
	public CategoryVO categoryAdd(CategoryVO categoryVO) {
		categoryService.categoryAdd(categoryVO);
		return categoryService.findCategoryById(categoryVO.getCategoryId());
	}
	
	
}

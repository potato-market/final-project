package org.kosta.finalproject.controller;

import org.kosta.finalproject.model.domain.CategoryVO;
import org.kosta.finalproject.model.service.CategoryService;
import org.kosta.finalproject.model.service.ItemService;
import org.kosta.finalproject.model.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MockController {
	@Autowired
	private CategoryService cs;
	

	@RequestMapping("category")
	public String categoryForm(Model model) { 
		model.addAttribute("list",cs.findCategory());

		return "admin/manageCategory";
	}
	

	@RequestMapping("categoryUpForm")
	public String categoryUpForm(CategoryVO cg,Model model) {
		model.addAttribute("cg",cg);
		System.out.println(cg);

		return "admin/updatecgForm";
	}
	
	@RequestMapping("categoryUp")
	public String categoryUP(CategoryVO cg) {
		cs.updateCategory(cg);
		System.out.println(cg);
		return "admin/manageCategory";
	}
	@RequestMapping("categoryDel")
	public String categoryDel(CategoryVO cg) {
		cs.deleteCategory(cg);
		return "admin/manageCategory";
	}
	
	
}

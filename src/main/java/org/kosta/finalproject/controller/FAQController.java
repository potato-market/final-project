package org.kosta.finalproject.controller;

import org.kosta.finalproject.model.domain.FAQVO;
import org.kosta.finalproject.model.service.FAQService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FAQController {
	@Autowired
	private FAQService faqService;

	@RequestMapping("faqBoard")
	public String faqBoard(Model model) {
		// 글 총 갯수 불러오기
		model.addAttribute("TotalFAQCount", faqService.getTotalFAQCount());

		// 전체 글 불러오기
		model.addAttribute("list", faqService.getAllFAQList());
		return "faq/faq-board.tiles";
	}

	// FAQ 작성 화면
	@RequestMapping("faq-write-form")
	public String writeFAQForm(Model model) {
		return "admin/faq-write-form";
	}

	// FAQ 작성
	@PostMapping("writeFAQ")
	@Secured("ROLE_ADMIN")
	public String writeFAQ(FAQVO faqVO) {
		faqService.writeFAQ(faqVO);
		return "redirect:faqManagement";
	}
	
	//FAQ 수정 화면
	@Secured("ROLE_ADMIN")
	@RequestMapping("faq-update-form")
	public String updateFAQForm(Model model,int faqId) {
		model.addAttribute("faqData", faqService.getFAQByNo(faqId));
		return "admin/faq-update-form";
	}
	
	// FAQ 수정
	@PostMapping("updateFAQ") 
	@Secured("ROLE_ADMIN")
	public String updateFAQ(FAQVO faqVO) {
	  faqService.updateFAQ(faqVO); 
	  return "redirect:faqManagement";
	}
	
	// FAQ 삭제
	@PostMapping("deleteFAQ")
	@Secured("ROLE_ADMIN")
	public String deleteFAQ(int faqId) {
		faqService.deleteFAQ(faqId);
		 return "redirect:faqManagement";
	}

}

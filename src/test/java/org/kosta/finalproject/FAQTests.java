package org.kosta.finalproject;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.kosta.finalproject.model.domain.FAQVO;
import org.kosta.finalproject.model.domain.UserVO;
import org.kosta.finalproject.model.mapper.FAQMapper;
import org.kosta.finalproject.model.service.FAQService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class FAQTests {
	//@Autowired
	//private FAQMapper faqMapper;
	
	@Autowired
	private FAQService faqService;

	@Test
	void getTotalFAQCount() {	
		int count =faqService.getTotalFAQCount();
		System.out.println("총 FAQ 수:"+count);
	}
	
	@Test
	void writeFAQ() {
		faqService.writeFAQ(new FAQVO("최종 junit 확인","안녕",new UserVO("ADMIN")));
	}
	
	@Test
	void getAllFAQList(){
		List<FAQVO> list = faqService.getAllFAQList();
		for(int i=0; i<list.size(); i++) {			
			System.out.println(list.get(i).toString());
		}
	}
	
	@Test
	void updateFAQ() {
		 faqService.updateFAQ(new FAQVO(19,"최종확인","안녕",new UserVO("ADMIN")));
	}
	
	@Test
	void deleteFAQ() {
		int faqId = 19;
		faqService.deleteFAQ(faqId);
	}

}

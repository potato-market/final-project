package org.kosta.finalproject.model.service;

import org.kosta.finalproject.model.domain.FAQVO;
import org.kosta.finalproject.model.mapper.FAQMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FAQServiceImpl implements FAQService{
	@Autowired
	FAQMapper faqMapper;
	
	@Override
	public void writeFAQ(FAQVO faqVO) {
		faqMapper.writeFAQ(faqVO);
	}

}

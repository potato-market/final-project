package org.kosta.finalproject.model.service;

import java.util.List;

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

	@Override
	public int getTotalFAQCount() {
		return faqMapper.getTotalFAQCount();
	}
	
	@Override
	public List<FAQVO> getAllFAQList() {
		return faqMapper.getAllFAQList();
	}
	
	@Override
	public FAQVO getFAQByNo(int faqId) {
		return faqMapper.getFAQByNo(faqId);
	}

	@Override
	public void updateFAQ(FAQVO faqVO) {
		faqMapper.updateFAQ(faqVO);
		
	}
}

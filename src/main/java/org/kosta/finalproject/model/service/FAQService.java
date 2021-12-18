package org.kosta.finalproject.model.service;

import java.util.List;

import org.kosta.finalproject.model.domain.FAQVO;

public interface FAQService {

	void writeFAQ(FAQVO faqVO);
	List<FAQVO> getAllFAQList();
	int getTotalFAQCount();

}

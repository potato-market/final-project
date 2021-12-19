package org.kosta.finalproject.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.finalproject.model.domain.FAQVO;

@Mapper
public interface FAQMapper {

	void writeFAQ(FAQVO faqVO);

	int getTotalFAQCount();

	List<FAQVO> getAllFAQList();
	
	FAQVO getFAQByNo(int faqId);

}

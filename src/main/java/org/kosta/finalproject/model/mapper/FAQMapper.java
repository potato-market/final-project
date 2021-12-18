package org.kosta.finalproject.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.finalproject.model.domain.FAQVO;

@Mapper
public interface FAQMapper {

	public void writeFAQ(FAQVO faqVO);

	public int getTotalFAQCount();

	public List<FAQVO> getAllFAQList();

}

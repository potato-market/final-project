package org.kosta.finalproject.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.finalproject.model.domain.FAQVO;

@Mapper
public interface FAQMapper {

	public void writeFAQ(FAQVO faqVO);

}

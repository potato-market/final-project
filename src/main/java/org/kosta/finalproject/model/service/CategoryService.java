package org.kosta.finalproject.model.service;

import java.util.List;

import org.kosta.finalproject.model.domain.CategoryVO;

public interface CategoryService {
	void updateCategory(CategoryVO categoryVO);

	void deleteCategory(CategoryVO categoryVO);
	
	List<CategoryVO> findCategory();
	
}

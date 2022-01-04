package org.kosta.finalproject.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.finalproject.model.domain.CategoryVO;

@Mapper
public interface CategoryMapper {
	 void updateCategory(CategoryVO categoryVO);
	 void deleteCategory(CategoryVO categoryVO);
	 List<CategoryVO> findCategory();
	void categoryAdd(CategoryVO categoryVO);
	CategoryVO findCategoryById(int categoryId);
}

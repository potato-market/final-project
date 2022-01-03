package org.kosta.finalproject.model.service;

import java.util.List;

import org.kosta.finalproject.model.domain.CategoryVO;
import org.kosta.finalproject.model.mapper.CategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	CategoryMapper categoryMapper;
	
	@Override
	public void updateCategory(CategoryVO categoryVO) {
		// TODO Auto-generated method stub
		categoryMapper.updateCategory(categoryVO);
		
	}
	
	
	@Override
	public void deleteCategory(CategoryVO categoryVO) {
		// TODO Auto-generated method stub
		categoryMapper.deleteCategory(categoryVO);
		
	}


	@Override
	public List<CategoryVO> findCategory() {
		// TODO Auto-generated method stub	
		return categoryMapper.findCategory();
	}

}

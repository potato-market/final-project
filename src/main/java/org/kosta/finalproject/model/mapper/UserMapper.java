package org.kosta.finalproject.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.finalproject.model.domain.Authority;
import org.kosta.finalproject.model.domain.UserVO;

@Mapper
public interface UserMapper {
	
	
	int getCountUser();

	void registerUser(UserVO userVO);
	
	int registerIdCheck(String string);

	UserVO findUserById(String string);

	void registerRole(Authority authority);

	int getCountAutho();

	List<Authority> findAuthorityByUsername(String id);
	
	
	
}
 
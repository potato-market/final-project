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

	void updateUserPET(UserVO userVO);

	void updateUserPassword(UserVO userVO);

	void profileAddressUpdate(UserVO userVO);

	String findIdByTel(String userTel);
	//String[] findIdByTel(String userTel);

	int registerTelCheck(String userTel);
	
	void updateUserImage(UserVO userVO);

	List<UserVO> findAdminUsers();

	UserVO findMemberUserById(String userId);

	void addAdmin(String userId);

	void deleteAdmin(String userName);
	
}
 
package org.kosta.finalproject.model.service;

import java.util.List;

import org.kosta.finalproject.model.domain.Authority;
import org.kosta.finalproject.model.domain.UserVO;

public interface UserService {

  void registerUser(UserVO userVO);

UserVO findUserById(String id);

int registerIdCheck(String userId);

List<Authority> findAuthorityByUsername(String id);

void updateUserPhoneAndEmail(UserVO userVO);

void updateUserPassword(UserVO userVO);

void profileAddressUpdate(UserVO userVO);

String findIdByTel(String userTel);
//String[] findIdByTel(String userTel);

int registerTelCheck(String userTel);

	
}

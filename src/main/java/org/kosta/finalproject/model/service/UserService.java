package org.kosta.finalproject.model.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.kosta.finalproject.model.domain.Authority;
import org.kosta.finalproject.model.domain.UserVO;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

public interface UserService {

  void registerUser(UserVO userVO);

UserVO findUserById(String id);

int registerIdCheck(String userId);

List<Authority> findAuthorityByUsername(String id);

//updateUserpart pw email tel img 
void updateUserPartPET(UserVO userVO);

void updateUserPassword(UserVO userVO);

void profileAddressUpdate(UserVO userVO);

String findIdByTel(String userTel);
//String[] findIdByTel(String userTel);

String uploadSingleImage(UserVO userVO,HttpServletRequest request,
MultipartFile imgfile) throws IllegalStateException, IOException;

void updateUploadSingleImage(UserVO userVO,HttpServletRequest request,
		MultipartFile imgfile) throws IllegalStateException, IOException;


	
}

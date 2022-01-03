package org.kosta.finalproject.model.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.kosta.finalproject.model.domain.Authority;
import org.kosta.finalproject.model.domain.UserVO;
import org.kosta.finalproject.model.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UserServiceImpl implements UserService {
	private UserMapper userMapper;
	/*
	 * 비밀번호 암호화처리를 위한 객체를 주입받는다 
	 * spring boot : org.kosta.config.security.WebSecurityConfig 에 @Bean 설정 되어 있음 
	 * spring legacy: spring-security.xml 에서 bean 설정이 되어 있음
	 */
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	public UserServiceImpl(UserMapper userMapper, BCryptPasswordEncoder passwordEncoder) {
		super();
		this.userMapper = userMapper;
		this.passwordEncoder = passwordEncoder;
	}

	// 회원가입시 반드시 권한까지 부여되도록 트랜잭션 처리한다
	@Transactional
	@Override
	public void registerUser(UserVO userVO) {
		// 비밀번호를 bcrypt 알고리즘으로 암호화하여 DB에 저장한다
		String encodedPwd = passwordEncoder.encode(userVO.getUserPassword());
		userVO.setUserPassword(encodedPwd);
		userMapper.registerUser(userVO);
		// 회원 가입시 반드시 권한이 등록되도록 트랜잭션처리를 한다
		Authority authority = new Authority(userVO.getUserId(), "ROLE_MEMBER");
		//userVO = new UserVO("ROLE_MEMBER");
		userMapper.registerRole(authority);
	}
	
	@Override
	public int registerIdCheck(String userId) {
		return userMapper.registerIdCheck(userId);
	}

	@Override
	public UserVO findUserById(String id) {
		return userMapper.findUserById(id);
	}

	@Override
	public List<Authority> findAuthorityByUsername(String username) {
		// TODO Auto-generated method stub
		return  userMapper.findAuthorityByUsername(username);
	}

	@Override //회원정보수정 PW  EMAIL  TEL 업데이트
	public void updateUserPartPET(UserVO userVO) {
		userMapper.updateUserPET(userVO);
	}

	@Override
	public void updateUserPassword(UserVO userVO) {
			//사용자가 업뎃폼에서 입력한 비밀번호를 받아와 암호화 처리를 한다
			String encodePassword=passwordEncoder.encode(userVO.getUserPassword());
			//암호화 처리 후 반환된 비밀번호를 다시 UserVO에 저장하고
			userVO.setUserPassword(encodePassword);
			//mapper를 통해 실제 db에 변경하도록 한다
			userMapper.updateUserPassword(userVO);
			}
		
	@Override
	public void profileAddressUpdate(UserVO userVO) {
		userMapper.profileAddressUpdate(userVO);
		
	}

	@Override
	//전화번호로 아이디 찾기
		public String findIdByTel(String userTel) {
		return userMapper.findIdByTel(userTel);
	}

	@Override
	//회원가입시 전화번호 중복체크
	public int registerTelCheck(String userTel) {
		return userMapper.registerTelCheck(userTel);
	}
	
	/*
	 * @Override public void updateMember(UserVO userVO) { // 변경할 비밀번호를 암호화한다 String
	 * encodePassword = passwordEncoder.encode(userVO.getUserPassword());
	 * userVO.setUserPassword(encodePassword); userMapper.updateMember(userVO); }
	 */
	/*
	 * @Override public List<Authority> findAuthorityByUsername(String username) {
	 * return userMapper.findAuthorityByUsername(username); }
	 */
	
	
	/*
		Register upload Single image  return value : savedImageName 
		DataFlow :Service ->Controller -> savedname input(UserVO) ->register->DB
	*/
	@Override
	public String uploadSingleImage(UserVO userVO, HttpServletRequest request, MultipartFile imgfile) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		 
//		String filepath=request.getServletContext().getRealPath("/assets/upload/");
		String filepath="E:/projectjava/potato_market/final-project/src/main/resources/static/assets/upload/";
		 
		//File OriginName
		String originName=imgfile.getOriginalFilename();
		//File extension
		String fileExtension= originName.substring(originName.lastIndexOf("."));
		//saved file Name
		String savedname=UUID.randomUUID()+fileExtension;
//		System.out.println(savedname);	
		//file Object Create
		File file = new File(filepath+savedname);
//		System.out.println("filePath ->"+file.getPath());
		
		// save file
		imgfile.transferTo(file); 
		
		//save database 
		return savedname;
	}

	/*
		UpdateProfile version Upload Single image return value : none 
		DataFlow : Service ->DB Update set
	*/
	@Override
	public void updateUploadSingleImage(UserVO userVO,HttpServletRequest request, MultipartFile imgfile)
			throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
//		String filepath=request.getServletContext().getRealPath("/assets/upload/");
		String filepath="E:/projectjava/potato_market/final-project/src/main/resources/static/assets/upload/";
		//File OriginName
		String originName=imgfile.getOriginalFilename();
		//File extension
		String fileExtension= originName.substring(originName.lastIndexOf("."));
		//saved file Name
		String savedname=UUID.randomUUID()+fileExtension;
		//file Object Create
		File file = new File(filepath+savedname);
//		System.out.println("filePath ->"+file.getPath());
		
		// save file
		imgfile.transferTo(file);
		userVO.setUserImage(savedname);
		//Transfer to Database
		userMapper.updateUserImage(userVO);
		 
	}
}

package org.kosta.finalproject.model.service;

import java.util.List;

import org.kosta.finalproject.model.domain.Authority;
import org.kosta.finalproject.model.domain.UserVO;
import org.kosta.finalproject.model.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Override //회원정보수정 TEL, EMAIL 업데이트
	public void updateUserPhoneAndEmail(UserVO userVO) {
		userMapper.updateUserPhoneAndEmail(userVO);
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
	//public String[] findIdByTel(String userTel) {
		public String findIdByTel(String userTel) {
		return userMapper.findIdByTel(userTel);
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
}

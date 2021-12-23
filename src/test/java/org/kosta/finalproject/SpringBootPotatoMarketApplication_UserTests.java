package org.kosta.finalproject;

import java.sql.Array;
import java.util.Arrays;

import org.junit.jupiter.api.Test;
import org.kosta.finalproject.model.domain.UserVO;
import org.kosta.finalproject.model.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SpringBootPotatoMarketApplication_UserTests {
	@Autowired
	UserMapper userMapper;

	@Test
	void contextLoads() {
	}

	// 총 유저수 확인

	//@Test
	//void getCountUser() {
	//	System.out.println("총 유저수 " + userMapper.getCountUser());
	//}
	
	//@Test
	//void getCountAutho() {
	//	System.out.println("총 atho 수"+ userMapper.getCountAutho());
	//}

	// 회원가입
	//@Test
	//void registerUser() {
		//userMapper.registerUser(new UserVO("spring2", "1234", "01012341234", "미국", "a@naver.com"));
		//System.out.println(userMapper.getCountUser());
	//}
	
	//@Test
	//void registerRole() {
	//	userMapper.registerRole(new Authority("security10","Role_Member"));
	//	System.out.println("총 atho 수"+ userMapper.getCountAutho());
	//}
	
		@Test
		void findAuthorityByUsername() {
			System.out.println(userMapper.findAuthorityByUsername("security10000"));
		}
		
	/*
	 * @Test void registerUser() { userMapper.registerUser(new
	 * UserVO("spring1000","1234","01012341234","미국","a@naver.com","member"));
	 * System.out.println(userMapper.getCountUser()); }
	 */

	//아이디 중복체크 - 1 또는 0으로 반환받는다
	//@Test
	//void registerIdCheck() {
	//	System.out.println(userMapper.registerIdCheck("spring1"));
	//}
	
	//@Test
	//void findUserById() {
	//	System.out.println(userMapper.findUserById("securityPassword"));
	//}
		
	//	@Test
	//	void updateUserPhoneAndEmail() {
	//		userMapper.updateUserPhoneAndEmail(new UserVO("security112","change3","change2@change2"));
	//		System.out.println(userMapper.findUserById("security112"));
	//	}
		
		//@Test
		//void PasswordUpdate() {
		//	userMapper.updateUserPassword(new UserVO("security112","1234"));
		//	System.out.println(userMapper.findUserById("security112"));
		//}
			
		//@Test  //생성자 오버로딩 규칙위배때문에 address를 제외한 이미지,sysdate를 넣어주었고 mapper.xml에는 address만 변경되도록함
		//void profileAddressUpdate() {
		//	userMapper.profileAddressUpdate(new UserVO("java","죽전고투홈",null,null));
		//System.out.println(userMapper.findUserById("java"));
		//	}
		
	@Test
	void findIdByTel() {
		//String[] idResult=userMapper.findIdByTel("1234");
		String idResult=userMapper.findIdByTel("222");
		System.out.println(idResult);
		//System.out.println(Arrays.toString(idResult	));
	}
}



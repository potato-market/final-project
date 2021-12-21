package org.kosta.finalproject;

import org.junit.jupiter.api.Test;
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

}



package org.kosta.finalproject.config;

import java.util.ArrayList;
import java.util.List;

import org.kosta.finalproject.model.domain.Authority;
import org.kosta.finalproject.model.domain.UserVO;
import org.kosta.finalproject.model.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;


/*
 * Spring Security를 이용한 인증로직을 정의한 클래스 
 */
@Component
public class MemberAuthenticationProvider implements AuthenticationProvider{	
	private UserService userService;
	//비밀번호 암호화처리를 위한 객체를 주입받는다 	
    private BCryptPasswordEncoder passwordEncoder;
    @Autowired
	public MemberAuthenticationProvider(UserService userService, BCryptPasswordEncoder passwordEncoder) {
		super();
		this.userService = userService;
		this.passwordEncoder = passwordEncoder;
	}

	@Override
	/*Authentication authenticate(Authentication authentication) throws AuthenticationException
	 * -실제 인증 처리
     *    - 규칙
     *     1. 파라미터로 전달받은 Authentication 객체에 대해 인증처리를 지원하지 않으면 null을 리턴한다.
     *     2. Authentication 객체를 이용한 인증에 실패하면 AuthenticationException 발생시킨다.
     *     3. 인증에 성공하면, 인증 정보를 담은 Authentication 객체를 만들어 return 한다.
	 */
	/**
	 * 사용자가 화면에서 로그인을 하면 아래의 메서드가 실행된다. 
	 * 매개변수 : 인증시 필요한 정보 - Authentication ( 사용자가 입력한 ID , PASSWORD가 저장되어 있음 ) 
	 * 리턴 : 인증한 정보를 가진 Authentication	  
	 * 매개변수에 전달된 Authentication객체를 받아 인증처리를 한뒤 인증한 정보를 Authentication에 담아 리턴
	 */
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {		
		//1.파라미터로 전달받은 Authentication 객체에 대해 인증처리를 지원하지 않으면 null을 리턴한다.
		if(!supports(authentication.getClass())){
			return null;
		}
		//2.사용자 정보 DB로부터 조회
		String id = authentication.getName();//사용자가 로그인시 입력한 ID 반환 		
		UserVO user = userService.findUserById(id);
		if(user == null){
			throw new UsernameNotFoundException("회원 아이디가 존재하지 않습니다");
		}
		String password=(String)authentication.getCredentials();//사용자가 입력한 패스워드 반환 
		//3.패스워드 비교
		/*if(!password.equals(member.getPassword())){//패스워드가 틀리면
			throw new BadCredentialsException("패스워드가 틀립니다.");
		}*/
		/* 비밀번호 암호화를 이용할 경우 
		 이용자가 로그인 폼에서 입력한 비밀번호와 DB로부터 가져온 암호화된 비밀번호를 비교한다 */
        if (!passwordEncoder.matches(password, user.getUserPassword()))
                throw new BadCredentialsException("비밀번호가 일치하지 않습니다");
		//4.사용자 권한 조회
		List<Authority> list = userService.findAuthorityByUsername(id);
		if(list.size() == 0){
			throw new UsernameNotFoundException("권한이 없습니다.");
		}
		
		List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();		
		for(Authority au : list){ // ROLE_ 형식의 db 정보가 아니라면 이 시점에 ROLE_ 를 접두어로 추가한다
		authorities.add(new SimpleGrantedAuthority("ROLE_MEMBER"));
		}
		
		/****************************************
		 * 여기까지 왔으면 인증 완료 - Authentication객체 생성해서 리턴
		 ***************************************/
		
		//Authentication auth = new UsernamePasswordAuthenticationToken(user, password);
		Authentication auth = new UsernamePasswordAuthenticationToken(user, password, authorities);
		System.out.println("MemberAuthenticationProvider 인증처리완료:"+auth);
		return auth;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		//현재 MemberAuthenticationProvider가  지정된 Authentication 객체가 id,password 인증방식이면 true를 반환한다 
		//48 라인에서 인증로직 첫 시점에 비교한다
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}	
}

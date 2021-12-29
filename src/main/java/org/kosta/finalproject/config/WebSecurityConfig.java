package org.kosta.finalproject.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
//스프링 시큐리티 설정 클래스 
@Configuration
@EnableWebSecurity
//@Secured @PreAuthorize, @PostAuthorize 애노테이션을 사용하여 인증,인가 처리를 하고 싶을때 사용하는 옵션
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	//비밀번호 암호화를 위한 bean 생성 -> MemberService 에서 비번 암호화를 위해 사용 , 
	//MemberAuthenticationProvider 에서 비번 일치여부를 위해 사용 
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}

	
	/*
	 	인증(authentication)을 위한 설정은 아래의 메서드에서 처리한다 (로그인 기능과 로그인 여부에 따른 서비스 접근에 대한 설정 ) 
	 	인가(authorization)에 대한 설정은 각 컨트롤러 메서드에서 @Secured("ROLE_ADMIN") 와 같이 설정한다  
	 	( 인증받은 회원이 부여받은 권한에 의거해 접근할 수 있는 서비스에 대한 설정 ) 	 	
	 */
	@Override
	protected void configure(HttpSecurity http) throws Exception {		
		/*	
		 	인증 처리 : 로그인 여부에 따라 접근 가능한 서비스를 설정 
		 	/  , home : welcome file 		
			
			정적인 파일 ( css , javascript , image ) 은 static 디렉토리 이하에 위치시킨다 
			/myweb/** 이하 하위 디렉토리(css, images, js) 및 파일에 접근 허용  
			
			/guest/ 로그인 없어도 서비스할 url 
			위의 지정한 url 에는 permitAll() 로그인 인증없이 서비스 되고 
			그 외의 요청에는 anyRequest().authenticated()  로그인 인증된 사용자만 접근할 수 있다 
		 */
		//http.authorizeRequests().antMatchers("/", "/home", "/static/**", "/guest/**").permitAll()
		//.anyRequest().authenticated();
		
		http.authorizeRequests().antMatchers("/", "/home", "/assets/**", "/guest/**").permitAll()
		.anyRequest().authenticated();
		// 인증(authentication): 로그인을 위한 설정
		http.formLogin().loginPage("/login_form") // 로그인 폼이 있는 url
				.loginProcessingUrl("/login")// login form 의 action 경로  << 시큐리티 자체 내장이라함
				.failureUrl("/login_fail") // 로그인 실패시 메세지 보여줄 url
				.defaultSuccessUrl("/main",true) // 로그인 성공 후 이동할 url
				.usernameParameter("id")
				.passwordParameter("password").and() //로그인 폼에서 전달할 폼 입력양식의 name 
				.formLogin().permitAll();//로그인 폼은 인증없이 접근하도록 설정 
		
		// 로그아웃을 위한 설정
		http.logout().permitAll().logoutUrl("/logout").logoutSuccessUrl("/login_form").invalidateHttpSession(true);
		//인가에 대한 설정 : 서비스 접근 권한이 없을 때 accessDeniedView 로 이동된다 
		http.exceptionHandling().accessDeniedPage("/accessDeniedView");
		//Ajax 요청에 대한 인증,인가 확인  
		http.exceptionHandling().authenticationEntryPoint(new AjaxAuthenticationEntryPoint("/"));
		
	}

	

}
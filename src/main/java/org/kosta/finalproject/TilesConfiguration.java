package org.kosta.finalproject;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
/*
 * @Configuration 스프링 환경 설정 클래스임을 알리는 어노테이션 ( spring-config.xml 과 동일한 역할 ) 
 * 위 어노테이션이 선언된 클래스에는 하나 이상의 @Bean 이 있다 
 * @Bean 라이브러리를 이용한 bean 생성을 위한 어노테이션 ( xml 의 <bean id="" class=""/> 와 동일한 역할 )
 * @Component 계열 즉 @Controller , @Service , @Repository 은 개발자가 정의한 클래스를 이용해
 * bean 을 생성할 때 사용   
 */
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
@Configuration // Java Class 기반의 Spring 환경설정 클래스임을 스프링 컨테이너에 알리는 어노테이션 
public class TilesConfiguration {
// @Bean : bean 생성을 위한 어노테이션 : 외부라이브러리를 통해 bean 생성하고자 할 때 사용하는 어노테이션
//			 리턴하는 객체가 bean으로 등록된다 
// @Component : 개발자가 작성한 클래스를 bean으로 등록할 때 사용 
@Bean  
	public UrlBasedViewResolver tilesViewResolver() {
		UrlBasedViewResolver tilesViewResolver = new UrlBasedViewResolver();
		tilesViewResolver.setViewClass(TilesView.class);
		return tilesViewResolver;
	}
	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		String[] defs = { "WEB-INF/tiles-config.xml" };
		tilesConfigurer.setDefinitions(defs);
		return tilesConfigurer;
	}

}










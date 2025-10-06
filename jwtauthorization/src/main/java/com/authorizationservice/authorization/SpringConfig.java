package com.authorizationservice.authorization;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.authorizationservice.authorization.util.JwtFilter;

@Configuration
@EnableWebSecurity
public class SpringConfig {

	@Autowired

    private JwtFilter jwtFilter;
	
	@Bean
	public SecurityFilterChain secureFilter(HttpSecurity http) throws Exception{
	
		
//		http.csrf().disable()
//		.authorizeRequests()
//		
//		.requestMatchers(HttpMethod.POST, "/**").permitAll()
//		.requestMatchers(HttpMethod.GET, "/**").permitAll()
//		.anyRequest().authenticated().and()
//		.exceptionHandling().and().sessionManagement()
//        .sessionCreationPolicy(SessionCreationPolicy.STATELESS);
		
		http.csrf().disable()
	    .authorizeHttpRequests()
	    .requestMatchers("/getuser").authenticated() // protect this endpoint
	    .anyRequest().permitAll() // allow others if needed
	    .and()
	    .exceptionHandling()
	    .and()
	    .sessionManagement()
	    .sessionCreationPolicy(SessionCreationPolicy.STATELESS);

		 http.addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);
		return http.build();
	
	}
	
	
}

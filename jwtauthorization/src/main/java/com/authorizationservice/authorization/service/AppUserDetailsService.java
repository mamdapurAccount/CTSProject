package com.authorizationservice.authorization.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.authorizationservice.authorization.model.AuthenticationRequest;
import com.authorizationservice.authorization.repository.AuthRequestRepo;
import java.util.ArrayList;

@Service

public class AppUserDetailsService implements UserDetailsService {

	@Autowired
	AuthRequestRepo authRequestRepo;
	
    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
    	AuthenticationRequest authenticationRequest = authRequestRepo.findById("nathan").orElseThrow();
    	UserDetails user = new User(authenticationRequest.getUserName(), authenticationRequest.getPassword(), new ArrayList<>());
		return user;
    }


    
} 
  
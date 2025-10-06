package com.authorizationservice.authorization.controller;
import org.springframework.http.MediaType;
import com.authorizationservice.authorization.dto.VaildatingDTO;
import com.authorizationservice.authorization.exceptions.LoginException;
import com.authorizationservice.authorization.model.AuthenticationRequest;
import com.authorizationservice.authorization.model.AuthenticationResponse;
import com.authorizationservice.authorization.repository.AuthRequestRepo;
import com.authorizationservice.authorization.service.AppUserDetailsService;
import com.authorizationservice.authorization.util.JwtUtil;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;

@RestController

public class AuthorizationController {
	@Autowired
	AuthRequestRepo repo;
    @Autowired
    private AppUserDetailsService userDetailsService;
    @Autowired
	private JwtUtil jwtTokenUtil;
    
	private VaildatingDTO vaildatingDTO= new VaildatingDTO();

	@GetMapping("/getuser")
	public String getUser() {
		return "Shankar" ;
	}
	@GetMapping("/getall")
	public List<AuthenticationRequest> getAll(){
		return repo.findAll();
	}
	@PostMapping("/login")
    public ResponseEntity<Object> createAuthorizationToken(@RequestBody AuthenticationRequest authenticationRequest) throws LoginException { 
  
 
		final UserDetails userDetails = userDetailsService.loadUserByUsername(authenticationRequest.getUserName());
		
		if (userDetails.getPassword().equals(authenticationRequest.getPassword())) {
			return new ResponseEntity<>(
					new AuthenticationResponse(authenticationRequest.getUserName(), jwtTokenUtil.generateToken(userDetails)),HttpStatus.OK);
		} else {
			
			throw new LoginException("Invalid Username or Password");
		}
	}

	

	@GetMapping( path = "/validate", produces = MediaType.APPLICATION_JSON_VALUE)
	
	public ResponseEntity<VaildatingDTO> validatingAuthorizationToken(@RequestHeader(name = "Authorization" ) String tokenDup) {
		//String token = tokenDup.substring(7).trim();
		String token = tokenDup.trim();
		if (token.toLowerCase().startsWith("bearer")) 
		    token = token.substring(7).trim();
		
	  
		 try {
			 UserDetails user = userDetailsService.loadUserByUsername(jwtTokenUtil.extractUsername(token));
			if (Boolean.TRUE.equals(jwtTokenUtil.validateToken(token, user))) {
				vaildatingDTO.setValidStatus(true);
				return new ResponseEntity<>(vaildatingDTO, HttpStatus.OK);
			} else {
				vaildatingDTO.setValidStatus(false);
				return new ResponseEntity<>(vaildatingDTO, HttpStatus.FORBIDDEN);
			}
		} catch (Exception e) { 
			vaildatingDTO.setValidStatus(false);
			System.out.println(e);
			return new ResponseEntity<>(vaildatingDTO, HttpStatus.FORBIDDEN);
		}
	}

	@GetMapping(path = "/health-check")
	public ResponseEntity<String> healthCheck() {
		return new ResponseEntity<>("OK", HttpStatus.OK);
	}
}

package com.front.api.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LoginController {

	@RequestMapping(value = "/api/login")  
	public String apiLogin(){
		return "sadsadsa";
	}
	
}

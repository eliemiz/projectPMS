package pms.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A00_AccountService;

@Controller
public class A00_AccountController {
	
	@Autowired(required = false)
	private A00_AccountService service;
	
	// http://localhost:7080/projectPMS/login.do
	@RequestMapping("login.do")
	public String login() {
		
		return "a00_account\\a00_login";
	}
	
	// http://localhost:7080/projectPMS/loginSearch.do
	@RequestMapping("loginSearch.do")
	public String loginSearch() {
		
		return "a00_account\\a01_login_search";
	}
	
	// http://localhost:7080/projectPMS/signin.do
	@RequestMapping("signin.do")
	public String signin() {
		
		return "a00_account\\a02_signin";
	}
	

}

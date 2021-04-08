package pms.a01_controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.a02_service.A00_AccountService;
import pms.z01_vo.Account;

@Controller
public class A00_AccountController {
	
	@Autowired(required = false)
	private A00_AccountService service;
	
	// http://localhost:7080/projectPMS/account.do
	@RequestMapping("account.do")
	public String account(Model d) {
	ArrayList<Account> accountList = service.getAccountList();
		
		d.addAttribute("accountList", accountList);

		
		return "a00_account\\a00_login";
	}
	
	// http://localhost:7080/projectPMS/login.do
	@RequestMapping("login.do")
	public String login(@RequestParam("id") String user_id, @RequestParam("pass") String password, HttpServletRequest request) {
		
		
		if (user_id == null) {
			user_id = "";
		}
		if (password == null) {
			password = "";
		}
		
		if (!user_id.equals("")) {
		Account account = service.Login(user_id, password);
		
		if (account != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user_id", account.getUser_id());
			}
		}	
	
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
	
	// http://localhost:7080/projectPMS/info.do
	@RequestMapping("info.do")
	public String info() {
		
		return "a00_account\\a03_info";
	}
	

}

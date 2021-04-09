package pms.a01_controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A00_AccountService;
import pms.z01_vo.Account;

@Controller
@RequestMapping("account.do")
public class A00_AccountController {
	
	@Autowired(required = false)
	private A00_AccountService service;
	
	// http://localhost:7080/projectPMS/account.do?method=account
	@RequestMapping(params = "method=account")
	public String account(Model d) {
	ArrayList<Account> accountList = service.getAccountList();
		
		d.addAttribute("accountList", accountList);

		
		return "a00_account\\a00_login";
	}
	
	// http://localhost:7080/projectPMS/account.do?method=login
	@PostMapping(params = "method=login")
	public String login( Account log ,HttpServletRequest request) {
		System.out.println("아이디:"+log.getUser_id());
		  Account ac = service.Login(log);
			if(ac!=null){//해당 값이 있으면
				HttpSession session = request.getSession();
				session.setAttribute("login", ac);
				request.setAttribute("loginSucc", "Y");
			}else {
				request.setAttribute("loginSucc", "N");
			}
	
		return "a00_account\\a00_login";
	}
	
	// http://localhost:7080/projectPMS/account.do?method=loginSearch
	@RequestMapping(params = "method=loginSearch")
	public String loginSearch() {
		
		return "a00_account\\a01_login_search";
	}
	
	// http://localhost:7080/projectPMS/account.do?method=signin
	@RequestMapping(params = "method=signin")
	public String signin() {
		
		return "a00_account\\a02_signin";
	}
	
	// http://localhost:7080/projectPMS/account.do?method=info
	@RequestMapping(params = "method=info")
	public String info() {
		
		return "a00_account\\a03_info";
	}
	

}

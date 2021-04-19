package pms.a01_controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.LocaleResolver;

import pms.a02_service.A00_AccountService;
import pms.z01_vo.Account;
import pms.z02_util.SessionManager;

@Controller
@RequestMapping("account.do")
public class A00_AccountController {
	
	@Autowired(required = false)
	private A00_AccountService service;
	
	@Autowired(required = false)
	private LocaleResolver localeResolver;
	
	// http://localhost:7080/projectPMS/account.do?method=account
	@RequestMapping(params = "method=account")
	public String account(Model d) {
	ArrayList<Account> accountList = service.getAccountList();
		
		d.addAttribute("accountList", accountList);

		
		return "a00_account\\a00_login";
	}
	
	
	// http://localhost:7080/projectPMS/account.do?method=login
	
	  @GetMapping(params = "method=login")
	
		  public String login() {
			
			return "a00_account\\a00_login";
		  }

	@PostMapping(params = "method=login")
	public String login( Account log ,HttpServletRequest request, HttpServletResponse response) {
		
		/* Set Locale */
		if (request.getParameter("lang") != null) {
			SessionManager.setLang(request, response, localeResolver);
		}
		
		System.out.println("아이디:"+log.getUser_id());
		  Account ac = service.Login(log);
			if(ac!=null){//해당 값이 있으면
				HttpSession session = request.getSession();
				session.setAttribute("login", ac);
				request.setAttribute("loginSucc", "Y");
				SessionManager.setAccount(request, ac);
			}else {
				request.setAttribute("loginSucc", "N");
			}
			 service.loginDate(log); 
		return "a00_account\\a00_login";
	}
	@RequestMapping(params = "method=logout")
	public String logout(HttpServletRequest request){
		SessionManager.clearSession(request);
		return "redirect:/account.do?method=login";
	}
	
/*
	// http://localhost:7080/projectPMS/account.do?method=signin
	@RequestMapping(params = "method=signin")
	public String signin(@ModelAttribute("account") Account a) {
		
		return "a00_account\\a02_signin";
	}
	// http://localhost:7080/projectPMS/account.do?method=insert
	@RequestMapping(params = "method=insert")
	public String signinIns(Account insert, Model d) {
		service.signinIns(insert);
		
		d.addAttribute("proc", "insert");
		
		return "a00_account\\a02_signin";
	}
*/	
	
	// http://localhost:7080/projectPMS/account.do?method=info
	@RequestMapping(params = "method=info")
	public String info() {
		
		return "a00_account\\a03_info";
	}
	
	

}

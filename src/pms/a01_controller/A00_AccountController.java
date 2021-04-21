package pms.a01_controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

import pms.a02_service.A00_AccountService;
import pms.a02_service.A12_TaskService;
import pms.z01_vo.Account;
import pms.z01_vo.Project;
import pms.z01_vo.Task;
import pms.z02_util.SessionManager;

@Controller
@RequestMapping("account.do")
public class A00_AccountController {
	
	@Autowired(required = false)
	private A00_AccountService service;
	
	@Autowired(required = false)
	private LocaleResolver localeResolver;
	
	@Autowired(required = false)
	private A12_TaskService tservice;
	
	
	// http://localhost:7080/projectPMS/account.do?method=account
	@RequestMapping(params = "method=account")
	public String account(Model d) {
	ArrayList<Account> accountList = service.getAccountList();
		
		d.addAttribute("accountList", accountList);

		
		return "a00_account\\a00_login";
	}
	
	
	
	/*
	  @GetMapping(params = "method=login")
	
		  public String login() {
			
			return "a00_account\\a00_login";
		  }

		@PostMapping(params = "method=login")
	public String login( Account log ,HttpServletRequest request, HttpServletResponse response) {
		
			// Set Locale 
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
	*/
	// http://localhost:7080/projectPMS/account.do?method=login
	@RequestMapping(params = "method=login", method = RequestMethod.GET)
		
	  public String login(HttpServletRequest request, HttpServletResponse response) {
		// Set Locale 
				if (request.getParameter("lang") != null) {
					SessionManager.setLang(request, response, localeResolver);
				}
				
		return "a00_account\\a00_login";
	  }
	
	@RequestMapping(params = "method=login", method =  RequestMethod.POST)
	public String login( Account log ,HttpServletRequest request, HttpServletResponse response) {
		
			// Set Locale 
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

	// http://localhost:7080/projectPMS/account.do?method=changePassword
   @RequestMapping(params = "method=changePassword")
   public String changePassword(HttpServletRequest request, HttpServletResponse response, @RequestParam("id") int id, Model d) {
	   /* Set Locale */
		if (request.getParameter("lang") != null) {
			SessionManager.setLang(request, response, localeResolver);
		}
      return "a00_account\\a04_change_password";
   }
   // http://localhost:7080/projectPMS/account.do?method=updatePassword
    @RequestMapping(params = "method=updatePassword")
    public String updatePassword(Account update) {       
       service.updatePw(update);
       return "redirect:/account.do?method=login";
    } 
	
	// http://localhost:7080/projectPMS/account.do?method=info
	@RequestMapping(params = "method=info")
	public String info(HttpServletRequest request, HttpServletResponse response, @RequestParam("id") int id, Model d) {
		/* Set Locale */
		if (request.getParameter("lang") != null) {
			SessionManager.setLang(request, response, localeResolver);
		}
		
		Account account = service.getAccount(id);
		d.addAttribute("account", account);
		
		ArrayList<Task> taskList = tservice.getTaskUser(id);
		d.addAttribute("taskList", taskList);
		
		int count1 = 0;
		int count2 = 0;
		d.addAttribute("cnt1",service.taskCount1(id));
		d.addAttribute("cnt2",service.taskCount2(id));
		int tot = 0;
		tot = (count1 + count2);
		
		// ${cnt1}
		
		return "a00_account\\a03_user_info";
	}
	
	

}

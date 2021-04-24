package pms.a01_controller;



import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

import pms.a02_service.A00_AccountService;
import pms.a02_service.A02_MailService;
import pms.z01_vo.Account;
import pms.z01_vo.Email;
import pms.z02_util.SessionManager;

@Controller
@RequestMapping("account.do")
public class A02_MailController {
   @Autowired(required=false)
   private A00_AccountService aservice;
   @Autowired(required = false)
   private LocaleResolver localeResolver;
	
   
   // http://localhost:7080/projectPMS/account.do?method=loginSearch
   @RequestMapping(params = "method=loginSearch")
   public String loginSearch(HttpServletRequest request, HttpServletResponse response) {
	   /* Set Locale */
		if (request.getParameter("lang") != null) {
			SessionManager.setLang(request, response, localeResolver);
		}
		
      return "a00_account\\a01_login_search";
   }
   // http://localhost:7080/projectPMS/account.do?method=update
    @RequestMapping(params = "method=update")
    public String update(Account upt) {
       service.update_pw(upt);
       
       return "forward:/account.do?method=login";
    } // 수정 후, 다시 조회 처리할 수 있게 하기 위하여 forward로
      // 해당 controller 기능 메서드 호출
   
   
   @Autowired(required=false)
   private A02_MailService service;
   // 메일발송
   // http://localhost:7080/projectPMS/account.do?method=send
   @RequestMapping(params="method=send")
   public String send(Account account, Email send, Model d) throws MessagingException{
      
      System.out.println(account.getName());
      System.out.println(send.getReceiver());
      
      int result = service.sendMail(account.getName(), send);
      if (result == 1) {
         d.addAttribute("result", "success");
      } else if (result == -1) {
         d.addAttribute("result", "failToFind");
      }
      
      // 메일 전송을 service단에서 처리
      return "a00_account\\a01_login_search";
   }
   
   // http://localhost:7080/projectPMS/account.do?method=signin
	@RequestMapping(params = "method=signin")
	public String signin(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("account") Account a) {
		/* Set Locale */
		if (request.getParameter("lang") != null) {
			SessionManager.setLang(request, response, localeResolver);
		}
		return "a00_account\\a02_signin";
	}
	
	   // http://localhost:7080/projectPMS/account.do?method=insert
	@RequestMapping(params = "method=insert")
	public String signinIns(Account insert) {
		service.signinIns(insert);
		return "forward:/account.do?method=login";
	}
	

	// http://localhost:7080/projectPMS/account.do?method=send2
	@RequestMapping(params="method=send2")
	public String send2(Account account, Model d) throws MessagingException{

		service.sendMail2(account);
		
		d.addAttribute("result", "success");
			
		return "a00_account\\a02_signin";
	}	
	
	   @PostMapping(params="method=hasMember")
	   public String hasMember(@RequestParam(value="user_id", defaultValue="") String user_id, Model d) {
		   System.out.println(user_id);
		   d.addAttribute("mCnt", aservice.schMember(user_id));
		   return "pageJsonReport";
	   } 

}

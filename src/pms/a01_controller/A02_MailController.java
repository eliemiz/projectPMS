package pms.a01_controller;

import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pms.a02_service.A00_AccountService;
import pms.a02_service.A02_MailService;
import pms.z01_vo.Account;
import pms.z01_vo.Email;

@Controller
@RequestMapping("account.do")
public class A02_MailController {
	
	
	// http://localhost:7080/projectPMS/account.do?method=loginSearch
	@RequestMapping(params = "method=loginSearch")
	public String loginSearch() {
		
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
	public String send(Email send) throws MessagingException{
		System.out.println(send.getSubject());
		service.sendMail(send);
		// 메일 전송을 service단에서 처리
		return "a00_account\\a01_login_search";
	}
	 

	
}

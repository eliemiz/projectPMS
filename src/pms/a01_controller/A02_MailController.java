package pms.a01_controller;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A02_MailService;
import pms.z01_vo.Email;

@Controller
@RequestMapping("account.do")
public class A02_MailController {
	
	
	// http://localhost:7080/projectPMS/account.do?method=loginSearch
	@RequestMapping(params = "method=loginSearch")
	public String loginSearch() {
		
		return "a00_account\\a01_login_search";
	}
	
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

package pms.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A02_AdminService;

@Controller
@RequestMapping("admin.do")
public class A02_AdminUserController {
	@Autowired(required = false)
	private A02_AdminService service;
	
	// http://localhost:7080/projectPMS/admin.do
	@RequestMapping
	public String main() {
		return "a02_admin\\a00_adminMain";
	}
	
	// http://localhost:7080/projectPMS/admin.do?method=list
	@RequestMapping( params = "method=list")
	public String userList() {
		return "a02_admin\\a01_userList";
	}
	// http://localhost:7080/projectPMS/admin.do?method=insForm
	@RequestMapping( params = "method=insForm")
	public String userInsForm() {
		return "a02_admin\\a02_userIns";
	}
	// http://localhost:7080/projectPMS/admin.do?method=detail
	@RequestMapping( params = "method=detail")
	public String userDetail() {
		return "a02_admin\\a03_userDetail";
	}
	
	
	
	

		
		
		
		

	
}


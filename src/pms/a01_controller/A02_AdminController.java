package pms.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A02_AdminService;

@Controller
@RequestMapping("admin.do")
public class A02_AdminController {
	@Autowired(required = false)
	private A02_AdminService service;
	
	
	// http://localhost:7080/projectPMS/admin.do?method=userlist
	@RequestMapping( params = "method=userlist")
	public String userList() {
		return "a02_admin\\a01_userList";
	}
	
	
	
	
	
	
	// http://localhost:7080/projectPMS/admin.do?method=grouplist
	@RequestMapping( params = "method=grouplist")
	public String groupList() {
		return "a02_admin\\a04_groupList";
	}
	
}


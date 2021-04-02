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
	
	// http://localhost:7080/projectPMS/admin.do
	@RequestMapping
	public String main() {
		return "a02_admin\\a00_adminMain";
	}
	
	// http://localhost:7080/projectPMS/admin.do?method=userList
	@RequestMapping( params = "method=userList")
	public String userList() {
		return "a02_admin\\a01_userList";
	}
	// http://localhost:7080/projectPMS/admin.do?method=userInsForm
	@RequestMapping( params = "method=userInsForm")
	public String userInsForm() {
		return "a02_admin\\a02_userIns";
	}
	// http://localhost:7080/projectPMS/admin.do?method=userDetail
	@RequestMapping( params = "method=userDetail")
	public String userDetail() {
		return "a02_admin\\a03_userDetail";
	}
	
	
	
	
	
	// http://localhost:7080/projectPMS/admin.do?method=groupList
	@RequestMapping( params = "method=groupList")
	public String groupList() {
		return "a02_admin\\a04_groupList";
	}
	
	// http://localhost:7080/projectPMS/admin.do?method=groupInsForm
	@RequestMapping( params = "method=groupInsForm")
	public String groupInsForm() {
		return "a02_admin\\a05_groupIns";
	}
	// http://localhost:7080/projectPMS/admin.do?method=groupDetail
		@RequestMapping( params = "method=groupDetail")
		public String groupDetail() {
			return "a02_admin\\a06_groupDetail";
		}
		// http://localhost:7080/projectPMS/admin.do?method=gUser
		@RequestMapping( params = "method=gUser")
		public String groupUser() {
			return "a02_admin\\a07_groupUser";
		}
		// http://localhost:7080/projectPMS/admin.do?method=gUserIns
		@RequestMapping( params = "method=gUserIns")
		public String groupUserIns() {
			return "a02_admin\\a08_groupUserIns";
		}
		// http://localhost:7080/projectPMS/admin.do?method=gUserDel
		@RequestMapping( params = "method=gUserDel")
		public String groupUserDel() {
			return "a02_admin\\a09_groupUserDel";
		}

		
		
		
		// http://localhost:7080/projectPMS/admin.do?method=roleList
		@RequestMapping( params = "method=roleList")
		public String roleList() {
			return "a02_admin\\a10_roleList";
		}
		// http://localhost:7080/projectPMS/admin.do?method=roleInsForm
		@RequestMapping( params = "method=roleInsForm")
		public String roleInsForm() {
			return "a02_admin\\a11_roleIns";
		}
		// http://localhost:7080/projectPMS/admin.do?method=roleDetail
		@RequestMapping( params = "method=roleDetail")
		public String roleDetail() {
			return "a02_admin\\a12_roleDetail";
		}

	
}


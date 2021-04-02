package pms.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin3.do")
public class A04_AdminRoleController {

	
	
	// http://localhost:7080/projectPMS/admin3.do?method=list
			@RequestMapping( params = "method=list")
			public String roleList() {
				return "a02_admin\\a10_roleList";
			}
			// http://localhost:7080/projectPMS/admin3.do?method=insForm
			@RequestMapping( params = "method=insForm")
			public String roleInsForm() {
				return "a02_admin\\a11_roleIns";
			}
			// http://localhost:7080/projectPMS/admin3.do?method=detail
			@RequestMapping( params = "method=detail")
			public String roleDetail() {
				return "a02_admin\\a12_roleDetail";
			}
}

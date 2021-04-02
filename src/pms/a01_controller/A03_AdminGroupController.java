package pms.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin2.do")
public class A03_AdminGroupController {

	
	
	// http://localhost:7080/projectPMS/admin2.do?method=list
		@RequestMapping( params = "method=list")
		public String groupList() {
			return "a02_admin\\a04_groupList";
		}
		
		// http://localhost:7080/projectPMS/admin2.do?method=insForm
		@RequestMapping( params = "method=insForm")
		public String groupInsForm() {
			return "a02_admin\\a05_groupIns";
		}
		// http://localhost:7080/projectPMS/admin2.do?method=detail
			@RequestMapping( params = "method=detail")
			public String groupDetail() {
				return "a02_admin\\a06_groupDetail";
			}
			// http://localhost:7080/projectPMS/admin2.do?method=gUser
			@RequestMapping( params = "method=gUser")
			public String groupUser() {
				return "a02_admin\\a07_groupUser";
			}
			// http://localhost:7080/projectPMS/admin2.do?method=gUserInsForm
			@RequestMapping( params = "method=gUserInsForm")
			public String groupUserIns() {
				return "a02_admin\\a08_groupUserIns";
			}
			// http://localhost:7080/projectPMS/admin2.do?method=gUserDel
			@RequestMapping( params = "method=gUserDel")
			public String groupUserDel() {
				return "a02_admin\\a09_groupUserDel";
			}
}

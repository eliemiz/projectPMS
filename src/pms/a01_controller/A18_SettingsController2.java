package pms.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("settings2.do")
public class A18_SettingsController2 {

	// http://localhost:7080/projectPMS/settings2.do?method=pUserList
		@RequestMapping( params = "method=pUserList")
		public String proUserList() {
			return "a17_settings\\a01_proUser";
		}
		// http://localhost:7080/projectPMS/settings2.do?method=pUserDel
		@RequestMapping( params = "method=pUserDel")
		public String proUserDel() {
			return "a17_settings\\a02_proUserDel";
		}
		// http://localhost:7080/projectPMS/settings2.do?method=pUserInsList
		@RequestMapping( params = "method=pUserInsList")
		public String proUserInsList() {
			return "a17_settings\\a03_proUserInsList";
		}
		// http://localhost:7080/projectPMS/settings2.do?method=pUserIns
		@RequestMapping( params = "method=pUserIns")
		public String proUserIns() {
			return "a17_settings\\a04_proUserIns";
		}
		
		// http://localhost:7080/projectPMS/settings2.do?method=task
		@RequestMapping( params = "method=task")
		public String task() {
			return "a17_settings\\a05_task";
		}
}

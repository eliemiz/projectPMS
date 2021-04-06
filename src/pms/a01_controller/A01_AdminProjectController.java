package pms.a01_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("aProject.do")
public class A01_AdminProjectController {

	
	// http://localhost:7080/projectPMS/aProject.do
	// http://localhost:7080/projectPMS/aProject.do?method=clone
	// http://localhost:7080/projectPMS/aProject.do?method=delete
	// http://localhost:7080/projectPMS/aProject.do?method=insert
		@RequestMapping
		public String aProject() {
			
			return "a01_project\\a02_projectList";
		}
}

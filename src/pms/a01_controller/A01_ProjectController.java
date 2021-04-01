package pms.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A01_ProjectService;

@Controller
@RequestMapping("project.do")
public class A01_ProjectController {
	@Autowired(required = false)
	private A01_ProjectService service;
	
	
	// http://localhost:7080/projectPMS/project.do?method=projectList
	@GetMapping(params = "method=projectList")
	public String ProjectList() {
		return "a01_project\\a00_projectList";
	}
	// http://localhost:7080/projectPMS/project.do?method=mgtList
	@GetMapping(params = "method=mgtList")
	public String MgtList() {
		return "a01_project\\a01_mgtList";
	}
	// http://localhost:7080/projectPMS/project.do?method=projectMgt
	@GetMapping(params = "method=projectMgt")
	public String ProjectMgt() {
		return "a01_project\\a02_projectMgt";
	}
	// http://localhost:7080/projectPMS/project.do?method=projectIns
	@GetMapping(params = "method=projectIns")
	public String ProjectIns() {
		return "a01_project\\a03_projectIns";
	}
	// http://localhost:7080/projectPMS/project.do?method=projectDel
	@GetMapping(params = "method=projectDel")
	public String ProjectDel() {
		return "a01_project\\a04_projectDel";
	}
	// http://localhost:7080/projectPMS/project.do?method=activity
	@GetMapping(params = "method=activity")
	public String Activity() {
		return "a01_project\\a05_activity";
	}
	
}
